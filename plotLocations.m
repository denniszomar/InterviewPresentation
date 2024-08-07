% Plot points on geographic world map

%% Define locations and associated text labels

% Read in location data from Excel file
locations = readtable("Locations.xlsx");

locations.Type = categorical(locations.Type);
locations.Name = categorical(locations.Name);


%% Read in AMDR work locations
% Read in location data from Excel file
locations = readtable("Location_AMDR.xlsx");

locations.Facility = categorical(locations.Facility);


%% Plot AMDR facilities

gb1 = geobubble(locations,"Latitude","Longitude",...
    ColorVariable="Facility");
geobasemap grayland
gb1.MapLayout="maximized";
set(gca,'fontsize',12)

%% Plot home locations on map 

figure;
gb2 = geobubble(locations(locations.Type=="Home",:),"Latitude","Longitude",SizeVariable="TimeSpent");

%% Plot work locations on map

workLocations = locations(locations.Type=="Work"&locations.Company=="RTX",:);
gb3 = geobubble(workLocations,...
    "Latitude","Longitude",...
    SizeVariable="TimeSpent",...
    ColorVariable="Name",...
    MapLayout="maximized");


%% Plot both home and work locations on map and color code them

gb4 = geobubble(locations,"Latitude","Longitude",SizeVariable="TimeSpent",ColorVariable="Type");

% Plot the locations
% geoplot([placesLived{:,1}],...
%     [placesLived{:,2}],...
%     'MarkerEdgeColor','blue',...
%     'linestyle','none',...
%     'Marker','o');

% Use the "topographic" basemap since we're plotting city locations
% geobasemap topographic

% Add text labels to each location
% text(placesLived{:,1},...
%     placesLived{:,2},...
%     placesLived(:,3),...
%     'color','b')

% Set the limits manually
%geolimits([42.2502 42.4351],[-71.2670 -70.9525])

%% Clean up plot for presentation


% Set the limits dynamically
% tightnessFactor = 0.1;
% latExtent = max([placesLived{:,1}]) - min([placesLived{:,1}]);
% latLimits = [min([placesLived{:,1}])-tightnessFactor*latExtent ...
%     max([placesLived{:,1}])+tightnessFactor*latExtent];
% 
% longExtent = max([placesLived{:,2}]) - min([placesLived{:,2}]);
% longLimits = [min([placesLived{:,2}])-tightnessFactor*longExtent ...
%     max([placesLived{:,2}])+tightnessFactor*longExtent];
% 
% 
% geolimits(latLimits,longLimits);

