function [idealBufferRound, idealBuffer] = calculateIdealBuffer(lambda,p,Pt,Pr,Pa,plot)

syms B real

C = 2.2*Pt*p*exp(-(1/lambda) * B) + (2*Pt+1.5*Pr)*(B+lambda*(exp(-(1/lambda)*B)-1))...
    +2.5*Pa*lambda*exp(-(1/lambda)*B); %generalised cost function
if plot
hold on
fplot(C, [0,16]); %plot of the cost function
end

C2 = diff(C , B); %first derivative

if plot
fplot(C2, [0,16]); %plot of the first derivate
end
res = solve(C2 == 0, B, 'maxDegree' , 5); %calculating the minimum
idealBuffer = double(vpa(res, 6)); %numeric value 4 significant numbers 
idealBufferRound = round(idealBuffer); %round the value

if plot
yline(0); %plot y axis
xline(idealBuffer); %plot idealBuffer x line
txt = sprintf('  <- IdealBuffer %0.4f', idealBuffer );
text(idealBuffer,subs(C,idealBuffer), txt, 'FontSize' , 14);
end
end

