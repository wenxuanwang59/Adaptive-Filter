close all;
clear;
clc;
%% Add white noise
% % 
[d,fs] = audioread('one.wav'); % load audio
% sound(d,fs)   % play audio
n = length(d);   % the length of audio
noise =  wgn(1, n, -20)'; % set white noise
x = d + noise;   % add noise to the original audio
% pause(15)
sound(x,fs);   % play the mixed audio
mu =  0.001;  % set the stepsize
M = 80; % set the numbers of taps
lamda = 0.99;
%% Add single frequency noise 
% % 
% [d, fs] = audioread('news1.wav'); % load audio
% % sound(d,fs)   % play audio
% 
% n = length(d); % the length of audio
% T = n/fs;
% t = 0:1/fs:T-1/fs;
% noise = cos(2*pi*t*370)';
% x = d + noise;  % add noise to the original audio
% 
% pause(10)
% sound(x,fs);
% 
% M = 50;
% lamda = 0.9999; % set the weight parameter
% 


%% LMS and RLS performance 

[e, y, w] = LMS(d, x,lamda,M);

%[e, y, w] = RLS(d, x,lamda,M);


pause(5)    
sound(y,fs);

% plot
figure()
subplot(3,1,1)
plot([1:length(d)]/fs,d);
xlabel('time');
title('Input');

subplot(3,1,2)

plot([1:length(x)]/fs,x);
xlabel('time');
title('Input + Noise');

subplot(3,1,3)
plot([1:length(y)]/fs,y);
xlabel('time');
title('LMS Output');
%title('RLS Output');

figure(
