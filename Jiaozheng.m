function varargout = Jiaozheng(varargin)
% JIAOZHENG MATLAB code for Jiaozheng.fig
%      JIAOZHENG, by itself, creates a new JIAOZHENG or raises the existing
%      singleton*.
%
%      H = JIAOZHENG returns the handle to a new JIAOZHENG or the handle to
%      the existing singleton*.
%
%      JIAOZHENG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JIAOZHENG.M with the given input arguments.
%
%      JIAOZHENG('Property','Value',...) creates a new JIAOZHENG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Jiaozheng_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Jiaozheng_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Jiaozheng

% Last Modified by GUIDE v2.5 17-Jan-2023 13:34:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Jiaozheng_OpeningFcn, ...
                   'gui_OutputFcn',  @Jiaozheng_OutputFcn, ...
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


% --- Executes just before Jiaozheng is made visible.
function Jiaozheng_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Jiaozheng (see VARARGIN)

% Choose default command line output for Jiaozheng
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global y;
global t;
global sys1;

% UIWAIT makes Jiaozheng wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Jiaozheng_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in step.
function step_Callback(hObject, eventdata, handles)
% hObject    handle to step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
step_ini=str2num(get(handles.start,'String'));
step_end=str2num(get(handles.End,'String'));
gs_num=str2num(get(handles.num,'String'));
gs_deno=str2num(get(handles.deno1,'String'));
opt = stepDataOptions('InputOffset',step_ini,'StepAmplitude',step_end-step_ini);  %设置阶跃幅值
axes(handles.time_response);
cla reset;
global sys1;
global sys;
global y;
global t;
sys=tf(gs_num,gs_deno);
sys1=feedback(sys,1);
[y,t]=step(sys1,opt);
plot(t,y,'b')
grid on;
grid minor;
hold on;
axes(handles.Bode)
cla reset;
margin(sys)
grid on;
hold on;
% --- Executes on button press in time_analyze.
function time_analyze_Callback(hObject, eventdata, handles)
% hObject    handle to time_analyze (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.show,'String','Result in the command line!');
global sys1;
res1(sys1)


function num_Callback(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num as text
%        str2double(get(hObject,'String')) returns contents of num as a double
gs_num=str2num(get(handles.num,'String'));
gs_deno=str2num(get(handles.deno1,'String'));
str_func=show_trans_func(gs_num,gs_deno);
str_func=sprintf('%s',str_func);
set(handles.GS_show,'String',str_func);

% --- Executes during object creation, after setting all properties.
function num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function End_Callback(hObject, eventdata, handles)
% hObject    handle to End (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of End as text
%        str2double(get(hObject,'String')) returns contents of End as a double


% --- Executes during object creation, after setting all properties.
function End_CreateFcn(hObject, eventdata, handles)
% hObject    handle to End (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of start as text
%        str2double(get(hObject,'String')) returns contents of start as a double


% --- Executes during object creation, after setting all properties.
function start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
close(gcf);
main



function last_Callback(hObject, eventdata, handles)
% hObject    handle to last (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of last as text
%        str2double(get(hObject,'String')) returns contents of last as a double


% --- Executes during object creation, after setting all properties.
function last_CreateFcn(hObject, eventdata, handles)
% hObject    handle to last (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1



function cnum_Callback(hObject, eventdata, handles)
% hObject    handle to cnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cnum as text
%        str2double(get(hObject,'String')) returns contents of cnum as a double
cs_num=str2num(get(handles.cnum,'String'));
cs_deno=str2num(get(handles.cdeno,'String'));
str_func=show_trans_func(cs_num,cs_deno);
str_func=sprintf('%s',str_func);
set(handles.CS_show,'String',str_func);

% --- Executes during object creation, after setting all properties.
function cnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cdeno_Callback(hObject, eventdata, handles)
% hObject    handle to cdeno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cdeno as text
%        str2double(get(hObject,'String')) returns contents of cdeno as a double
cs_num=str2num(get(handles.cnum,'String'));
cs_deno=str2num(get(handles.cdeno,'String'));
str_func=show_trans_func(cs_num,cs_deno);
str_func=sprintf('%s',str_func);
set(handles.CS_show,'String',str_func);

% --- Executes during object creation, after setting all properties.
function cdeno_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cdeno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in add_jz_step.
function add_jz_step_Callback(hObject, eventdata, handles)
% hObject    handle to add_jz_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sys;
global y;
global t;
global GcS;
t=0:0.01:12;
cs_num=str2num(get(handles.cnum,'String'));
cs_deno=str2num(get(handles.cdeno,'String'));
axes(handles.time_response);
CS=tf(cs_num,cs_deno);
Gcs=series(CS,sys);    %串联原传函以及校正网络，并反馈
GcS=feedback(Gcs,1);   %保存校正后网络数据，用于计算时域响应
[y,t]=step(GcS,t);
plot(t,y,'r');
legend({'Before','After'},'location','southwest');
axes(handles.Bode);
margin(Gcs)
legend({'Before','After'},'location','southwest');
% --- Executes on button press in time_analy_jz.
function time_analy_jz_Callback(hObject, eventdata, handles)
% hObject    handle to time_analy_jz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global GcS;
global G1;
global generated;
if generated==0
  res1(GcS)
else
  res1(G1)
end
generated=0;
% --- Executes during object creation, after setting all properties.
function CS_show_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CS_show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function GS_show_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GS_show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function GS_show_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to GS_show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over GS_show.
function GS_show_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to GS_show (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in generate.
function generate_Callback(hObject, eventdata, handles)
% hObject    handle to generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global sys;
global sys1;
global generated;
global G1;
generated=1;     %模式二标志位，用于选择时域响应对象
[num,den]=tfdata(sys,'v');
Kv=str2num(get(handles.ess_v,'String'));
Wc=str2num(get(handles.wc,'String'));
gamma=str2num(get(handles.gamma,'String'));
gain=1/(Kv*num(length(num)));   %根据误差系数算出额外增益
[gm,pm,wcg,wcp]=margin(sys);
dpm=gamma-pm+7;
phi=dpm*pi/180;
a=(1+sin(phi))/(1-sin(phi));
[mag,phase,w]=bode(num,den);
mag_db=20*log10(mag);    %幅值转化为对数
mm=-10*log10(a);
if Wc==0   %选择方式二
    wc=spline(mag_db,w,mm);   %根据a获得截止频率
    T=1/(wc*sqrt(a));
    p=a.*T;
    nc=gain*[p 1];
    dc=[T 1];
else    %选择方式一（要求截止频率）
    res=freqresp(sys,Wc);    %求出截止频率处的幅值
    mag_db=20*log10(abs(res));     %对数化
    a=10.^(mag_db/-10);
    T=1/(Wc*sqrt(a));
    p=a.*T;
    nc=gain*[p 1];
    dc=[T 1];
end
t=0:0.01:12;
str_func=show_trans_func(nc,dc);
str_func=sprintf('%s',str_func);
set(handles.Correction,'String',str_func);     %显示生成的校正网络
axes(handles.time_response);
cla reset;
[y,t]=step(sys1,t);
plot(t,y,'b')
grid on;hold on;
Gc=tf(nc,dc);
G=series(Gc,sys);   %原系统和校正网络串联，绘图
G1=feedback(G,1);
[y,t]=step(G1,t);
plot(t,y,'r');
legend({'Before Correction','After Correction'},'location','southwest')
axes(handles.Bode);
cla reset;
margin(sys);
grid on;hold on;
margin(G);
legend({'Before Correction','After Correction'},'location','southwest')


function deno1_Callback(hObject, eventdata, handles)
% hObject    handle to deno1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of deno1 as text
%        str2double(get(hObject,'String')) returns contents of deno1 as a double
gs_num=str2num(get(handles.num,'String'));
gs_deno=str2num(get(handles.deno1,'String'));
str_func=show_trans_func(gs_num,gs_deno);
str_func=sprintf('%s',str_func);
set(handles.GS_show,'String',str_func);

% --- Executes during object creation, after setting all properties.
function deno1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to deno1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wc_Callback(hObject, eventdata, handles)
% hObject    handle to wc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wc as text
%        str2double(get(hObject,'String')) returns contents of wc as a double


% --- Executes during object creation, after setting all properties.
function wc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gamma_Callback(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamma as text
%        str2double(get(hObject,'String')) returns contents of gamma as a double


% --- Executes during object creation, after setting all properties.
function gamma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ess_v_Callback(hObject, eventdata, handles)
% hObject    handle to ess_v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ess_v as text
%        str2double(get(hObject,'String')) returns contents of ess_v as a double


% --- Executes during object creation, after setting all properties.
function ess_v_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ess_v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function time_analy_jz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time_analy_jz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
