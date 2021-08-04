% Code for PWM (Pulse Width Modulation) generation in MATLAB  By Jaseem vp 
% http://www.circuitsgallery.com/2012/03/code-for-pwm-pulse-width-modulation.html

% clc;
% clear all;
close all;
te=0.009;	% time range
fs=8000;	% Sampling rate 48kHz
Ft=440;		%input('Note frequency (Hz)=');
Fcs=2*fs;	%input('Carrier Sawtooth frequency=');
A=5;	%  Maximum Amplitude
t=0:1/(256*fs):te;	% t second n times fs sample points per second
tb=0:1/fs:te;		% t second  fs sample points per second
c=A.*sawtooth(2*pi*Fcs*t);	%Carrier sawtooth
subplot(3,1,1);
plot(t,c,'-g');
xlabel('Time (sec)');
ylabel('Amplitude');
title('Note Signal A4 and Carrier sawtooth wave ');
grid on;
hold on;

m=0.75*A.*sin(2*pi*Ft*t);	%Note amplitude must be less than Sawtooth
subplot(3,1,1);
plot(t,m,'r');
axis([0 te/4 -A A]);	%X-Axis varies from 0 to n points & Y-Axis from -A to A
grid on;

n=length(c);	%Length of carrier sawtooth is stored to 'n'
for i=1:n	%Comparing Message and Sawtooth amplitudes
	if (m(i)>=c(i))
     		pwm(i)=1;
	else
     		pwm(i)=0;
	end
end
subplot(2,1,2);
plot(t,pwm);
xlabel('Time (sec) ');
ylabel('Amplitude');
title('PWM Wave');
axis([0 te/4 0 2]);	%X-Axis varies from 0 to n sample points & Y-Axis from 0 to 1
grid on; 
hold off;

%Inputs and Observation: 
% Message frequency=1
% Carrier Saw tooth frequency=10





