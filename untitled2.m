h = Unwrapping_GUI;
handles = guidata(h);

xyzD2 = xyzD;
xyzD2(:,4) = xyzD(:,4) - min(xyzD(:,4));
mx = max(xyzD2(:,4));

hold(handles.axes1, 'on');

inds = xyzD2(:,4) < 0.3*mx;
sum(inds)
plot3(handles.axes1, xyzD(:,1),xyzD(:,2),xyzD(:,3), 'k.')

inds = (xyzD2(:,4) >= (0.3*mx)) & (xyzD2(:,4) < (0.5*mx));
plot3(handles.axes1, xyzD(inds,1),xyzD(inds,2),xyzD(inds,3), 'g.')

inds = (xyzD2(:,4) >= (0.5*mx)) & (xyzD2(:,4) < (0.75*mx));
plot3(handles.axes1, xyzD(inds,1),xyzD(inds,2),xyzD(inds,3), 'b.')

inds = (xyzD2(:,4) >= (0.75*mx)) & (xyzD2(:,4) < (0.9*mx));
plot3(handles.axes1, xyzD(inds,1),xyzD(inds,2),xyzD(inds,3), 'y.')

inds = (xyzD2(:,4) >= (0.9*mx));
plot3(handles.axes1, xyzD(inds,1),xyzD(inds,2),xyzD(inds,3), 'r.')

axis(handles.axes1, 'vis3d');
campos(handles.axes1, [-54.6214  -60.2905   63.7718]);
camtarget(handles.axes1, [-0.7460   -0.7890    3.1500]);

im2 = imread('dsm.tif');
imshow(handles.axes2,im2);

imshow(im2, 'Parent', handles.axes2);