I=imread('D:\XZTF\FinalProgram\resource\P01\ - 0023.png');
name=23;
%figure;imshow(I);

%ȥ������
I=~I;
I=bwareaopen(I,50);
I=~I;

%ͼƬ����
I=ImageSlice(I);
[m,n]=size(I);
%figure;imshow(I);
if mod(name,2)==0
    isLeft=1;
else
    isLeft=0;
end
if isLeft==1
    I=imcrop(I,[n-1300,1,n,m-1]);
else
    I=imcrop(I,[1,1,1301,m-1]);
end
figure;imshow(I);
[m,n]=size(I);
left=1;right=n;
while sum(I(1:m,left))~=m
    left=left+1;
end
while sum(I(1:m,right))~=m
    right=right-1;
end
I=imcrop(I,[left,1,right-left,m-1]);   



%�����д洢��λ
Rolls=cell(1,3);
RollsRemains=cell(1,3);
Tempt=I;
for i=1:3
    [Rolls{i},RollsRemains{i}]=RollSlice(Tempt);
    Tempt=RollsRemains{i};
end

%���и�
for i=1:3
    Rolls{i}=RollCrop(Rolls{i});
end

%������

    tempt=Rolls{1};
    Rolls{1}=Rolls{3};
    Rolls{3}=tempt;



%�����д洢��λ
Blocks=cell(1,100);
BRemains=cell(1,100);
isLast=cell(1,100);

%��ʼ�������и�
WordTempt=Rolls{1};
m=1;counts=0;

for j=1:3
    WordTempt=Rolls{j};
for i=m:90
     counts=counts+1;
     [Blocks{i},BRemains{i},isLast{i}]=BlockSlice(WordTempt);
     [m,n]=size(Blocks{i});
     if isLast{i}==0
         WordTempt=BRemains{i};
     else
         Blocks{i+1}=BRemains{i};
         m=i+2;
         counts=counts+1;
         break;
     end
end
end



%���޼�&��ɸѡ
for i=1:counts
    Blocks{i}=~Blocks{i};
    Blocks{i}=bwareaopen(Blocks{i},50);
    Blocks{i}=~Blocks{i};
    Blocks{i}=BlockCrop(Blocks{i});
end



isUseful=cell(1,counts);
Notes=cell(1,counts);
for i=1:counts
    [isUseful{i},Blocks{i},Notes{i}]=BlockScreen(Blocks{i});
    if isUseful{i}==0
        Blocks{i}=[];
        Notes{i}=[];
    else
        Blocks{i}=BlockCrop(Blocks{i});
        Notes{i}=BlockCrop(Notes{i});       
    end
end

NumberCount=0;
%�鱣��
for i=1:counts
    if isempty(Blocks{i})
        continue;
    end
    NumberCount=NumberCount+1;
    Notes{i}=~Notes{i};
    Notes{i}=bwareaopen(Notes{i},100);
    Notes{i}=~Notes{i};
    name=num2str(NumberCount);
    Blocks{i}=imresize(Blocks{i},[115,115]);
    Blocks{i}=BlockResize(Blocks{i});
    [m,n]=size(Blocks{i});
    imwrite(Blocks{i},['D:\XZTF\FinalProgram\results\BBB\',name,'.png']);
    for j=1:m
        for k=1:n
            Blocks{i}(j,k)=0;
        end
    end
    imwrite(Blocks{i},['D:\XZTF\FinalProgram\results\DDD\',name,'.png']);
    NoteSlice(NumberCount,Notes{i});
    end



















