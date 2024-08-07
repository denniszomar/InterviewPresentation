% % Setting figure visibility to off to speed up testing routine
% set(0, 'DefaultFigureVisible', 'off')
% CAN'T DO THIS OR ELSE FAILED TESTS CAUSE FIGURE VISIBILITY TO NOT BE
% RESTORED. NEED TO ADD PROPER SETUP AND TEARDOWN FUNCTIONALITY

%% Test single input
success = plotLocations("Location_AMDR.xlsx");
assert(success)

%% Test two inputs
success = plotLocations("Location_AMDR.xlsx","Facility");
assert(success)

%% Test three inputs
success = plotLocations("Locations.xlsx","Type","TimeSpent");
assert(success)
% 
% 
% % Setting figure visibility back on after testing
% set(0, 'DefaultFigureVisible', 'on')