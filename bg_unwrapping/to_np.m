function p = to_np(p)

if size(p,1) == 1
    p = py.numpy.array(p);
else
    p = double(p);
    sz = uint16(size(p));
    p = reshape(p,[1 numel(p)]); % Conversion to Python is only supported for 1-N vectors.
    p = py.numpy.array(p); % if empty, type is always set to double cuz of https://github.com/numpy/numpy/issues/6028
    p = p.reshape(num2cell(fliplr(sz)));
    t = uint16(0:length(sz)-1);
    t(end-[1 0]) = t(end-[0 1]);
    p = p.transpose(num2cell(t));
end
end