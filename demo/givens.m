clc;clear;close all;

timestamp = datestr(now, 'yyyy-mm-dd_HH-MM-SS');
filename = strcat('log_', timestamp, '.txt');
fileID = fopen(filename, 'w');% ��ʼ��¼��־�� log.txt

col1 = round(rand(1,5) * 100) / 100;
col2 = round(rand(1,5) * 100) / 100;
col3 = col1.*3 + col2.*2;
col4 = round((col1 + 0.1.*randn(1,5))* 100) / 100;
col5 = round(10*randn(1,5) * 100) / 100;
% col6 = col1.*3 + 100;
% col7 = randn(size(col1));
% col8 = rand(size(col1));

% test_data = cat(2, col1',col2',col3',col4',col5',col6',col7',col8');
% test_data = cat(2, col1',col2',col3',col4',col5');
test_data = [0.53	0.55	2.69	0.67	-8.98;
0.41	0.58	2.39	0.36	-7.92;
0.6	0.51	2.82	0.79	-9.53;
0.75	0.08	2.41	0.73	3.54;
0.58	0.72	3.18	0.56	15.97;
];

% test_data_col = mean(test_data, 1);
% % ��ÿ�еľ�ֵ��չΪ��ԭ������ͬ�����ľ���
% col_means_expanded = repmat(test_data_col, size(test_data, 1), 1);
% % ��ԭʼ�����м�ȥ�����չ��ľ���
% test_data2 = test_data - col_means_expanded;

% [U,S,V] = svd(test_data,"eco");
% T=S*V';

[m,n] = size(test_data);
results =zeros(1,n);


Q = eye(m);
R = test_data;

  for j = 1:n-1
    for i = m:-1:(j+1)
      G = eye(m);
      [c,s] = givensrotation( R(i-1,j),R(i,j) );
      G([i-1, i],[i-1, i]) = [c -s; s c];
      R = G'*R;                 %RΪǰj��Ϊ�����Ǿ���
      if i == j+1
          fprintf(fileID,'\n');
          printm(fileID,R);
          C=sum(R(1:j, j+1).^2,1);      %��j+1�У�ǰj�е�ƽ����
          B=sum(R(j+1:m, j+1).^2,1);        %��j+1��,j+1��֮���ƽ����
          results(j+1) = B/(B+C);
          fprintf(fileID,'\n');
          printm(fileID,results);
      end
    end
  end
  
fprintf(fileID,'\n final result after normalize\n');
printm(fileID,results);

figure
% ��ά��֮������ϵ��
rho = corr(test_data, 'type','pearson');
x=abs(rho);
% ������ͼ
h = heatmap(x);
h.Title = 'pearson correlation';
colormap(summer(5))