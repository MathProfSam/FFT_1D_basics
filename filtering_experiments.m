% Low-pass filter and high-pass filter for a sound signal
% 
% Samuli Siltanen March 2025

%% Preliminaries

% Load precomputed sound signal of length 2^N
load signal_processing_needs_matrices talk_clip Fs N

% Listen to the signal
%sound(talk_clip,Fs)

% Apply fast Fourier transform
Ftalk_clip = fft(talk_clip);

% Let's take a look
figure(1)
clf
subplot(2,1,1)
plot(talk_clip)
xlim([1 2^N])
subplot(2,1,2)
plot(log(0.0001+abs(fftshift(Ftalk_clip))))
xlim([1 2^N])


%% Filtering

% Create coordinates
xi = [-2^(N-1):(2^(N-1)-1)]/2^(N-1);

% Build a low-pass filter
a = 600;
LPfilter = exp(-a*xi.^2);

% Build a high-pass filter
HPfilter = 1-LPfilter;

% Take a look
figure(2)
clf
subplot(3,1,1)
plot(xi,log(0.0001+abs(fftshift(Ftalk_clip))))
subplot(3,1,2)
plot(xi,LPfilter,'LineWidth',2)
subplot(3,1,3)
plot(xi,HPfilter,'LineWidth',2)

% Apply the filters
talk_clip_LP = ifft(fftshift(fftshift(Ftalk_clip).*LPfilter));
talk_clip_HP = ifft(fftshift(fftshift(Ftalk_clip).*HPfilter));

% Listen to the result
sound(talk_clip,Fs)
pause(3)
sound(talk_clip_LP,Fs)
pause(3)
sound(talk_clip_HP,Fs)

% Save results to file if you want
%audiowrite('talk_clip_orig.wav',talk_clip,Fs)
%audiowrite('talk_clip_LP.wav',talk_clip_LP,Fs)
%audiowrite('talk_clip_HP.wav',talk_clip_HP,Fs)