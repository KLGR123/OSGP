FS=44100;
[x1,FS]=audioread('lMS.wav'); % 将 WAV 文件转换成变量  
lf=x1(:,1); % 抽取第 1 声道  
rf=x1(:,2); % 抽取第 2 声道  
[x2,FS]=audioread('lXY.wav'); % 将 WAV 文件转换成变量  
lb=x2(:,1); % 抽取第 3 声道  
rb=x2(:,2); % 抽取第 2 声道  
w=0.5*(lf+lb+rf+rb);
x=0.5*((lf-lb)+(rf-rb));
y=0.5*((lf-rb)-(rf-lb));
z=0.5*((lf-lb)-(rb-rf));
W=rms(w);
Y=rms(y);
X=rms(x);
Z=rms(z);
a=atan(Y/X)
