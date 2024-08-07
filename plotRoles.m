%% Plot timeline of academics/professional/personal
% Starting year will be 2003

yr = [2003.75 4.75 0 0 0 0
    2009 0 6 8.5 0 0
    0 0 0 0 2003.75 4.75];

h = barh(yr,0.3,'stacked');
set(h,'edgecolor','none');
set([h(1) h(5)], 'facecolor', 'none'); % disable the color of the first column (init time)
set(gca, 'YTickLabel', {'Academics', 'Professional', 'Hobbies/Personal'} ); % change the y axis tick to your name of the process
xlim([2002.5 2025])
axis ij; % Put the first row at top

hold on
markerSize = 8;
plot(2008.5,1,'marker','diamond','Color','k','MarkerFaceColor','k','MarkerSize',markerSize,'linestyle','none');
plot(2023+7.5/12,3,'marker','diamond','Color','g','MarkerFaceColor','g','MarkerSize',markerSize,'linestyle','none');
plot(2024.4,3,'Marker','v','Color','b','MarkerFaceColor','b','MarkerSize',markerSize,'linestyle','none');
plot(2024.5,3,'marker','^','Color','r','MarkerFaceColor','r','MarkerSize',markerSize,'linestyle','none');
hold off
legend({'','Wentworth Institute of Technology',...
    'BAE Systems',...
    'Raytheon',...
    '',...
    'NCAA Division III Volleyball',...
    'BS Electromechanical Engineering'...
    'Engaged',...
    'Adopted a greyhound',...
    'Married'},...
    'location','eastoutside')
xlabel('Year')
xtickangle(45)
set(gca,'fontsize',10)
%% Read and process data
    
% Read in role information from Excel file
roles = readtable("Roles_AMDR.xlsx");

roles.Title = categorical(roles.Title);
roles.Facility = categorical(roles.Facility);

numBars = length(roles.StartDate)+1;

durations = (roles.EndDate-roles.StartDate);
durations = years(durations);
roles.durations = durations;

cmap = get(0, 'DefaultAxesColorOrder');

%% Plot locations

figure;
% gb = geobubble(roles,"Latitude","Longitude",...
%     SizeVariable="durations",...
%     ColorVariable="Title");
% 
% gb.Title = "Work Locations";
% gb.ColorLegendTitle = "Role";
% gb.SizeLegendTitle = "Years in Role";
% gb.BubbleColorList = cmap(2:end,:);
% %gb.MapLayout = "maximized";

gp = geoplot(roles,"Latitude","Longitude",...
    MarkerFaceColor="b",...
    linestyle="none",...
    Marker='*');

geobasemap topographic

% Add text labels to each location
text(roles.Latitude,roles.Longitude,roles.Facility,...
    'horizontalalignment','right',...
    'color','b')

%% Plot timeline

x = [ones(1,numBars);
    nan(1,numBars)];

y = [year(roles.StartDate(1))+day(roles.StartDate(1),"dayofyear")/365 durations';
    nan(1,numBars)];

titles = cell(6,1);
titles{1,1} = '';
titles(2:6,1) = cellstr(roles.Title);

figure;
hAx = axes;
h = barh(hAx,x,y,'stacked');
set(h,'edgecolor','none');
set(h(1), 'facecolor', 'none'); % disable the color of the first column (init time)
legend(hAx,titles,'location','southoutside')
xlim([2018 2024])
ylim([.5 5])
xlabel('Year')
set(hAx,'ytick',[])
set(hAx,'box','off')
% set(hAx,'ycolor','none')
