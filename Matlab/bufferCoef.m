clear all
Pt=1745;
Pr=0;
Pa=22515;
p=60;
lambda=5;
[idealBufferRound, idealBuffer , nCoef, pCoef, C] = calculateIdealBuffer(lambda,p,Pt,Pr,Pa,1);

i=5;
j=5;
if idealBuffer < j
    j=idealBuffer;
end
nCoef=double((subs(C,(idealBuffer - j)) - subs(C,idealBuffer))/(j*10000));
pCoef=double((subs(C,idealBuffer+i) - subs(C,idealBuffer))/(i*10000));

XPoints1 = [idealBuffer-j, idealBuffer, idealBuffer+i];
YPoints1 = [double(subs(C,idealBuffer-j)), double(subs(C,idealBuffer)),double(subs(C,idealBuffer+i))];

disp('nCoef');
disp(nCoef);
disp('pCoef');
disp(pCoef);
hold on 
plot(XPoints1, YPoints1);
