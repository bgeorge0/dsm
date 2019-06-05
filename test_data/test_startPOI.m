function poi1 = test_startPOI(select)
    switch select
        case 'data1'
            load('data1_poi1.mat','poi1');
        case 'data2'
            load('data2_poi1.mat','poi1');
        otherwise
            load('data1_poi1.mat','poi1');
    end
end