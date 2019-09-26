% GUI

% Start GUIDE by typing guide at the MATLAB prompt. 

guide

% In the GUIDE Quick Start dialog box,
% select the Blank GUI (Default) template, and then click OK.


% Display the names of the components in the component palette:
% a. Select File > Preferences > GUIDE.
% b. Select Show names in component palette.
% c. Click OK.

% Set the Window Size in GUIDE
% Set the size of the window by resizing the grid area in the Layout Editor. 
% Click the lower-right corner and drag it until the canvas is approximately 
% 3 inches high and 4 inches wide. If necessary, make the canvas larger


% Add, align, and label the components in the UI.
% Add the three push buttons to the UI. Select the push button tool from the 
% component palette at the left side of the Layout Editor and drag it into the
% layout area. Create three buttons

% Add the remaining components to the UI:
% A static text area
% A pop-up menu
% An axes
%

% Align the Components
% 1. Select all three push buttons by pressing Ctrl and clicking them.
% 2. Select Tools > Align Objects.
% 3. Make these settings in the Alignment Tool:
% - Left-aligned in the horizontal direction.
% - 20 pixels spacing between push buttons in the vertical direction.
% 4. Click OK.

% Label the Push Buttons
% Each of the three push buttons specifies a plot type: surf, mesh, and contour.
% 1. Select View > Property Inspector.
% 2. In the layout area, click the top push button.
% 3. In the Property Inspector, select the String property, and then replace the 
% existing value with the word Surf.
% 4. Press the Enter key. The push button label changes to Surf.
% 5. Click each of the remaining push buttons in turn and repeat steps 3 and 4. 
% Label the middle push button Mesh, and the bottom button Contour.

% List Pop-Up Menu Items
% The pop-up menu provides a choice of three data sets: peaks, membrane, and sinc. 
% These data sets correspond to MATLAB functions of the same name. 
% 
% 1. In the layout area, click the pop-up menu.
% 2. In the Property Inspector, click the button next to String. The String dialog box displays.
% 3. Replace the existing text with the names of the three data sets: 
% peaks, membrane, and sinc. Press Enter to move to the next line.
% 4. When you finish editing the items, click OK.
% The first item in your list, peaks, appears in the pop-up menu in the layout area.

% Modify the Static Text
% In this UI, the static text serves as a label for the pop-up menu
% 1. In the layout area, click the static text.
% 2. In the Property Inspector, click the button next to String. In the String dialog box that displays, 
% replace the existing text with the phrase Select Data. 
% 3.Click OK.

% Save the Layout
% When you save a layout, GUIDE creates two files, a FIG-file and a code file. 
% The FIG-file, with extension .fig, is a binary file that contains a description of the layout. 
% The code file, with extension .m, contains MATLAB functions that control the app’s behavior.
%
% 1. Save and run your program by selecting Tools > Run.
% 2. GUIDE displays a dialog box displaying: “Activating will save changes to your figure file and MATLAB code. Do you wish to continue?
% Click Yes.
% 3. GUIDE opens a Save As dialog box in your current folder and prompts you for a FIG-file name.
% 4. Browse to any folder for which you have write privileges, and then enter the file name simple_gui for the FIG-file. 
% GUIDE saves both the FIG-file and the code file using this name.
% 5. If the folder in which you save the files is not on the MATLAB path, GUIDE opens a dialog box that allows you to change the current folder.
% 6. GUIDE saves the files simple_gui.fig and simple_gui.m, and then runs the program. It also opens the code file in your default editor.
% 
% To run an app created with GUIDE without opening GUIDE, execute its code file by typing its name.
% You can also use the run command with the code file, for example


%% Code the Behavior of the App
% Generate Data to Plot
% This section shows you how to generate the data to be plotted when the user clicks a button. 
% The opening function generates this data by calling MATLAB functions. 
% The opening function initializes the UI when it opens, and it is the first callback in every GUIDE-generated code file.
% 
% In this example, you add code that creates three data sets to the opening function. 
% The code uses the MATLAB functions peaks, membrane, and sinc.

% 1. On the EDITOR tab, in the NAVIGATE section, click Go To, and then select simple_gui_OpeningFcn.

% 2. Create data to plot by adding the following code to the opening function immediately after the comment that begins % varargin...

% Create the data to plot.
handles.peaks=peaks(35);
handles.membrane=membrane;
[x,y] = meshgrid(-8:.5:8);
r = sqrt(x.^2+y.^2) + eps;
sinc = sin(r)./r;
handles.sinc = sinc;
% Set the current data value.
handles.current_data = handles.peaks;
surf(handles.current_data)

% The first six executable lines create the data using the MATLAB functions peaks, membrane, and sinc. 
% They store the data in the handles structure, an argument provided to all callbacks. 
% Callbacks for the push buttons can retrieve the data from the handles structure.

% The last two lines create a current data value and set it to peaks, and then display the surf plot for peaks. 

%% Code Pop-Up Menu Behavior
% The pop-up menu presents options for plotting the data. 
% When the user selects one of the three plots, MATLAB software sets the pop-up menu Value property to the index of the selected menu item. 
% The pop-up menu callback reads the pop-up menu Value property to determine the item that the menu currently displays, and sets handles.current_data accordingly

% 1. Display the pop-up menu callback in the MATLAB Editor. 
% In the GUIDE Layout Editor, right-click the pop-up menu component, and then select View Callbacks > Callback.
% GUIDE displays the code file in the Editor, and moves the cursor to the pop-menu callback, which contains this code:
   
    % --- Executes on selection change in popupmenu1.
    function popupmenu1_Callback(hObject, eventdata, handles)
    % hObject    handle to popupmenu1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

% 2. Add the following code to the popupmenu1_Callback after the comment that begins % handles...
% This code first retrieves two pop-up menu properties:
% String — a cell array that contains the menu contents
% Value — the index into the menu contents of the selected data set

% The code then uses a switch statement to make the selected data set the current data. 
% The last statement saves the changes to the handles structure.

% Determine the selected data set.
str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val};
case 'peaks' % User selects peaks.
   handles.current_data = handles.peaks;
case 'membrane' % User selects membrane.
   handles.current_data = handles.membrane;
case 'sinc' % User selects sinc.
   handles.current_data = handles.sinc;
end
% Save the handles structure.
guidata(hObject,handles)

%% Code Push Button Behavior
% Each of the push buttons creates a different type of plot using the data specified by the current selection in the pop-up menu. 
% The push button callbacks get data from the handles structure and then plot it.

% 1. Display the Surf push button callback in the MATLAB Editor. 
% In the Layout Editor, right-click the Surf push button, and then select View Callbacks > Callback.
% In the Editor, the cursor moves to the Surf push button callback in the code file, which contains this code:

% --- Executes on button press in pushbutton1.
  % function pushbutton1_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

% 2. Add the following code to the callback immediately after the comment that begins % handles...

% Display surf plot of the currently selected data.
surf(handles.current_data);

% 3. Repeat steps 1 and 2 to add similar code to the Mesh and Contour push button callbacks.

% Add this code to the Mesh push button callback, pushbutton2_Callback:
  % Display mesh plot of the currently selected data.
  mesh(handles.current_data);
% Add this code to the Contour push button callback, pushbutton3_Callback:
  % Display contour plot of the currently selected data.
  contour(handles.current_data);

% Save your code by selecting File > Save.


%% Run the App
%  Now you can run your program to see how it works.

% 1. Run your program from the Layout Editor by selecting Tools > Run.

% 2. In the pop-up menu, select Membrane, and then click the Mesh button. The app displays a mesh plot of the MathWorks® L-shaped Membrane logo.

% 3. Try other combinations before closing the window



%% more UI

% uigetfile
doc uigetfile
[Files,Path]=uigetfile('*.*','select a file','MultiSelect','on');


% msgbox
doc msgbox
msgbox('Operation Completed');

% dialog
doc dialog

% waitbar
doc waitbar

% example 1 - basicwaitbar
f = waitbar(0,'Please wait...');
pause(.5)

waitbar(.33,f,'Loading your data');
pause(1)

waitbar(.67,f,'Processing your data');
pause(1)

waitbar(1,f,'Finishing');
pause(1)

close(f)

% example 2 - approx pi
f = waitbar(0,'1','Name','Approximating pi...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');

setappdata(f,'canceling',0);

% Approximate pi^2/8 as: 1 + 1/9 + 1/25 + 1/49 + ...
pisqover8 = 1;
denom = 3;
valueofpi = sqrt(8 * pisqover8);

steps = 20000;
for step = 1:steps
    % Check for clicked Cancel button
    if getappdata(f,'canceling')
        break
    end
    
    % Update waitbar and message
    waitbar(step/steps,f,sprintf('%12.9f',valueofpi))
    
    % Calculate next estimate 
    pisqover8 = pisqover8 + 1 / (denom * denom);
    denom = denom + 2;
    valueofpi = sqrt(8 * pisqover8);
end

delete(f)


%% App Designer

doc Create and Run a Simple App Using App Designer

% App Designer provides a tutorial that guides you through the process of creating a simple app containing a plot and a slider. 
% The slider controls the amplitude of the plotted function. 
% You can create this app by running the tutorial, or you can follow the tutorial steps



%% GOOD LUCK!!!













% Some more matrix operations
% ----------------------------------------------
%

%
% Solving systems of linear equations:
%
% For example: let us solve the system
% of three equations in three unknowns:
%
%   x_1+2*x_2+3*x_3 = 366
% 4*x_1+5*x_2+6*x_3 = 804
% 7*x_1+8*x_2+9*x_3 = 351
%

A = [1 2 3;
4 5 6;
7 8 9];

v = [366;804;351];

%
% One obvious way to solve the system is
% to calculate the inverse of the matrix A
% and multiply it with the righthand side (v).
% We can perform that using the 'inv' function
%

doc inv
inv(A)

inv(A)*v

%
% However, this is not the preferred way.
% Calculating the inverse is more prone to
% numerical errors. Using the backslash ('\')
% does it with less operations and smaller errors:
% Matlab calls this 'left division', as opposed
% to the usual division, which it calls 'right division'
%

A\v
doc mldivide

%
% eig(A) = gives the eigenvalues of the matrix.
%

doc eig
eig(A)

%
% Calling eig with two output arguments produces
% a matrix whose columns are the eigenvectors,
% and a diagonal matrix whose diagonal members 
% are the corresponding eigenvalues.
%

[v,d] = eig(A)

%
% 'poly', when applied to a matrix, calculates the
% 'characterisitc polynomial' of the matrix
% (det(A*x-I)).
%

doc poly

poly(A)

%
% 'trace' calculates the trace of the matrix 
% (sum of the diagonal)
%

doc trace
trace(A)
