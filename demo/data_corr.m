clc;clear;close all;

gooddata = xlsread('C:\project\eigc\adc_norm\data_training\good_data.xlsx');
% gooddata = xlsread('C:\project\eigc\rf\data_training\good_data.xlsx');
gooddata = gooddata(2:end, :);

% CMP=corrMatPlot(lowspeed1_lhq,'Format','triu','Type','pie');
% CMP=CMP.setColorMap(1);
% CMP=CMP.draw();
% CMP.setLabelStr({'welcome','to','follow','my','wechat','official','account','slandarer'})

figure
% ��ά��֮������ϵ��
rho = corr(gooddata, 'type','pearson');
x=abs(rho);
% ������ͼ
% string_name={'���','��϶��','ѹ���ص�����','��������','����Ч��','͸����','�����'};
% xvalues = string_name;
% yvalues = string_name;
% h = heatmap(xvalues,yvalues, rho, 'FontSize',10, 'FontName','����');
h = heatmap(x);
h.Title = 'Ƥ��ѷ�����';
colormap(summer(5))