tic
[data1, fs1] = wavread('502.wav');   %ikala��ԭ������
[ps1, nf1] = yaapt(data1, fs1, 1, [], 0, 2);  %�� yaapt���������������߹켣.������������ٱ������ڳ���Ϊ nf������������.
Pitch_fixed1=ptch_fix(ps1);
[data2, fs2] = wavread('501-voice.wav');      %�ɼ���Ƶ����������
[ps2, nf2] = yaapt(data2, fs2, 1, [], 0, 2);  %�� yaapt���������������߹켣.������������ٱ������ڳ���Ϊ nf������������.
Pitch_fixed2=ptch_fix(ps2);
plot(Pitch_fixed1, '.-');
figure
plot(Pitch_fixed2, '.-');
[data2, fs2] = wavread('503-voice.wav');      %ikala��ԭ��Ƶ����������
[ps2, nf2] = yaapt(data2, fs2, 1, [], 0, 2);  %�� yaapt���������������߹켣.������������ٱ������ڳ���Ϊ nf������������.
Pitch_fixed2=ptch_fix(ps2);
figure
plot(Pitch_fixed2, '.-');