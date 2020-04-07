clc,clear all,close all;
% Linear Classification via LSE
% Written By: Rasit EVDÜZEN
% 07-Apr-2020

% Create Data 
x = [1 1.5; 2 2; 3 4; 4 3; 5 5; 1 0; 2 0.5; 3 1; 4 1.5; 5 2];
y = [1 1 1 1 1 -1 -1 -1 -1 -1]';


% Algorithm
A = [x(:,1) x(:,2) ones(length(x),1)];
b = [y];
xstar = inv(A'*A)*A'*b;

% Algorithm Test
t_test = [];
for i=-1:0.05:6
    for j=-1:0.05:6
        t_test = [t_test; i j];
    end
end
% Plot Data
set(gcf, 'units','normalized','outerposition',[0.2 0.2 0.7 0.7]);
subplot(122)
ytest = xstar(1)*t_test(:,1) + xstar(2)*t_test(:,2) + xstar(3);
ytest = sign(ytest);
hold on,grid on
yto = find(ytest==1);
ytz = find(ytest==-1);
plot(t_test(yto,1),t_test(yto,2),'g.'),hold on,grid on
plot(t_test(ytz,1),t_test(ytz,2),'y.'),axis([-2 7 -2 7])


yo = find(y==-1);
yz = find(y==1);
plot(x(yo,1),x(yo,2),'ro','MarkerFaceColor',[1 0 0],'MarkerSize',8)
plot(x(yz,1),x(yz,1),'bs','MarkerFaceColor',[0 0 1],'MarkerSize',8)

title('Linear Classification via LSE')


subplot(121)
x = [0 0; 0 1; 1 0; 1 1];
y = [0 1 1 0]';
yo = find(y==1);
yz = find(y==0);

plot(x(yo,1),x(yo,2),'ro','MarkerFaceColor',[1 0 0],'MarkerSize',8),hold on,grid on
plot(x(yz,1),x(yz,1),'b*','MarkerFaceColor',[1 0 0],'MarkerSize',8),axis([-0.1 1.1 -0.1 1.1])
title('Exor Problem - Nonlinear Separable')