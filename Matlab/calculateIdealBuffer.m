function [idealBuffer, idealBufferRound] = calculateIdealBuffer(lambda,p,Pt,Pr,Pa)
hold on

syms B real

C = 2.2*Pt*p*exp(-(1/lambda) * B) + (2*Pt+1.5*Pr)*(B+lambda*(exp(-(1/lambda)*B)-1))...
    +2.5*Pa*lambda*exp(-(1/lambda)*B); %generalised cost function

fplot(C, [0,16]); %plot of the cost function

C2 = diff(C , B); %first derivative

fplot(C2, [0,16]); %plot of the first derivate

res = solve(C2 == 0, B, 'maxDegree' , 5); %calculating the minimum
idealBuffer = double(vpa(res, 6)); %numeric value 4 significant numbers 
idealBufferRound = round(idealBuffer); %round the value

yline(0); %plot y axis
xline(idealBuffer); %plot idealBuffer x line
plot(idealBuffer, subs(C,idealBuffer),'O','MarkerFaceColor','b'); %plot idealBuffer point

txt = sprintf('  <- IdealBuffer %0.4f', idealBuffer );
text(idealBuffer,subs(C,idealBuffer), txt, 'FontSize' , 14);
end

