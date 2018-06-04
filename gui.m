function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 04-Jun-2018 22:38:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%initialize_gui(hObject, handles, false);
% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function pendulumamount_Callback(hObject, eventdata, handles)
% hObject    handle to pendulumamount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pendulumamount as text
%        str2double(get(hObject,'String')) returns contents of pendulumamount as a double
n = str2double(get(hObject, 'String'));
if isnan(n)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.metricdata.n = n;
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function pendulumamount_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pendulumamount (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.metricdata.n = str2double(get(hObject, 'String'));
guidata(hObject,handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gravity_Callback(hObject, eventdata, handles)
% hObject    handle to gravity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gravity as text
%        str2double(get(hObject,'String')) returns contents of gravity as a double
g = str2double(get(hObject, 'String'));
if isnan(g)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.metricdata.g = g;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function gravity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gravity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.metricdata.g = str2double(get(hObject, 'String'));
guidata(hObject,handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function segmentlength_Callback(hObject, eventdata, handles)
% hObject    handle to segmentlength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of segmentlength as text
%        str2double(get(hObject,'String')) returns contents of segmentlength as a double
l = str2double(get(hObject, 'String'));
if isnan(l)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.metricdata.l = l;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function segmentlength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to segmentlength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.metricdata.l = str2double(get(hObject, 'String'));
guidata(hObject,handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function initialangle_Callback(hObject, eventdata, handles)
% hObject    handle to initialangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of initialangle as text
%        str2double(get(hObject,'String')) returns contents of initialangle as a double
theta_init = str2double(get(hObject, 'String'));
if isnan(theta_init)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.metricdata.theta_init = theta_init;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function initialangle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to initialangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.metricdata.theta_init = str2double(get(hObject, 'String'));
guidata(hObject,handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function time_Callback(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time as text
%        str2double(get(hObject,'String')) returns contents of time as a double
t = str2double(get(hObject, 'String'));
if isnan(t)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

handles.metricdata.t = t;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.metricdata.t = str2double(get(hObject, 'String'));
guidata(hObject,handles)

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global start_flag;
start_flag = start_flag + 1;

n = handles.metricdata.n; % n-pendulum

g = handles.metricdata.g; % Gravitational constants
l = handles.metricdata.l; % Segment length
theta_init = handles.metricdata.theta_init; % Initial theta
t = handles.metricdata.t; % TIMEas

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

for x = 1:n
    k(x) = theta_init;
end

% Initial value
for i = 2:2*n-1
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
duration = 20;
fps = 10;
nframes=duration*fps;
time = linspace(0,duration,nframes);

% Get r as row size, n as pendulum amount.
[r, n] = size(thetas);

% Set frequency plot
axes(handles.freqaxes);
plot(t,thetas(:,:))
xlabel('time(s)')
ylabel('rad')

for k = 1:n
    tet{k} = sprintf('thetas %d', k);
end;
legend(tet)

% Set pendulum plot with marker and rope.
axes(handles.pendulumaxes);
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
% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
waitfor(msgbox('Sim Paused, press OK to resume', 'Paused'));
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% initialize_gui(gcbf, handles, true);
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
