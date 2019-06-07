function varargout = unwrapping(varargin)
% UNWRAPPING MATLAB code for unwrapping.fig
%      UNWRAPPING, by itself, creates a new UNWRAPPING or raises the existing
%      singleton*.
%
%      H = UNWRAPPING returns the handle to a new UNWRAPPING or the handle to
%      the existing singleton*.
%
%      UNWRAPPING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNWRAPPING.M with the given input arguments.
%
%      UNWRAPPING('Property','Value',...) creates a new UNWRAPPING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before unwrapping_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to unwrapping_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help unwrapping

% Last Modified by GUIDE v2.5 07-Jun-2019 15:33:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @unwrapping_OpeningFcn, ...
                   'gui_OutputFcn',  @unwrapping_OutputFcn, ...
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


% --- Executes just before unwrapping is made visible.
function unwrapping_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to unwrapping (see VARARGIN)

% Choose default command line output for unwrapping
handles.output = hObject;

workspace_values = evalin('base','who');

handles.startROIList.String = workspace_values;
handles.endROIList.String = workspace_values;
handles.doseCloudList.String = workspace_values;
handles.unwarpCentreList.String = workspace_values;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes unwrapping wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = unwrapping_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in startROIList.
function startROIList_Callback(hObject, eventdata, handles)
% hObject    handle to startROIList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns startROIList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from startROIList


% --- Executes during object creation, after setting all properties.
function startROIList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startROIList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in endROIList.
function endROIList_Callback(hObject, eventdata, handles)
% hObject    handle to endROIList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns endROIList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from endROIList


% --- Executes during object creation, after setting all properties.
function endROIList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to endROIList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in doseCloudList.
function doseCloudList_Callback(hObject, eventdata, handles)
% hObject    handle to doseCloudList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns doseCloudList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from doseCloudList


% --- Executes during object creation, after setting all properties.
function doseCloudList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to doseCloudList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in unwarpCentreList.
function unwarpCentreList_Callback(hObject, eventdata, handles)
% hObject    handle to unwarpCentreList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns unwarpCentreList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unwarpCentreList


% --- Executes during object creation, after setting all properties.
function unwarpCentreList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unwarpCentreList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkDataButton.
function checkDataButton_Callback(hObject, eventdata, handles)
% hObject    handle to checkDataButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

disp('Checking data!')


% --- Executes on button press in unwrapButton.
function unwrapButton_Callback(hObject, eventdata, handles)
% hObject    handle to unwrapButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

bg_unwrapping
