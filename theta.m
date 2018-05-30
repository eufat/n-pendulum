function xd = theta(m,x,const)

for k = 1:m
    xd(k,1) = 0;
    xd(k+m,1) = 0;
end;

for k = 1:m
   xd(k,1) = x(k+m);
end;

for k = 1:m
    for j = 1:m
        xd(k+m,1) = xd(k+m,1) + const(k,j)*x(j);
    end;
end;

 