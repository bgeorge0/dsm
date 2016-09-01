function check = arrayNX4(datain)
check = isnumeric(datain) && ndims(datain) == 2 && size(datain,1) > 1 && size(datain,2) == 4;
end