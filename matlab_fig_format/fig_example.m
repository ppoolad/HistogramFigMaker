run fig_settings %load general figure settings

% This script sets a figure to the desired format
cur_file = 'VGA_AC2.csv'
numheadlines = 1;
delimit = ',';

figure;
set(gca,'LineStyleOrder',{'-o','-s','-^'}); %symbol list: {o x + * s d v ^ < > p  h}
set(gca,'Box','on','linewidth',2); %set the linewidth of the border box and axes
set(gca,'ColorOrder',[0 0 0]); %set all trace colors to black
set(gca,'nextplot','replacechildren');

%%change the following data file-specific lines as needed
[plot_data(:,1),plot_data(:,2),plot_data(:,3),plot_data(:,4)] = textread(cur_file,'%f%f%f%f','headerlines',numheadlines,'delimiter',delimit);
xaxis_scaled = (1e-9)*plot_data(:,1); %scale x-axis to GHz
plot(xaxis_scaled,plot_data(:,2),xaxis_scaled,plot_data(:,3),xaxis_scaled,plot_data(:,4),'linewidth',2,'markersize',6,'markerfacecolor','k');
legend('A','B','C');
set(gca,'fontname',font_name_labels,'fontweight',font_weight_labels,'fontsize',font_size_labels);
xlabel('Frequency [GHz]')
ylabel('AC Gain [dB]')
xlimits=([0 40]); xtick_int = 5;
ylimits=([-10 10]); ytick_int = 5;
%%end data file-specific section

set(gca,'fontweight',font_weight_axes,'fontsize',font_size_axes);
xlim([xlimits(1) xlimits(2)])
ylim([ylimits(1) ylimits(2)])
set(gca,'xtick',[xlimits(1):xtick_int:xlimits(2)])
set(gca,'ytick',[ylimits(1):ytick_int:ylimits(2)])
set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'ticklength',[0.02 0.025])
set(gcf,'position',[489 506 4*fig_size 3*fig_size]) %set figure size
grid on