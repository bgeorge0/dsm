function check = arrayNX3(datain)
check = isnumeric(datain) && ndims(datain) == 2 && size(datain,1) > 1 && size(datain,2) == 3;
end