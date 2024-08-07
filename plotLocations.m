% Plot points on geographic world map using geobubble
function plotLocations(locationFile,colorVariable,sizeVariable)

    % Input handling
    narginchk(1,3)

    % Check that the input arguments are the right class and valid
    arguments
        locationFile (1,:) string {mustBeFile}
        colorVariable (1,:) string {mustBeValidVariableName} = ""
        sizeVariable (1,:) string {mustBeValidVariableName} = ""
    end

    % Call function to read in table data of locations
    locationTable = readLocationFile(locationFile);

    % If color variable is specified
    if ~isempty(colorVariable)
        % In order to color plotted locations by specified colorVariable, must convert to categorical
        locationTable.(colorVariable) = categorical(locations.(colorVariable));
    end

    % Call geobubble plotting function
    gb = geobubble(locationTable,"Latitude","Longitude"

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

end