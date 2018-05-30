clear all
close
clc


%=============INPUT  VARIABEL==============%
n = 5; % N-PENDULUM

g = 10; % GRAVITATIONAL CONSTANTS
l = 2; % PENDULUM LENGTH-SEGMENT

t = 20; % TIME
%===========EXTRACT CONSTANTS=============%
for i = 1:n
  for j = 1:n
    a(i,j) = (n-max(i,j)+1);
  end
  b(i,1) = -(n-i+1)*g/l;
end

c = inv(a);

for i = 1:n
  for j = 1:n
const(i,j) = c(i,j)*b(j,1);
  end
end

%===========INITIAL VALUE=============%
for i = 2:2*n-1
    k(1) = 0.5;
    if i <= n
        k(i+1) = 0; % Initial value theta
    else
        k(i+1) = 0; % Initial value theta dot
    end
end

for i = 1:2*n
    init(i,1) = k(i);
end     

%============ODE45 SOLVER==============%
f = @(t,x) theta(n,x,const);
[t,x] = ode45(f,[0 t],init);
const;
figure
for k = 1:n
    thetas(:,k) = x(:,k);
end;

%============Plotter==============%

duration = 200;
fps = 10;

nframes=duration*fps;
t = linspace(0,duration,nframes);

[r, n] = size(thetas);


h=plot(0,0,'MarkerSize',30,'Marker','.','LineWidth',n);
range=2*(l*n); 
axis([-range range -range range]); 
axis square;
set(gca,'nextplot','replacechildren');

for i=1:r-1
    if (ishandle(h)==1)
        current_x = 0;
        current_y = 0;
        x_coord = [];
        y_coord = [];
        
        for j=1:n-1
            x_coord = [x_coord, current_x];
            y_coord = [y_coord, current_y];
            
            
            current_x = j * l * sum(sin(thetas(r,1:j)));
            current_y = -j * l * sum(cos(thetas(r,1:j)));
        end
        
        set(h,'XData',x_coord,'YData',y_coord);
        drawnow;
        pause(t(i+1)-t(i));
    end
end

%{
plot(t,thetas(:,:))
xlabel('time(s)')
ylabel('rad')

for k = 1:n
    tet{k} = sprintf('tetew %d', k);
end;
legend(tet)

%}


