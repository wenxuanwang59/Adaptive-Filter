close all;
clear;
clc;
            
t = linspace(0,2*pi,400000)';
s1 = 100*sin(t);
noise =  wgn(1, 400000, -20)'; % set white noise
x = s1 + noise; 
%% Add white noise
% % % 
% fs=4;               %设定采样频率
% N=1;                %采样点数
% n=0:N-1;
% t=n/fs;
% f1=4;                %设定正弦信号频率
% s1=sin(2*pi*f1*t);    %生成正弦信号
% 
%  % load audio
% % sound(d,fs)   % play audio
% n = length(s1);   % the length of audio
% noise =  wgn(1, n, -20)'; % set white noise
% x = s1 + noise;   % add noise to the original audio
% % pause(15)
mu =  0.001;  % set the stepsize
M = 80; % set the numbers of taps
lamda = 0.99;
hold on

%% LMS and RLS performance 

%[e, y, w] = LMS(d, x,lamda,M);

[e, y, w] = RLS(ge, x,lamda,M);


% plot
figure()
subplot(3,1,1)
plot([1:length(ge)]/fs,s1);
xlabel('time');
title('Input');

subplot(3,1,2)

plot([1:length(x)]/fs,x);
xlabel('time');
title('Input + Noise');

subplot(3,1,3)
plot([1:length(y)]/fs,y);
xlabel('time');
%title('LMS Output');
title('RLS Output');
