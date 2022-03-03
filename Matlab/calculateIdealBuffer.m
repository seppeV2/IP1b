function [idealBufferRound, idealBuffer, pCoef, nCoef, C] = calculateIdealBuffer(lambda,p,Pt,Pr,Pa,plot)

clear all

syms B real

C = 2.2*Pt*p*exp(-(1/lambda) * B) + (2*Pt+1.5*Pr)*(B+lambda*(exp(-(1/lambda)*B)-1))...
    +2.5*Pa*lambda*exp(-(1/lambda)*B); %generalised cost function
if plot
hold on
fplot(C, [0,30]); %plot of the cost function
end

C2 = diff(C , B); %first derivative
res = solve(C2 == 0, B, 'maxDegree' , 5); %calculating the minimum
idealBuffer = double(vpa(res, 6)); %numeric value 4 significant numbers 
idealBufferRound = round(idealBuffer); %round the value

if plot
yline(0); %plot y axis
xline(idealBuffer); %plot idealBuffer x line
txt = sprintf('  <- IdealBuffer %0.4f', idealBuffer );
text(idealBuffer,subs(C,idealBuffer), txt, 'FontSize' , 14);
end

disp('ideal buffer');
disp(idealBuffer);
disp('round ideal buffer');
disp(idealBufferRound);
disp('y value ideal buffer');
disp(vpa(subs(C,idealBuffer),6));
disp('y value 0');
disp(vpa(subs(C,0),6));

i=5;
j=5;
if idealBuffer < j
    j=idealBuffer;
end
nCoef=double((subs(C,(idealBuffer - j)) - subs(C,idealBuffer))/(j*10000));
pCoef=double((subs(C,idealBuffer+i) - subs(C,idealBuffer))/(i*10000));



end

