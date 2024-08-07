function locationTable = readLocationFile(locationFile)
% Read in location data from Excel file
    
    locationTable = readtable(locationFile);

    %% Check inputs
    varNames = locationTable.Properties.VariableNames;
    % Specify must-have variables as list to easily add new variables in the future
    mustHaveVars = {'Latitude','Longitude'};
    
    varCheck = ismember(mustHaveVars,varNames);

    if ~isequal(sum(varCheck),length(mustHaveVars))
        % Missing must-have variables
        
        % Determine which variables are missing to throw error
        missingVars = mustHaveVars(~varCheck);
        error('Location file is missing the following variables:\n%s',missingVars{:})
    end
    
end