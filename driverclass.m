clear;
clc;
[s1, sf1] = audioread('datafiles/sample1.wav');
[s2, sf2] = audioread('datafiles/sample2.wav');
s1 = transpose(s1);
s2 = transpose(s2);
M = [s1;s2];
source = ica(M);% call the ICA function
source1 = source(1,:);
source2 = source(2,:);

Fs = 44100;

source1 = source1./(max(abs(source1)));
source2 = source2./(max(abs(source2)));
audiowrite('source1.wav',source1,Fs);
audiowrite('source2.wav',source1,Fs);
