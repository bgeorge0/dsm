function [xyzD, isError] = getXYZD(structNum, doseNum, planC)
%Copyright and info here

indexS  = planC{end};
optS    = planC{indexS.CERROptions};

%Get the scan number associated with the requested structure.
[scanSet, relStructNum] = getStructureAssociatedScan(structNum, planC);

ROIImageSize = [planC{indexS.scan}(scanSet).scanInfo(1).sizeOfDimension1  planC{indexS.scan}(scanSet).scanInfo(1).sizeOfDimension2];

deltaY = planC{indexS.scan}(scanSet).scanInfo(1).grid1Units;

%Get raster segments for structure.
[segmentsM, planC, isError] = getRasterSegments(structNum, planC);

if isempty(segmentsM)
    isError = 1;
end
numSegs = size(segmentsM,1);

%Relative sampling of ROI voxels in this place, compared to CT spacing.
%Set when rasterSegments are generated (usually on import).
sampleRate = optS.ROISampleRate;

%Sample the rows
indFullV =  1 : numSegs;
if sampleRate ~= 1
 rV = 1 : length(indFullV);
 rV([rem(rV+sampleRate-1,sampleRate)~=0]) = [];
 indFullV = rV;
end

%Block process to avoid swamping on large structures
if isfield(optS, 'DVHBlockSize') & ~isempty(optS.DVHBlockSize)
    DVHBlockSize = optS.DVHBlockSize;
else
    DVHBlockSize = 5000;    
end

blocks = ceil(length(indFullV)/DVHBlockSize);
xyzD = [];

start = 1;

for b = 1 : blocks

  %Build the interpolation points matrix

  dummy = zeros(1,DVHBlockSize * ROIImageSize(1));
  x1V = dummy;
  y1V = dummy;
  z1V = dummy;
  volsSectionV =  dummy;

  if start+DVHBlockSize > length(indFullV)
    stop = length(indFullV);
  else
    stop = start + DVHBlockSize - 1;
  end

  indV = indFullV(start:stop);

  mark = 1;
  for i = indV

    tmpV = segmentsM(i,1:10);
    delta = tmpV(5) * sampleRate;
    xV = tmpV(3): delta : tmpV(4);
    len = length(xV);
    rangeV = ones(1,len);
    yV = tmpV(2) * rangeV;
    zV = tmpV(1) * rangeV;
    sliceThickness = tmpV(10);
    %v = delta^2 * sliceThickness;
    v = delta * (deltaY*sampleRate) * sliceThickness;
    x1V(mark : mark + len - 1) = xV;
    y1V(mark : mark + len - 1) = yV;
    z1V(mark : mark + len - 1) = zV;
    volsSectionV(mark : mark + len - 1) = v;
    mark = mark + len;

  end

  %cut unused matrix elements
  x1V = x1V(1:mark-1);
  y1V = y1V(1:mark-1);
  z1V = z1V(1:mark-1);
  volsSectionV = volsSectionV(1:mark-1);

  %Get transformation matrices for both dose and structure.
  transMDose    = getTransM('dose', doseNum, planC);
  transMStruct  = getTransM('struct', structNum, planC);  
  
  %Forward transform the structure's coordinates.
  if ~isempty(transMStruct)
      [x1V, y1V, z1V] = applyTransM(transMStruct, x1V, y1V, z1V);
  end

  %Back transform the coordinates into the doses' coordinate system.
  if ~isempty(transMDose)  
      [x1V, y1V, z1V] = applyTransM(inv(transMDose), x1V, y1V, z1V);
  end

  %Interpolate.
  [dosesSectionV] = getDoseAt(doseNum, x1V, y1V, z1V, planC);

  xyzD = [xyzD; [x1V' y1V' z1V' dosesSectionV']];

  start = stop + 1;

end

end