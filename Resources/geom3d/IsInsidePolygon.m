function value = IsInsidePolygon(Point,Corners,Order)
value = 0;

Basis1 = Corners(Order(2),:)-Corners(Order(1),:);
Basis1 = Basis1/VectorLength(Basis1);

Basis2 = Corners(Order(3),:)-Corners(Order(1),:)-dot(Corners(Order(3),:)-Corners(Order(1),:),Basis1)*Basis1;
Basis2 = Basis2/VectorLength(Basis2);

vertx = zeros(1,length(Order));
verty = zeros(1,length(Order));

for i = 1:length(Order)
    vertx(i) = dot(Corners(Order(i),:),Basis1);
    verty(i) = dot(Corners(Order(i),:),Basis2);
end

testx = dot(Point,Basis1);
testy = dot(Point,Basis2);

nvert = length(vertx);

for i = 1:nvert
    j = 1+mod(nvert+(i-2),nvert);
    
    if ( ((verty(i)>testy) ~= (verty(j)>testy)) && (testx < (vertx(j)-vertx(i)) * (testy-verty(i)) / (verty(j)-verty(i)) + vertx(i)) )
        value = not(value);
    end
end
end