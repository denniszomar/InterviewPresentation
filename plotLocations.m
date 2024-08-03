% Plot points on geographic world map

%% Define locations and associated text labels

% Latitude, longitude, name, yearsLived
placesLived = {...
    42.32340695694702, -71.11251682593698, ' Jamaica Plan', 1.25;...
    42.39387547765154, -71.11149297493235, ' Somerville', 1.75;...
    42.348119765585494, -71.07964539642185, ' Back Bay', 1.75;...
    42.36534640954551, -71.05639190866779, ' North End', 1.5;...
    42.33674205675515, -71.09756615774313, ' Wentworth', 3;...
    42.331524215120695, -71.10422952247083, ' Mission Hill', 2;...
    21.88759898420488, -159.47729129953845, ' Koloa', 2;...
    21.86937433433236, -159.44600064927727, ' Poipu', .33;....
    42.373999852375626, -71.5193693379079, ' Marlborough',14;,...
    42.704232885108375, -71.5765063196858, ' Hollis',1.75;...
    42.84197532681615, -71.63898329515972, ' Milford',1.25;...
    42.76102588783514, -71.47052045826881, ' Nashua',3};

% Adding places I've worked for future plotting needs
placesWorked = {...
    22.05007002845436, -159.78291495237062, ' PMRF', 2.33;...
    42.76367841891042, -71.45837809899338, ' Nashua', 6};

%% Plot locations on map

% Plot the locations
geoplot(placesLived{:,1},...
    placesLived{:,2},...
    'MarkerEdgeColor','blue',...
    'linestyle','none',...
    'Marker','o');

% Use the "default" basemap since we're plotting city locations
geobasemap default

% Add text labels to each location
text(placesLived{:,1},...
    placesLived{:,2},...
    placesLived{:,3},...
    'color','b')

% Set the limits manually
%geolimits([42.2502 42.4351],[-71.2670 -70.9525])

% Set the limits dynamically
tightnessFactor = 0.1;
latExtent = max(placesLived{:,1}) - min(placesLived{:,1};
latLimits = [min(placesLived{:,1})-tightnessFactor*latExtent ...
    max(placesLived{:,1})+tightnessFactor*latExtent];

longExtent = max(placesLived{:,2}) - min(placesLived{:,2});
longLimits = [min(placesLived{:,2})-tightnessFactor*longExtent ...
    max(placesLived{:,2})+tightnessFactor*longExtent];


geolimits(latLimits,longLimits);

