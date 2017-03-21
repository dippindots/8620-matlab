close all;
%clear all;
clc;

%plot one circle
[x1, y1] = getCircle([25,80], 20);
[x2, y2] = getCircle([75,80], 20);
[x3, y3] = getCircle([50,20], 20);
figure
hold on
plot(x1,y1)
plot(x2,y2)
plot(x3,y3)
hold off
xset = 100;
yset = 100;
set(gca,'XLim',[0 xset]);%X????????
set(gca,'YLim',[0 yset]);%X????????
%set(gca,'XTick',[0:0.1:1.5]);%?????????
dis = zeros(100,100);
flag = zeros(100,100);
for i = 1:100
    for j = 1:100
        dis(i,j) = ((i-25)^2 + (j-80)^2) - 20^2;
        if (dis(i,j)>=0)
            flag(i,j) = 1;
        end
    end
end
figure 
hold on
for i = 1:100
    for j = 1:100
        if flag(i,j) == 0
            scatter(i,j,100,'r+');
        end
    end
end
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot two circles
dis = zeros(100,100);
dis1 = zeros(100,100);
dis2 = zeros(100,100);
flag = zeros(100,100);
for i = 1:100
    for j = 1:100
        dis1(i,j) = ((i-25)^2 + (j-80)^2) - 20^2;
        dis2(i,j) = ((i-75)^2 + (j-80)^2) - 20^2;
        if (dis1(i,j)>dis2(i,j))
            dis(i,j) = dis2(i,j);
        else
            dis(i,j) = dis1(i,j);
        end
        if (dis(i,j)>=0)
            flag(i,j) = 1;
        end
    end
end
figure 
hold on
for i = 1:100
    for j = 1:100
        if flag(i,j) == 0
            scatter(i,j,100,'r+');
        end
    end
end
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot three circles
dis = zeros(100,100);
dis1 = zeros(100,100);
dis2 = zeros(100,100);
dis3 = zeros(100,100);
flag = zeros(100,100);
for i = 1:100
    for j = 1:100
        dis1(i,j) = ((i-25)^2 + (j-80)^2) - 20^2;
        dis2(i,j) = ((i-75)^2 + (j-80)^2) - 20^2;
        dis3(i,j) = ((i-50)^2 + (j-20)^2) - 20^2;
        if (dis1(i,j)>dis2(i,j)>dis3(i,j))
            dis(i,j) = dis3(i,j);
        end
        if (dis2(i,j)>dis1(i,j)>dis3(i,j))
            dis(i,j) = dis3(i,j);
        end        

        if (dis1(i,j)>dis3(i,j)>dis2(i,j))
            dis(i,j) = dis2(i,j);
        end
        if (dis3(i,j)>dis1(i,j)>dis2(i,j))
            dis(i,j) = dis2(i,j);
        end
        
        if (dis3(i,j)>dis2(i,j)>dis1(i,j))
            dis(i,j) = dis1(i,j);
        end
        if (dis2(i,j)>dis3(i,j)>dis1(i,j))
            dis(i,j) = dis1(i,j);
        end
        
        if (dis(i,j)>=0)
            flag(i,j) = 1;
        end
    end
end
figure 
hold on
for i = 1:100
    for j = 1:100
        if flag(i,j) == 0
            scatter(i,j,100,'r+');
        end
    end
end
hold off



%plot circle function
function [x, y] = getCircle(center, r)
t=0:0.01*pi:2*pi;
x=cos(t).*r+center(1);y=sin(t).*r+center(2); 
end

