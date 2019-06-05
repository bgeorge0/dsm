function poi2 = test_endPOI(select)
    switch select
        case 'data1'
            load('data1_poi2.mat','poi2');
        case 'data2'
            load('data2_poi2.mat','poi2');
        otherwise
            load('data1_poi2.mat','poi2');
    end
end