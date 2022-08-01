%% I. ��ջ���
clc
clear all
%% II. ����˵��
% C                         -- n�����е�����
% NC_max                    -- ����������
% m                         -- ��Ⱥ�����ϵ�������һ������Ϊ���е�1.5��
% D(i, j)                   -- ������i��֮��ľ���
% Eta(i, j) = 1 ./ D(i, j)  -- ��������
% alpha                     -- ������Ϣ����Ҫ�̶ȵĲ���
% beta                      -- ��������������Ҫ�̶ȵĲ���
% rho                       -- ��Ϣ�ػӷ�����
% Q                         --
% rBest                     -- ������ѵ�·��
% lBest                     -- �������·�ߵĳ���
% lAverage                  --������ƽ������
 
%% III. �������λ������
citys = [18.4700   95.1000
     16.4700   94.6400
     20.0900   94.5400
     14.3900   93.3700
     25.2300   97.2400
     22.0000   93.0500
     23.4700   92.0200
     16.2000   96.2900
     17.3000   97.3800
     13.0500   98.1200
     15.5300   97.3800
     24.5200   95.5900
     16.4100   97.1300
     15.0900   92.5500];
 
%% IV. ����������
D = Distance(citys);                                        % ����������
n = size(D, 1);                                             % ���еĸ���
  
%% V. ��ʼ������
NC_max = 200;                                               % ������������ȡ100~500֮��
m = 22;                                                     % ���ϵĸ�����һ����Ϊ����������1.5��
alpha = 1;                                                  % �� ѡ��[1, 4]�ȽϺ���
beta = 4;                                                   % �� ѡ��[3 4 5]�ȽϺ���
rho = 0.2;                                                  % �� ѡ��[0.1, 0.2, 0.5]�ȽϺ���
Q = 20;
NC = 1;                                                     % ����������һ��ʼΪ1
 
Eta = 1 ./ D;                                               % �� = 1 / D(i, j) ,�����Ǿ���
Tau = ones(n, n);                                           % Tau(i, j)��ʾ��(i, j)����Ϣ������һ��ʼ��Ϊ1
Table = zeros(m, n);                                        % ·����¼��
 
rBest = zeros(NC_max, n);                                   % ��¼���������·��
lBest = inf .* ones(NC_max, 1);                             % ��¼���������·�ߵ��ܳ���
lAverage = zeros(NC_max, 1);                                % ��¼����·�ߵ�ƽ������
 
%% VI. ����Ѱ�����·��
while NC <= NC_max
    % ��1������������������ϵ�������
    start = zeros(m, 1);
    for i = 1: m
        temp = randperm(n);
        start(i) = temp(1);
    end
    Table(:, 1) = start;                                    % Tabu��ĵ�һ�м����������ϵ�������
    citys_index = 1: n;                                     % ���г���������һ������
    % ��2�����������·��ѡ��
    for i = 1: m
        % �������·��ѡ��
        for j = 2: n
            tabu = Table(i, 1: (j - 1));                    % ����i�Ѿ����ʵĳ��м��ϣ��ƽ��ɱ�
            allow_index = ~ismember(citys_index, tabu);
            Allow = citys_index(allow_index);               % Allow����Ŵ����ʵĳ���
            P = Allow;
             
            % ����ӳ���j��ʣ��δ���ʵĳ��е�ת�Ƹ���
            for k = 1: size(Allow, 2)                       % �����ʵĳ�������
                P(k) = Tau(tabu(end), Allow(k))^alpha * Eta(tabu(end), Allow(k))^beta;
            end
            P = P / sum(P);                                 % ��һ��
             
            % ���̶ķ�ѡ����һ�����ʳ��У�Ϊ����������ԣ�
            Pc = cumsum(P);
            target_index = find(Pc >= rand);
            target = Allow(target_index(1));
            Table(i, j) = target;      
        end
    end
     
    % ��3��������������ϵ�·������
    length = zeros(m, 1);
    for i = 1: m
        Route = Table(i, :);
        for j = 1: (n - 1)
            length(i) = length(i) + D(Route(j), Route(j + 1));
        end
        length(i) = length(i) + D(Route(n), Route(1));
    end
     
    % ��4�����������·�����뼰ƽ������
    if NC == 1
        [min_Length, min_index] = min(length);
        lBest(NC) = min_Length;
        lAverage(NC) = mean(length);
        rBest(NC, :) = Table(min_index, :);
    else
        [min_Length, min_index] = min(length);
        lBest(NC) = min(lBest(NC - 1), min_Length);
        lAverage(NC) = mean(length);
        if lBest(NC) == min_Length
            rBest(NC, :) = Table(min_index, :);
        else
            rBest(NC, :) = rBest((NC - 1), :);
        end
    end
    % ��5����������Ϣ��
    Delta_tau = zeros(n, n);
    for i = 1: m         
        for j = 1: (n - 1)
            Delta_tau(Table(i, j), Table(i, j + 1)) = Delta_tau(Table(i, j), Table(i, j + 1)) + Q / length(i);
        end
        Delta_tau(Table(i, n), Table(i, 1)) = Delta_tau(Table(i, n), Table(i, 1)) + Q / length(i);
    end
    Tau = (1 - rho) .* Tau + Delta_tau;
 
    % ��6��������������1���������·����¼��
    NC = NC + 1;
    Table = zeros(m, n);
end
%% VII. �����ʾ
[shortest_Length, shortest_index] = min(lBest);
shortest_Route = rBest(shortest_index, :);
disp(['��̾���:' num2str(shortest_Length)]);
disp(['���·��:' num2str([shortest_Route shortest_Route(1)])]);
 
%% VIII. ��ͼ
figure(1)
plot([citys(shortest_Route,1); citys(shortest_Route(1),1)],...
     [citys(shortest_Route,2); citys(shortest_Route(1),2)],'o-');
grid on
for i = 1: size(citys, 1)
    text(citys(i, 1), citys(i, 2), ['   ' num2str(i)]);
end
text(citys(shortest_Route(1), 1), citys(shortest_Route(1), 2), '       ���');
text(citys(shortest_Route(end), 1), citys(shortest_Route(end), 2), '       �յ�');
xlabel('����λ�ú�����')
ylabel('����λ��������')
title(['��Ⱥ�㷨�Ż�·��(��̾���: ' num2str(shortest_Length) ')'])
figure(2)
plot(1: NC_max, lBest, 'b', 1: NC_max, lAverage, 'r:')
legend('��̾���', 'ƽ������')
xlabel('��������')
ylabel('����')
title('������̾�����ƽ������Ա�')