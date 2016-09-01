function dosemap = unwrap_dummy(xyzD, xyz, startPOI, endPOI)
if ~arrayNX4(xyzD)
    error('dosemap:IncorrectInputs','xyzD must be array N x 4'); 
end
if ~arrayNX3(xyz)
    error('dosemap:IncorrectInputs','xyz must be array N x 3'); 
end
if ~pointX3(startPOI)
    error('dosemap:IncorrectInputs','startPOI must be array 1 x 3'); 
end
if ~pointX3(endPOI)
    error('dosemap:IncorrectInputs','endPOI must be array 1 x 3'); 
end

dosemap = DSM_foo([]);
end