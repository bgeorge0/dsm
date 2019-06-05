function varargout = unwrap_figure(varargin)
% UNWRAP_FIGURE MATLAB code for unwrap_figure.fig
%      UNWRAP_FIGURE, by itself, creates a new UNWRAP_FIGURE or raises the existing
%      singleton*.
%
%      H = UNWRAP_FIGURE returns the handle to a new UNWRAP_FIGURE or the handle to
%      the existing singleton*.
%
%      UNWRAP_FIGURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNWRAP_FIGURE.M with the given input arguments.
%
%      UNWRAP_FIGURE('Property','Value',...) creates a new UNWRAP_FIGURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before unwrap_figure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to unwrap_figure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help unwrap_figure

% Last Modified by GUIDE v2.5 17-Apr-2019 15:23:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @unwrap_figure_OpeningFcn, ...
    'gui_OutputFcn',  @unwrap_figure_OutputFcn, ...
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


% --- Executes just before unwrap_figure is made visible.
function unwrap_figure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to unwrap_figure (see VARARGIN)

% Choose default command line output for unwrap_figure
handles.output = hObject;

% Init code here
global planC;
if isempty(planC)
    handles.structure_to_unwrap.String = 'Please load a dataset into CERR';
    handles.start_pois.String = 'Please load a dataset into CERR';
    handles.end_pois.String = 'Please load a dataset into CERR';
    handles.unwrap_centre.String = 'Please load a dataset into CERR';
else
    handles.planC = planC;
    structure_page = handles.planC{end}.structures;
    handles.structure_to_unwrap.String = {handles.planC{structure_page}.structureName};
    handles.start_pois.String = {'Most sup slice', handles.planC{structure_page}.structureName};
    handles.end_pois.String = {'Most inf slice', handles.planC{structure_page}.structureName};
    handles.unwrap_centre.String = {'ROI midpoint', 'Most ant point', 'Most post point', handles.planC{structure_page}.structureName};
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes unwrap_figure wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = unwrap_figure_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in structure_to_unwrap.
function structure_to_unwrap_Callback(hObject, eventdata, handles)
% hObject    handle to structure_to_unwrap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns structure_to_unwrap contents as cell array
%        contents{get(hObject,'Value')} returns selected item from structure_to_unwrap


% --- Executes during object creation, after setting all properties.
function structure_to_unwrap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to structure_to_unwrap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in start_pois.
function start_pois_Callback(hObject, eventdata, handles)
% hObject    handle to start_pois (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns start_pois contents as cell array
%        contents{get(hObject,'Value')} returns selected item from start_pois


% --- Executes during object creation, after setting all properties.
function start_pois_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start_pois (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in end_pois.
function end_pois_Callback(hObject, eventdata, handles)
% hObject    handle to end_pois (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns end_pois contents as cell array
%        contents{get(hObject,'Value')} returns selected item from end_pois


% --- Executes during object creation, after setting all properties.
function end_pois_CreateFcn(hObject, eventdata, handles)
% hObject    handle to end_pois (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in unwrap_centre.
function unwrap_centre_Callback(hObject, eventdata, handles)
% hObject    handle to unwrap_centre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns unwrap_centre contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unwrap_centre


% --- Executes during object creation, after setting all properties.
function unwrap_centre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unwrap_centre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in unwrap_action.
function unwrap_action_Callback(hObject, eventdata, handles)
% hObject    handle to unwrap_action (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ButtonName = questdlg('WARNING: About to do unwrapping - this may take a minute or two', ...
    'WARNING', ...
    'Continue', 'Not yet!', 'Not yet!');
switch ButtonName
    case 'Continue'
        %
    otherwise
        return
end

% Check if values are sensible
% Rasise some NotImplementedYet errors
if strcmp(handles.start_pois.String{handles.start_pois.Value}, 'Most sup slice')
    errorStruct.message = 'Most sup slice method is not implemented yet.';
    errorStruct.identifier = 'UNWRAPPING:notImplementedYet';
    error(errorStruct);
end
if strcmp(handles.end_pois.String{handles.end_pois.Value}, 'Most inf slice')
    errorStruct.message = 'Most inf slice method is not implemented yet.';
    errorStruct.identifier = 'UNWRAPPING:notImplementedYet';
    error(errorStruct);
end
if strcmp(handles.unwrap_centre.String{handles.unwrap_centre.Value}, 'ROI midpoint')
    errorStruct.message = 'ROI midpoint method is not implemented yet.';
    errorStruct.identifier = 'UNWRAPPING:notImplementedYet';
    error(errorStruct);
end
if strcmp(handles.unwrap_centre.String{handles.unwrap_centre.Value}, 'Most ant point')
    errorStruct.message = 'Most ant point method is not implemented yet.';
    errorStruct.identifier = 'UNWRAPPING:notImplementedYet';
    error(errorStruct);
end
if strcmp(handles.unwrap_centre.String{handles.unwrap_centre.Value}, 'Most post point')
    errorStruct.message = 'Most post point method is not implemented yet.';
    errorStruct.identifier = 'UNWRAPPING:notImplementedYet';
    error(errorStruct);
end

% Page with structure lists
structure_page = handles.planC{end}.structures;

unwrap_structNum = find(strcmp({handles.planC{structure_page}.structureName}, handles.structure_to_unwrap.String{handles.structure_to_unwrap.Value}));
start_poi_structNum = find(strcmp({handles.planC{structure_page}.structureName}, handles.start_pois.String{handles.start_pois.Value}));
end_poi_structNum = find(strcmp({handles.planC{structure_page}.structureName}, handles.end_pois.String{handles.end_pois.Value}));
unwrap_centre_structNum = find(strcmp({handles.planC{structure_page}.structureName}, handles.unwrap_centre.String{handles.unwrap_centre.Value}));
[handles.UNWRAPPING_DATA.as_points.point_cloudD,~] = getXYZD(unwrap_structNum, 1, handles.planC);
[START_POIs, ~] = getXYZD(start_poi_structNum, 1, handles.planC);
[FINISH_POIs, ~] = getXYZD(end_poi_structNum, 1, handles.planC);
[UNWRAP_POI, ~] = getXYZD(unwrap_centre_structNum, 1, handles.planC);
handles.UNWRAPPING_DATA.as_points.START_POIs = START_POIs(:,1:3);
handles.UNWRAPPING_DATA.as_points.FINISH_POIs = FINISH_POIs(:,1:3);
handles.UNWRAPPING_DATA.as_points.unwrap_centre = (max(UNWRAP_POI(:,1:3)) + min(UNWRAP_POI(:,1:3)))/2;

handles.UNWRAPPING_DATA = bg_unwrapping(handles.UNWRAPPING_DATA);




function number_of_slices_Callback(hObject, eventdata, handles)
% hObject    handle to number_of_slices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_of_slices as text
%        str2double(get(hObject,'String')) returns contents of number_of_slices as a double


% --- Executes during object creation, after setting all properties.
function number_of_slices_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_of_slices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function number_of_rays_Callback(hObject, eventdata, handles)
% hObject    handle to number_of_rays (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_of_rays as text
%        str2double(get(hObject,'String')) returns contents of number_of_rays as a double


% --- Executes during object creation, after setting all properties.
function number_of_rays_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_of_rays (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function voxelise_x_Callback(hObject, eventdata, handles)
% hObject    handle to voxelise_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of voxelise_x as text
%        str2double(get(hObject,'String')) returns contents of voxelise_x as a double


% --- Executes during object creation, after setting all properties.
function voxelise_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to voxelise_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function voxelise_y_Callback(hObject, eventdata, handles)
% hObject    handle to voxelise_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of voxelise_y as text
%        str2double(get(hObject,'String')) returns contents of voxelise_y as a double


% --- Executes during object creation, after setting all properties.
function voxelise_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to voxelise_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function voxelise_z_Callback(hObject, eventdata, handles)
% hObject    handle to voxelise_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of voxelise_z as text
%        str2double(get(hObject,'String')) returns contents of voxelise_z as a double


% --- Executes during object creation, after setting all properties.
function voxelise_z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to voxelise_z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_action.
function save_action_Callback(hObject, eventdata, handles)
% hObject    handle to save_action (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ButtonName = questdlg('WARNING: This will overwrite the UNWRAPPING_DATA variable in your workspace. Would you like to continue?', ...
    'WARNING', ...
    'Yes', 'No', 'No');
switch ButtonName
    case 'Yes'
        
        if ~isfield(handles,'UNWRAPPING_DATA')
            handles.UNWRAPPING_DATA = struct;
        end
        assignin('base','UNWRAPPING_DATA',handles.UNWRAPPING_DATA);
    otherwise
        disp('Data not saved yet.')
end % switch