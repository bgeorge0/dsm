function [perim, perim_point, overlap_matrix12] = PlaneThroughSlice_UniformCircle(structXYZ, hobbyspline, Snew, xyzD, grid_res)

EQUISPLINE_PTS  =   200;
SLICES          =   30;     % Number of cross sections
SECTIONS        =   30;     % Number of pixels to produce per cross section
SPLINE_START    =   14;     % Skip the first few elements of the spline
SPLINE_FINISH   =   188;    % Skip the final few elements of the spline
SPLINE_SKIP     =   floor((SPLINE_FINISH - SPLINE_START) / (SLICES - 1));
SLICE_INDEXES   =   SPLINE_START:SPLINE_SKIP:SPLINE_FINISH;
REPLACE_CENTRES =   true;

disp(' -> Creating equispline')
equispline = interparc(EQUISPLINE_PTS, hobbyspline(:,1), hobbyspline(:,2), hobbyspline(:,3), 'spline');
% Strip out only the spline points we're interested in
CENTRES = zeros(SLICES,3);
NORMALS = zeros(SLICES,3);
for i = 1:length(SLICE_INDEXES)
    CENTRES(i,:) = equispline(SLICE_INDEXES(i),:);
    NORMALS(i,:) = (equispline(SLICE_INDEXES(i)-1,:) - equispline(SLICE_INDEXES(i)+1,:));
end

disp(' -> Checking centre points');
for i = 1:length(CENTRES)
    % NEW METHOD
    count = 0;
    while inpolyhedron(Snew, CENTRES(i,:)) == 0 && count < 3
        display(' -> -> Moving spline point inside structure');
        CENTRES(i,:) = structXYZ(knnsearch(structXYZ, CENTRES(i,:)),:);
        count = count + 1;
        if count >= 3
            display(' -> -> -> Point still outside');
        end
    end
end

if REPLACE_CENTRES
    disp(' -> Finding new centers');
    ray_dir = double.empty;
    for i = 1:length(CENTRES)
        PERIMIETER_POINTS = zeros(8,3);
        % NEW METHOD
        [~, fx, fy, fz] = circlePlane3D(CENTRES(i,:), NORMALS(i,:), norm(grid_res), (2*pi)/8, 0, 'y', '-', 0); % 0 flag, so don't plot
        ray_points = [fx', fy', fz'];
        
        for j = 1:(numel(ray_points)/3)-1
            ray_dir(j,:) = ray_points(j,:) - CENTRES(i,:);
            
            % NEW METHOD
            tol = norm(grid_res)/8;
            inc = ray_dir(j,:)*2;
            test_point = CENTRES(i,:);
            while norm(inc) > tol
                while inpolyhedron(Snew, test_point + inc)
                    test_point = test_point + inc;
                end
                inc = inc / 2;
            end
            test_point = test_point + inc / 2;
            PERIMIETER_POINTS(j,:) = test_point;
        end
        %CENTRES(i,:) = polygonCentroid3d(unique(PERIMIETER_POINTS,'rows')); % If multiple outside points are the same, strip them out
        CENTRES(i,:) = polygonCentroid3d(PERIMIETER_POINTS);
    end
end
% END OF NEW METHOD

disp(' -> Casting rays');
perim_point = cell(EQUISPLINE_PTS, SECTIONS+1); % For legacy reasons, this needs to be EQUISPLINE_PTS long
perim = cell(EQUISPLINE_PTS, SECTIONS+1);       % For legacy reasons, this needs to be EQUISPLINE_PTS long
poly_store = cell(EQUISPLINE_PTS, 1);           % For legacy reasons, this needs to be EQUISPLINE_PTS long
line_store = cell(EQUISPLINE_PTS, SECTIONS+1);  % For legacy reasons, this needs to be EQUISPLINE_PTS long
for i = 1:length(CENTRES)
    ray_dir=double.empty;
    % NEW METHOD
    [~, fx, fy, fz] = circlePlane3D(CENTRES(i,:), NORMALS(i,:), norm(grid_res), (2*pi)/SECTIONS, 0, 'y', '-', 0); % 0 flag, so don't plot
    ray_points = [fx', fy', fz'];
    
    for j=1:numel(ray_points)/3
        ray_dir(j,:) = ray_points(j,:) - CENTRES(i,:);        
        
        % NEWER METHOD
        tol = norm(grid_res)/8;
        inc = ray_dir(j,:)*2;
        test_point = CENTRES(i,:);
        count = 0;
        while norm(inc) > tol
            while inpolyhedron(Snew, test_point + inc)
                count = count + 1;
                test_point = test_point + inc;
            end
            inc = inc / 2;
        end
        test_point = test_point + inc / 2;
        
        % Save the coordinates of this point
        perim_point{SLICE_INDEXES(i),j} = test_point;
        % And the data that includes the dose
        perim{SLICE_INDEXES(i),j} = xyzD(knnsearch(xyzD(:,1:3), test_point),:);
    end
    
    poly = double.empty;
    for k=1:SECTIONS+1
        poly = vertcat(poly,perim_point{SLICE_INDEXES(i),k});
    end
    poly_store{SLICE_INDEXES(i)} = poly;
    
    for k=1:length(poly_store{SLICE_INDEXES(i)})%-1
        line_store{SLICE_INDEXES(i),k} = createLine3d(poly_store{SLICE_INDEXES(i)}(k,:), equispline(SLICE_INDEXES(i),:));
    end
end

disp(' -> Determining overlap');
for i=1:size(equispline,1)-1
    overlap_matrix12{1,i}=[];
end
for jj = length(SLICE_INDEXES):-1:1
    j = SLICE_INDEXES(jj);
    test_point = double.empty;
    for k=1:SECTIONS+1
        test_point = vertcat(test_point, perim_point{j,k});
    end
    
    for ii = length(SLICE_INDEXES):-1:1
        i = SLICE_INDEXES(ii);
        if i==j
            continue
        elseif ismember(j, overlap_matrix12{i}) == 1
            if isempty(overlap_matrix12{j}) == 1
                overlap_matrix12{j} = i;
            else
                overlap_matrix12{j} = vertcat(overlap_matrix12{j}, i);
            end
        else
            test_point2 = double.empty;
            for k=1:SECTIONS+1
                test_point2 = vertcat(test_point2, perim_point{i,k});
            end
            for k=1:SECTIONS+1
                try
                    inter = intersectLinePolygon3d(line_store{i,k}, poly_store{j});
                catch
                    disp('here')
                end
                check1 = IsInsidePolygon(inter, test_point, 1:size(test_point,1));
                check2 = IsInsidePolygon(inter, test_point2, 1:size(test_point2,1));
                if check1 == 0 || check2 == 0
                    continue
                else
                    if isempty(overlap_matrix12{j}) == 1
                        overlap_matrix12{j} = i;
                    else
                        overlap_matrix12{j} = vertcat(overlap_matrix12{j}, i);
                    end
                    break
                end
            end
        end
    end
end

disp(' -> Finding any overlap');
for j=1:size(equispline,1)-1
    for i=1:size(equispline,1)-1
        if ismember(j, overlap_matrix12{i}) == 1
            if isempty(overlap_matrix12{j}) == 1
                overlap_matrix12{j} = i;
            else
                overlap_matrix12{j} = vertcat(overlap_matrix12{j}, i);
            end
        end
    end
    overlap_matrix12{j} = unique(overlap_matrix12{j});
end

% Do some mega plotting!
if true
    disp(' -> Doing mega plotting');
    figure
    hold on
    %plot3(structXYZ(:,1),structXYZ(:,2),structXYZ(:,3),'g.');
    %plot3(equispline(:,1),equispline(:,2),equispline(:,3),'b-');
    plot3(CENTRES(:,1),CENTRES(:,2),CENTRES(:,3),'bo');
    for i = 1:length(CENTRES)
        xs = [];
        ys = [];
        zs = [];
        for j = 1:SECTIONS+1
            xs = vertcat(xs,perim_point{SLICE_INDEXES(i),j}(1));
            ys = vertcat(ys,perim_point{SLICE_INDEXES(i),j}(2));
            zs = vertcat(zs,perim_point{SLICE_INDEXES(i),j}(3));
            %line([CENTRES(i,1); perim_point{SLICE_INDEXES(i),j}(1,1)], [CENTRES(i,2); perim_point{SLICE_INDEXES(i),j}(1,2)],[CENTRES(i,3); perim_point{SLICE_INDEXES(i),j}(1,3)]);
            [IDX, ~] = knnsearch(xyzD(:,1:3), [perim_point{SLICE_INDEXES(i),j}(1) perim_point{SLICE_INDEXES(i),j}(2) perim_point{SLICE_INDEXES(i),j}(3)], 'K', 3);
            %fill3(xyzD(IDX,1),xyzD(IDX,2),xyzD(IDX,3),(xyzD(IDX,4)));
            A = [perim_point{SLICE_INDEXES(i),j}(1), perim_point{SLICE_INDEXES(i),j}(2), perim_point{SLICE_INDEXES(i),j}(3)];
            B = [CENTRES(i,1) - perim_point{SLICE_INDEXES(i),j}(1), CENTRES(i,2)-perim_point{SLICE_INDEXES(i),j}(2), CENTRES(i,3)-perim_point{SLICE_INDEXES(i),j}(3)];
            C =  norm(grid_res)./2;
            D = (2*pi)/8;
            E = 0;
            F = [xyzD(IDX(1),4)./max(xyzD(:,4)), xyzD(IDX(1),4)./max(xyzD(:,4)), xyzD(IDX(1),4)./max(xyzD(:,4))];
            G = '-';
            H = 1;
            circlePlane3D(A,B,C,D,E,F,G,H);
            %circlePlane3D([perim_point{SLICE_INDEXES(i),j}(1), perim_point{SLICE_INDEXES(i),j}(2), perim_point{SLICE_INDEXES(i),j}(3)], [CENTRES(i,1) - perim_point{SLICE_INDEXES(i),j}(1), CENTRES(i,2)-perim_point{SLICE_INDEXES(i),j}(2), CENTRES(i,3)-perim_point{SLICE_INDEXES(i),j}(3)], norm(grid_res)./2, [xyzD(IDX,4)./max(xyzD(:,4)), xyzD(IDX,4)./max(xyzD(:,4)), xyzD(IDX,4)./max(xyzD(:,4))], '-', 0);
        end
        if isempty(overlap_matrix12{SLICE_INDEXES(i)})
            plot3(xs,ys,zs,'r-')
        else
            plot3(xs,ys,zs,'kx-')
        end            
    end
    for i = 1:size(equispline,1)-1
        campos(equispline(i,1:3));
        camtarget(equispline(i+1,1:3));
        camva(120)
        drawnow;
        pause(.5);
    end
    drawnow;% pause
end