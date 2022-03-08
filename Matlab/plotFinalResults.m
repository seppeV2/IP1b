originalResults = [10470 1.2245*10^5 9.5656*10^4 6.83651*10^5 9.1209*10^5];
ip1aResults = [10470 1.1027*10^5 9.5881*10^4 5.4229*10^5 7.5891*10^5];
ip1bResults = [0 1.3975*10^05 6.7882 2.8010*10^5 5.971*10^5];
missed = [16.5092 5.1996 4.5034];
stop = [10470 10470 0];
late = [1.2245*10^5 1.1027*10^5 1.3975*10^5;9.5656*10^4 9.5881*10^4 1.7718*10^5;6.83651*10^5 5.4229*10^5 2.801*10^5;9.1209*10^5 7.5891*10^5 5.971*10^5];


y= categorical({'Original results','Results of IP1a','Results of IP1b'});
x=1:1:3;
close all
bar(y,missed,'r')
title('Overview percentage missed transfers')

figure
bar(y,stop,'b')
title('Overview stopping cost')

figure
b = bar(y,late)
leg = {'cost\_arriving\_late','cost\_through\_passengers','cost\_of\_transfers','total\_cost'};
legend(leg)
title('Overview costs with larger magnitude')
xtips2 = b(4).XEndPoints;
ytips2 = b(4).YEndPoints;
labels2 = string(b(4).YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center','VerticalAlignment','bottom')

