function [dosemap, x_dist, y_dist] = Unwrapping(xyzD, Snew, perim, perim_point)

centroid = [mean(xyzD(:,1)), mean(xyzD(:,2)), mean(xyzD(:,3))];

while inpolyhedron(Snew, centroid) == 1
    %display('Moving centroid out of structure');
    centroid = [centroid(1)+0.5, centroid(2)+0.5, centroid(3)];
end
centroid=[centroid(1)+1, centroid(2)+1, centroid(3)];
%centroid = [8,-3.25,-1.25];
%centroid = [1.516,-3.535,-4.25]; % Used for oesoph

idx = double.empty;
band = double.empty;
band_adj = double.empty;
band_shift = double.empty;
actual_points = {};

j=1;
for i=14:6:188

    if isempty(perim{i,1}) == 1
        display('skipped');
        continue;
    end
    
    band = vertcat(band, perim{i,1:end-1}); %to account for repeat point at end that makes it circular????
    %band_list = cell2mat(band');
    
    idx = vertcat(idx,knnsearch(band(:,1:3), centroid));
    
    band_adj{i-1}= band;
    
    band = double.empty;
    
    actual_points(j,:) = perim_point(i,:);
    j=j+1;
end

actual_points(:,31)=[];
band_adj=band_adj(~cellfun('isempty',band_adj));
for i=1:numel(idx)
    marker = idx(i);
%     band_shift{i} = circshift(band_adj{i}, (size(band_adj{i},1)-marker+1));
%     band_shift{i} = circshift(band_shift{i}, (size(band_shift{i},1)/2));
    band_shift{i} = circshift(band_adj{i}, ((size(band_adj{i},1))/2)+1-marker);
    %a = actual_points(i,:);
    actual_points_shift(i,:) = circshift(actual_points(i,:), [0,((size(actual_points,1))/2)+1-marker]);
end

%band_shift = band_shift(~cellfun('isempty',band_shift));

%%%%%Calculate average circumference pixel to size map%%%%%
%Calculate perimeter of each band
%Instead of calculating a pixel to size map for the distance between each
%point, find the perimeter of each band and divide by number of angles
%(30). The take the average across all bands to set as the x direction
%pixel to size map
% perimeter = double.empty;
% for i=1:size(band_shift,2)
%     for j=1:size(band_shift{i},1)-1
%         perimeter =  vertcat(perimeter, norm(band_shift{i}(j,1:3)-band_shift{i}(j+1,1:3)));
%         if j == size(band_shift{i},1)-1
%             perimeter = vertcat(perimeter, norm(band_shift{i}(j+1,1:3)-band_shift{i}(1,1:3)));
%         end
%     end
% end
% av_pixel_length_x_map = mean(perimeter); 
%%%%%%%%%%

%%%%%CALCULATE SPECIFIC PIXEL TO SIZE MAP MOVING AROUND CIRCUMFERENCE%%%%%
% x_dist = double.empty;
% for i=1:size(band_shift,2)
%     for j=1:size(band_shift{1},1)
%         if j==1
%             dist = norm(band_shift{i}(j+1,1:3) - band_shift{i}(j,1:3));
%             x_dist{i}(j) = dist;
%         elseif j==size(band_shift{1},1)
%             dist = norm(band_shift{i}(j,1:3)-band_shift{i}(j-1,1:3));
%             x_dist{i}(j) = dist;
%         else
%             dist = norm(band_shift{i}(j+1,1:3) - band_shift{i}(j,1:3));
%             x_dist{i}(j) = (0.5*dist)+(0.5*x_dist{i}(j-1));
%         end
%     end
% end
%%%%%%%%%%

%%%%%CALCULATE SPECIFIC PIXEL TO SIZE MAP MOVING AROUND CIRCUMFERENCE - USING RAY LOCATION INSTEAD OF NEAREST DOSE POINT%%%%%
x_dist = double.empty;
for i=1:size(actual_points_shift,1)
    for j=1:size(actual_points_shift,2)
        if j==1
            dist1 = norm(actual_points_shift{i,j+1}-actual_points_shift{i,j});
            dist2 = norm(actual_points_shift{i,j}-actual_points_shift{i,size(actual_points_shift,2)-1});
            x_dist(i,j) = (0.5*dist1) + (0.5*dist2);
        elseif j == size(actual_points_shift,2)
            dist1 = norm(actual_points_shift{i,j}-actual_points_shift{i,j-1});
            dist2 = norm(actual_points_shift{i,1}-actual_points_shift{i,j});
            x_dist(i,j) = (0.5*dist1) + (0.5*dist2);
        else
            dist1 = norm(actual_points_shift{i,j+1}-actual_points_shift{i,j});
            dist2 = norm(actual_points_shift{i,j}-actual_points_shift{i,j-1});
            x_dist(i,j) = (0.5*dist1) + (0.5*dist2);
        end
    end
end
%%%%%%%%%%

% %%%%%CALCULATE PIXEL TO SIZE MAP MOVING THROUGH CENTRAL AXIS%%%%%
% %%%%%for use in comparisons only - less accurate%%%%%
% xdistances = double.empty;
% for i=1:size(band_shift,2)
%     for j=1:size(band_shift{i},1)-1
%         %perimeter =  vertcat(perimeter, norm(band_shift{i}(j+1,1:3)-band_shift{i}(j,1:3)));
%         if j ==1
%             xdistances{i} = norm(band_shift{i}(j+1,1:3)-band_shift{i}(j,1:3));
%         elseif j == size(band_shift{i},1)
%             xdistances{i} = xdistances{i} + norm(band_shift{i}(1,1:3)-band_shift{i}(j,1:3));
%         else
%             xdistances{i} = xdistances{i} + norm(band_shift{i}(j+1,1:3)-band_shift{i}(j,1:3));
%         end
%     end
%     xdistances{i} = xdistances{i}/30;
% end
% xdistances = cell2mat(xdistances);
% 
% 
% %%%%%%%%%%


%%%%%CALCULATE SPECIFIC PIXEL TO SIZE MAP MOVING THROUGH STRUCTURE%%%%%
% y_dist=double.empty;
% for i=1:size(band_shift{1},1)
%     for j=1:size(band_shift,2)
%         if j==1
%             dist = norm(band_shift{j+1}(i,1:3)-band_shift{j}(i,1:3));
%             y_dist{i}(j) = dist;
%         elseif j==size(band_shift,2)
%             dist = norm(band_shift{j}(i,1:3)-band_shift{j-1}(i,1:3));
%             y_dist{i}(j) = dist;
%         else
%             dist = norm(band_shift{j+1}(i,1:3)-band_shift{j}(i,1:3));
%             y_dist{i}(j) = (0.5*dist)+(0.5*y_dist{i}(j-1));
%         end
%     end
% end
%%%%%%%%%%

%%%%%CALCULATE SPECIFIC PIXEL TO SIZE MAP MOVING THROUGH STRUCTURE - USING RAY LOCATION INSTEAD OF NEAREST DOSE POINT%%%%%
y_dist = double.empty;
for i=1:size(actual_points_shift,1)
    for j=1:size(actual_points_shift,2)-1
        if i == 1
            dist1 = norm(actual_points_shift{i+1,j}-actual_points_shift{i,j});
            y_dist(i,j) = dist1; 
        elseif i == size(actual_points_shift,1)
            dist2 = norm(actual_points_shift{i,j}-actual_points_shift{i-1,j});
            y_dist(i,j) = dist2; 
        else
            dist1 = norm(actual_points_shift{i+1,j}-actual_points_shift{i,j});
            dist2 = norm(actual_points_shift{i,j}-actual_points_shift{i-1,j});
            y_dist(i,j) = (0.5*dist1) + (0.5*dist2); 
        end
    end
end
%%%%%%%%%%

% %%%%%CALCULATE PIXEL TO SIZE MAP MOVING THROUGH CENTRAL AXIS%%%%%
% %%%%%for use in comparisons only - less accurate%%%%%
% ydistances=double.empty;
% for i=1:30
%     %distances = vertcat(distances, norm(equispline(selected_point(i+1))-equispline(selected_point(i))));
%     if i==1
%         ydistances = norm(equispline(selected_point(i+1))-equispline(selected_point(i)));
%     elseif i==30
%         ydistances = vertcat(ydistances, norm(equispline(selected_point(i))-equispline(selected_point(i-1))));
%     else
%         ydistances = vertcat(ydistances, 0.5*(norm(equispline(selected_point(i+1))-equispline(selected_point(i))))+0.5*(ydistances(i-1)));
%     end
% end
% %%%%%%%%%%

dosemap=double.empty;
for i=1:size(band_shift,2)
    dosemap = vertcat(dosemap,band_shift{i}(:,4)');
end
%imagesc(dosemap);
%set(gca, 'YDir', 'normal');