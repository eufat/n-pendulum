clear all
close
clc

% Input variables
n = 4; % n-pendulum

g = 9.81; % Gravitational constants
l = 30; % Segment length
theta_init = 0; % Initial theta
t = 20; % TIME
% Extract Constants
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

% Initial value
for i = 2:2*n-1
    k(1) = theta_init;
    if i <= n
        k(i+1) = 0; % Initial value theta
    else
        k(i+1) = 0; % Initial value theta dot
    end
end

for i = 1:2*n
    init(i,1) = k(i);
end     

% ODE45 Solver
f = @(t,x) theta(n,x,const);
[t,x] = ode45(f,[0 t],init);
const;
figure
for k = 1:n
    thetas(:,k) = x(:,k);
end;


% Set duration, fps and t with linear spacing
duration = t;
fps = 10;
nframes=duration*fps;
time = linspace(0,duration,nframes);

% Get r as row size, n as pendulum amount.
[r, n] = size(thetas);

% Set plot with marker and rope.
h=plot(0,0,'MarkerSize',30,'Marker','.','LineWidth',n);
range=(l*n);
axis([-range range -range range]);
axis square;

% Set new current axes nextplot to be replaced.
set(gca,'nextplot','replacechildren');

for row=1:r-1
    if (ishandle(h)==1) % If chart object
        current_x = 0;
        current_y = 0;
        x_coord = [];
        y_coord = [];

        for j=1:n
            % Push to array
            x_coord = [x_coord, current_x];
            y_coord = [y_coord, current_y];

            % Set current pendulum x and y point
            current_x = l * sum(sin(thetas(row,1:j)));
            current_y = -1 * l * sum(cos(thetas(row,1:j)));
        end

        % Draw x and y coordinates
        set(h,'XData',x_coord,'YData',y_coord);
        drawnow;

        % Pause every delta t
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


