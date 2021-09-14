% Open figure
close all
save_fold = "./cd68";
varName = "pixel3_all_ar_tof110";
matx = eval(varName);
bin_downsample_rate = 1;
sim_res = 10e-12;
tmod = 200e-9;
time_range = (0:sim_res*bin_downsample_rate:tmod-sim_res)*1e9; %in ns
mat_ds = sum(reshape(matx,bin_downsample_rate,length(matx)/bin_downsample_rate),1);
figure;
bar(time_range,mat_ds);


%fig_setting
fig_settings;
%legend('A','B','C');
set(gca,'fontname',font_name_labels,'fontweight',font_weight_labels,'fontsize',font_size_labels);
xlabel('Time [ns]')
ylabel('Photon count');
title('Histogram of photon incident times');
%xlimits=([0 40]); xtick_int = 5;
%ylimits=([-10 10]); ytick_int = 5;
%%end data file-specific section

set(gca,'fontweight',font_weight_axes,'fontsize',font_size_axes);
%xlim([xlimits(1) xlimits(2)])
%ylim([ylimits(1) ylimits(2)])
%set(gca,'xtick',[xlimits(1):xtick_int:xlimits(2)])
%set(gca,'ytick',[ylimits(1):ytick_int:ylimits(2)])
set(gca,'xminortick','on')
set(gca,'yminortick','on')
set(gca,'ticklength',[0.02 0.025])
set(gcf,'position',[0 0 21*fig_size 9*fig_size]) %set figure size
grid on


%let's save figure
savefig(save_fold + varName+".fig")
saveas(gcf,save_fold + varName+".eps")
saveas(gcf,save_fold + varName+".png")