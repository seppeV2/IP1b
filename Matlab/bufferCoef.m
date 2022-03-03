Pt=119;
Pa=3491;
Pr=1745;
p=60;
lambda=2;
[idealBufferRound, idealBuffer, nCoef, pCoef, C] = calculateIdealBuffer(lambda,p,Pt,Pr,Pa,1);
XPoints1 = [0, idealBuffer, 2*idealBuffer];
YPoints1 = [double(subs(C,0)), double(subs(C,idealBuffer)),double(subs(C,2*idealBuffer))];


hold on 
plot(XPoints1, YPoints1);