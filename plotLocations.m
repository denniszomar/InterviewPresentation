%%PLOTLOCATIONS Plot points from xlsx file on map using geobubble
%   PLOTLOCATIONS inputs and outputs:
%     Inputs:
%       locationFile        - Name of ".xlsx" file
%       colorVariable       - (optional) Table column to use for coloring of geobubbles
%       sizeVariable        - (optional) Table column to use for sizing of geobubbles
%
%     Outputs:
%       success             - logical specifying success of function 
%   Author: Dennis Zomar

function [vargout] = plotLocations(locationFile,colorVariable,sizeVariable)
    
    % Specify output of function as success for testing purposes and set to
    % false in beginning of function, only if asked for
    if nargout>0
        vargout = true;
    end


    %% Input handling
    
    % Check that inputs are between 1 and 3
    narginchk(1,3)
    
    % Set colorVariable and/or sizeVariable if not specified
    switch nargin
        case 1
            colorVariable = [];
            sizeVariable = [];
        case 2
            sizeVariable = [];
    end

    % Check that the input arguments are the right class and valid
    % arguments
    %     locationFile (1,:) string {mustBeFile}
    %     colorVariable (1,:) string {mustBeValidVariableName} = ""
    %     sizeVariable (1,:) string {mustBeValidVariableName} = ""
    % end
    
    %% Read locationFile

    % Call function to read in table data of locations
    locationTable = readLocationFile(locationFile);

    % If color variable is specified
    if ~isempty(colorVariable)
        % In order to color plotted locations by specified colorVariable, must convert to categorical
        locationTable.(colorVariable) = categorical(locationTable.(colorVariable));
    end

    %% Plot locations

    % Call geobubble plotting function
    gb = geobubble(locationTable,"Latitude","Longitude");

    % If colorVariable is available, update plot
    if ~isempty(colorVariable)
        gb.ColorVariable=colorVariable;
    end

    % If sizeVariable is available, update plot
    if ~isempty(sizeVariable)
        gb.SizeVariable=sizeVariable;
    end
    
    % Change geobasemap to "grayland" for best visual results
    geobasemap grayland
    
    % Maximize the map in the figure
    gb.MapLayout="maximized";
    
    % Increase font size for better visibility
    set(gca,'fontsize',12)

    % Reached end of function, set output to true, only if asked for
    if nargout>0
        vargout = true;
    end

end