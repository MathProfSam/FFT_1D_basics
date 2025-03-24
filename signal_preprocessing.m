% Pre-process a recorded sound signal. We want it to be a power of two in
% length. 
%
% Samuli Siltanen March 2025

[talk_clip_orig,Fs] = audioread('signal_processing_needs_matrices.aifc');

% Listen to the signal (comment if you don't want to wait; it starts with 
% a long silence)
%sound(talk_clip_orig,Fs)

% Crop the signal
N = 17;
talk_clip = talk_clip_orig(105000+[1:2^N]);

% Plot the signal
figure(1)
clf
plot(talk_clip)

% Listen to the cropped signal. (Comment or uncomment the following line if
% you don't want / want to hear the audio.) 
%sound(talk_clip,Fs)

% Save cropped signal to file
save signal_processing_needs_matrices talk_clip Fs N
