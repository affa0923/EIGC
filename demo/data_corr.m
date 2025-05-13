clc;clear;close all;

gooddata = xlsread('C:\project\eigc\adc_norm\data_training\good_data.xlsx');
% gooddata = xlsread('C:\project\eigc\rf\data_training\good_data.xlsx');
gooddata = gooddata(2:end, :);

% CMP=corrMatPlot(lowspeed1_lhq,'Format','triu','Type','pie');
% CMP=CMP.setColorMap(1);
% CMP=CMP.draw();
% CMP.setLabelStr({'welcome','to','follow','my','wechat','official','account','slandarer'})

figure
% 求维度之间的相关系数
rho = corr(gooddata, 'type','pearson');
x=abs(rho);
% 绘制热图
% string_name={'厚度','孔隙率','压缩回弹性率','过滤阻力','过滤效率','透气性','插层率'};
% xvalues = string_name;
% yvalues = string_name;
% h = heatmap(xvalues,yvalues, rho, 'FontSize',10, 'FontName','宋体');
h = heatmap(x);
h.Title = '皮尔逊相关性';
colormap(summer(5))