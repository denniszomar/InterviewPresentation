% Setting figure visibility to off to speed up testing routine
set(0, 'DefaultFigureVisible', 'off')

%% Test single input
success = plotLocations("Location_AMDR.xlsx");
assert(success)

%% Test two inputs
success = plotLocations("Location_AMDR.xlsx","Facility");
assert(success)

%% Test three inputs
success = plotLocations("Locations.xlsx","Type","TimeSpent");
assert(success)

% Setting figure visibility back on after testing
set(0, 'DefaultFigureVisible', 'on')