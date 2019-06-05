function C = from_np(A)

shape = cellfun(@int64,cell(A.shape));
ls = py.array.array('d',A.flatten('F').tolist());
p = double(ls);
C = reshape(p,shape);

end