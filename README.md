# FFT_1D_basics
Matlab codes and other material for understanding the Fast Fourier Transform. Written by Samuli Siltanen in March 2025.

You can preprocess (crop) the sound signal by running signal_preprocessing.m. It will read in the recording “signal_processing_needs_matrices.aifc”, crop it to a vector of power-of-two length, and save the result to file “signal_processing_needs_matrices.mat”.

Run the routine filtering_experiments.m. You will hear how the low-pass filtered and high-pass filtered signals sound compared to the original clip. You can adjust the cutoff frequency by changing the value of the positive parameter a.

