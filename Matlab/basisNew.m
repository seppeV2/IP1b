function [] = basisNew()

plot = 1;
lindoRes = transformLindoData('lindoResults.txt');

%stop C
STC1LE = lindoRes.STC1LE;
STC0LA = lindoRes.STC0LA;
%stop E
STE0AA = lindoRes.STE0AA;
STE0HA = lindoRes.STE0HA;
STE1AA = lindoRes.STE1AA;
STE1LE = lindoRes.STE1LE;
%stop M
STM0AA = lindoRes.STM0AA;
%STM0HE = lindoRes.STM0HE;
STM1AA = lindoRes.STM1AA;
%STM1LE = lindoRes.STM1LE;
%stop K
STK0AL = lindoRes.STK0AL;
STK0ST = lindoRes.STK0ST;
STK0LA = lindoRes.STK0LA;
STK1AL = lindoRes.STK1AL;
STK1ST = lindoRes.STK1ST;
STK1HA = lindoRes.STK1HA;
%schedule M
DM11HE = lindoRes.DM11HE;
DM11AA = lindoRes.DM11AA;
AM11LE = lindoRes.AM11LE;
AM10HE = lindoRes.AM10HE;
DM10AA = lindoRes.DM10AA;
DM10LE = lindoRes.DM10LE;
%schedule E
DE10LE = lindoRes.DE10LE;
DE10AA = lindoRes.DE10AA;
AE10HA = lindoRes.AE10HA;
AE11LE = lindoRes.AE11LE;
DE11AA = lindoRes.DE11AA;
DE11HA = lindoRes.DE11HA;
%schedule C
DC10LE = lindoRes.DC10LE;
AC10LA = lindoRes.AC10LA;
DC11LA = lindoRes.DC11LA;
AC11LE = lindoRes.AC11LE;
%schedule K
DK11LA = lindoRes.DK11LA;
DK11ST = lindoRes.DK11ST;
DK11AL = lindoRes.DK11AL;
AK11HA = lindoRes.AK11HA;
AK10LA = lindoRes.AK10LA;
DK10ST = lindoRes.DK10ST;
DK10AL = lindoRes.DK10AL;
DK10HA = lindoRes.DK10HA;








TT=3; %"necessary" transfer time is 3 minutes

%VOT: value of time, weight for different types of waiting
WEA= 2;     %early arrival, normal waiting
WMT= 2.2;   %waiting due to a missed train
WLA= 2.5;   %arriving late at final destination
WST= 1.5; 	%Waiting in a stopped train due to early arrival

%number of arriving passengers in end stations
%NEW END STATIONS LEUVEN,HASSELT, AARSCHOT AND LANDEN
ARE10Ha= 22515;
ARK11Ha= 8422;
ARK10La= 5109;
ARC10La= 53623;
ARE11Le= 7053.5;
ARM11Le= 5554.5;
ARC11Le= 14474;
ARM10Aa= 2000;
ARE10Aa= 14704;
ARM11Aa= 14992;
ARE11Aa= 4377;

%through passengers
THK1St=	4109;
THK1Al=	7945;
THK0Al=	7945;
THK0St=	4109;

THK11Ha=	8422;
THK10La=	0;
THC11Le=	43423;
THC10La=	0;
THM10Aa=	3002;
THM10He=	0;
THM11Aa=	3002;
THM11Le=	12151.5;
THE10Aa=	19024;
THE10Ha=	0;
THE11Aa=	19024;
THE11Le=	26674.5;

%transfer passengers
%NEW TRANSFERRING STATIONS LEUVEN,HASSELT, AARSCHOT AND LANDEN

TK10C21= 4817;
TC10K11= 4817;
TE10K20= 119;
TK11E21= 121;
TE11M10= 980;
TM11E10= 980;
TK11E10= 4227;
TE10K11= 1745;
TM11C20= 394;
TC11M10= 533;
TE11C20= 149;
TC11E20= 0;

Total_number_transfer_pass = TK10C21+TC10K11+TE10K20+TK11E21+TE11M10+...
    TM11E10+TK11E10+TE10K11+TM11C20+TC11M10+TE11C20+TC11E20;

disp(Total_number_transfer_pass);
%STOPPING TIMES

%new C train only start station and end station
SC1Le = STC1LE - 1;
SC0La = STC0LA - 1;

%E train
SE0Aa = STE0AA - 1;
SE0Ha = STE0HA - 1;
SE1Aa = STE1AA - 1;
SE1Le = STE1LE - 1;

%M train
SM0Aa = STM0AA - 1;
%SM0He = STM0HE - 1;
SM1Aa = STM1AA - 1;
SM1Le = 0; %no transfer so normal stopping time, stopping time = 1

%K train
SK0Al = STK0AL - 1;
SK0St = STK0ST - 1;
SK0La = STK0LA - 1;
SK1Al = STK1AL - 1;
SK1St = STK1ST - 1;
SK1Ha = STK1HA - 1;

stopping_cost = WST*(SC1Le*THC11Le+SC0La*THC10La+SE0Aa*THE10Aa+SE0Ha*THE10Ha+...
    SE1Aa*THE11Aa+SE1Le*THE11Le+SM0Aa*THM10Aa+SM1Aa*THM11Aa+...
    SM1Le*THM11Le+SK0Al*THK0Al+SK0St*THK0St+SK0La*THK10La+SK1Al*THK1Al+...
    SK1St*THK1St+SK1Ha*THK11Ha);

%scheduled departure times (and arriving) at the moment no 3 trains

%M train
DM11He=DM11HE;
DM21He=DM11He + 60;
DM31He=DM21He + 60;
DM11Aa=DM11AA;
DM21Aa=DM11Aa + 60;
DM31Aa=DM21Aa + 60;
AM11Le=AM11LE;
AM21Le=AM11Le + 60;
AM31Le=AM21Le + 60;
AM11Aa = DM11Aa - SM1Aa;
AM21Aa = AM11Aa + 60;
AM31Aa = AM21Aa + 60;

AM10He=AM10HE;
AM20He=AM10He + 60;
AM30He=AM20He + 60;
DM10Aa=DM10AA;
DM20Aa=DM10Aa + 60;
DM30Aa=DM20Aa + 60;
DM10Le=DM10LE;
DM20Le=DM10Le + 60;
DM30Le=DM20Le + 60;
AM10Aa = DM10Aa - SM0Aa;
AM20Aa = AM10Aa + 60;
AM30Aa = AM20Aa + 60;

%E-train
DE10Le=DE10LE;
DE20Le=DE10Le +60;
DE30Le=DE20Le +60;
DE10Aa=DE10AA;
DE20Aa=DE10Aa +60;
DE30Aa=DE20Aa +60;
AE10Ha=AE10HA;
AE20Ha=AE10Ha +60;
AE30Ha=AE20Ha +60;
DE10Ha = AE10Ha + SE0Ha;
DE20Ha = DE10Ha + 60;
DE30Ha = DE20Ha + 60;
AE10Aa = DE10Aa - SE0Aa;
AE20Aa = AE10Aa + 60;
AE30Aa = AE20Aa + 60;

AE11Le=AE11LE;
AE21Le=AE11Le +60;
AE31Le=AE21Le +60;
DE11Aa=DE11AA;
DE21Aa=DE11Aa +60;
DE31Aa=DE21Aa +60;
DE11Ha=DE11HA;
DE21Ha=DE11Ha +60;
DE31Ha=DE21Ha +60;
AE11Aa = DE11Aa - SE1Aa;
AE21Aa = AE11Aa + 60;
AE31Aa = AE21Aa + 60;


%C-train
DC10Le = DC10LE;
DC20Le = DC10Le + 60;
DC30Le = DC20Le + 60;
AC10La = AC10LA;
AC20La = AC10La + 60;
AC30La = AC20La + 60;

DC11La = DC11LA;
DC21La = DC11La + 60;
DC31La = DC21La + 60;
AC11Le = AC11LE;
AC21Le = AC11Le + 60;
AC31Le = AC21Le + 60;

%K-train
DK11La=DK11LA;
DK21La=DK11La + 60;
DK31La=DK21La + 60;
DK11St=DK11ST;
DK21St=DK11St + 60;
DK31St=DK21St + 60;
DK11Al=DK11AL;
DK21Al=DK11Al + 60;
DK31Al=DK21Al + 60;
AK11Ha=AK11HA;
AK21Ha=AK11Ha + 60;
AK31Ha=AK21Ha + 60;
DK11Ha = AK11Ha + STK1HA;
DK21Ha = DK11Ha + 60;
DK31Ha = DK21Ha + 60;


AK10La = AK10LA;
AK20La = AK10La + 60;
AK30La = AK20La + 60;
DK10St=DK10ST;
DK20St=DK10St + 60;
DK30St=DK20St + 60;
DK10Al=DK10AL;
DK20Al=DK10Al + 60;
DK30Al=DK20Al + 60;
DK10Ha=DK10HA;
DK20Ha=DK10Ha + 60;
DK30Ha=DK20Ha + 60;



% ideal running times first
%OLD TRAIN C IS GONE, NEW TRAIN C IS LeLa, OLD K STOPS IN LANDEN
%C
CLeLa=27;
%E
ELeAa=12;
EAaHa=25;
%K
KHaAl=6;
KAlSt=8;
KStLa=9;
%M
MLeAa=14;
MAaHe=12;

%late arrival, on average, during peak hours, 1/lambda
%late arrival counts in two ways
MHeAaav=2.31;
MAaLEav=2.69;
Cav=1.62;
Kav=1.38;
ELeAaav=1.30;
EAaHaav=3.7;

%number of simulation runs
a=500000;
%passengers_arriving_late: passengers arriving late more minutes than "too_late"
%cost_arriving_late is the cost associated with arriving late
%delay contains the minutes of delay
too_late=3;
%long_transfer_time if passengers have to wait more than "WA" minutes
WA=20;

%variables added to make plots at the end of this file
%amount of missed transfers


missedK10C21 = 0;
missedC10K11 = 0;
missedE10K20 = 0;
missedK11E21 = 0;
missedE11M10 = 0;
missedM11E10 = 0;
missedK11E10 = 0;
missedE10K11 = 0;
missedM11C20 = 0;
missedC11M10 = 0;
missedE11C20 = 0;
missedC11E20 = 0;

TCC10LA=0;
TCC11LE=0;
TCE10HA=0;
TCE10AA=0;
TCE11LE=0;
TCE11AA=0;
TCK11HA=0;
TCK10LA=0;
TCM11LE=0;
TCM11AA=0;
TCM10AA=0;


for i=1:1:a
    %determine the real arriving times
    %these are compared later with the scheduled arrival times
    ac11le= DC11La+CLeLa + (round(-Cav*log(rand)));
    ac10la = DC10Le + CLeLa  + (round(-Cav*log(rand)));
    
    ae10ha= DE10Aa+EAaHa +(round(-EAaHaav*log(rand)));
    ae10aa = DE10Le + ELeAa + (round(-ELeAaav*log(rand)));
    ae11le= DE11Aa+ELeAa + (round(-ELeAaav*log(rand)));
    ae11aa = DE11Ha + EAaHa + (round(-EAaHaav*log(rand)));
    
    ak11ha= DK11Al+KHaAl + (round(-Kav*log(rand)));
    ak10la= DK10ST+KStLa + (round(-Kav*log(rand)));
    
    am11le= DM11Aa+MLeAa + (round(-MAaLEav*log(rand)));
    am11aa = DM11He + MAaHe + (round(-MHeAaav*log(rand)));
    
    am10aa = DM10Le + MLeAa + (round(-MAaLEav*log(rand)));
    %am10he = DM10Aa + MAaHe + (round(-MHeAaav*log(rand)));
    
    %arriving and through passengers
    %C10
    if ac10la>AC10La							%we have a delay
        mc10=(ac10la-AC10La);					%minutes of delay
        pc10=mc10*ARC10La*WLA;					%cost of this delay
        pzc10=0;									%cost of arriving early
        if ac10la-AC10La>too_late
            uc10= ARC10La;	%number of passengers arriving late due to this delay
        else
            uc10=0;
        end
    else
        uc10=0;
        mc10=0;
        pc10=0;
        pzc10=(AC10La-ac10la)*THC10La*WST;     %cost of arriving early
        TCC10LA=TCC10LA + pzc10;
    end
    
    %C11
    if ac11le>AC11Le							%we have a delay
        mc11=(ac11le-AC11Le);					%minutes of delay
        pc11=mc11*ARC11Le*WLA;					%cost of this delay
        pzc11=0;									%cost of arriving early
        if ac11le-AC11Le>too_late
            uc11= ARC11Le;	%number of passengers arriving late due to this delay
        else
            uc11=0;
        end
    else
        uc11=0;
        mc11=0;
        pc11=0;
        pzc11=(AC11Le-ac11le)*THC11Le*WST;     %cost of arriving early
        TCC11LE=TCC11LE + pzc11;
    end
    
    %E10Ha
    if ae10ha>AE10Ha							%we have a delay
        me10ha=(ae10ha-AE10Ha);					%minutes of delay
        pe10ha=me10ha*ARE10Ha*WLA;					%cost of this delay
        pze10ha=0;									%cost of arriving early
        if ae10ha-AE10Ha>too_late
            ue10ha= ARE10Ha;	%number of passengers arriving late due to this delay
        else
            ue10ha=0;
        end
    else
        ue10ha=0;
        me10ha=0;
        pe10ha=0;
        pze10ha=(AE10Ha-ae10ha)*THE10Ha*WST;     %cost of arriving early
        TCE10HA=TCE10HA+pze10ha;
    end
    
    %E10Aa
    if ae10aa>AE10Aa							%we have a delay
        me10aa=(ae10aa-AE10Aa);					%minutes of delay
        pe10aa=me10aa*ARE10Aa*WLA;					%cost of this delay
        pze10aa=0;									%cost of arriving early
        if ae10aa-AE10Aa>too_late
            ue10aa= ARE10Aa;	%number of passengers arriving late due to this delay
        else
            ue10aa=0;
        end
    else
        ue10aa=0;
        me10aa=0;
        pe10aa=0;
        pze10aa=(AE10Aa-ae10aa)*THE10Aa*WST;     %cost of arriving early
        TCE10AA=TCE10AA+pze10aa;
    end
    
    
    %E11Le
    if ae11le>AE11Le
        me11le=(ae11le-AE11Le);
        pe11le=me11le*ARE11Le*WLA;
        pze11le=0;
        if ae11le-AE11Le>too_late
            ue11le= ARE11Le;
        else
            ue11le=0;
        end
    else
        ue11le=0;
        me11le=0;
        pe11le=0;
        pze11le=(AE11Le-ae11le)*THE11Le*WST;
        TCE11LE=TCE11LE+pze11le;
    end
    
    %E11Aa
    if ae11aa>AE11Aa
        me11aa=(ae11aa-AE11Aa);
        pe11aa=me11aa*ARE11Aa*WLA;
        pze11aa=0;
        if ae11aa-AE11Aa>too_late
            ue11aa= ARE11Aa;
        else
            ue11aa=0;
        end
    else
        ue11aa=0;
        me11aa=0;
        pe11aa=0;
        pze11aa=(AE11Aa-ae11aa)*THE11Aa*WST;
        TCE11AA=TCE11AA + pze11aa;
    end
    
    %K10
    if ak10la>AK10La								%we have a delay
        mk10=(ak10la-AK10La);					%minutes of delay
        pk10=mk10*ARK10La*WLA;					%cost of this delay
        pzk10=0;
        if ak10la-AK10La>too_late
            uk10= ARK10La;	%number of passengers arriving late due to this delay
        else
            uk10=0;
        end
    else
        uk10=0;
        mk10=0;
        pk10=0;
        pzk10=(AK10La-ak10la)*THK10La*WST;
        TCK10LA=TCK10LA + pzk10;
        
        
    end
    
    %K11
    if ak11ha>AK11Ha								%we have a delay
        mk11=(ak11ha-AK11Ha);					%minutes of delay
        pk11=mk11*ARK11Ha*WLA;					%cost of this delay
        pzk11=0;
        if ak11ha-AK11Ha>too_late
            uk11= ARK11Ha;	%number of passengers arriving late due to this delay
        else
            uk11=0;
        end
    else
        uk11=0;
        mk11=0;
        pk11=0;
        pzk11=(AK11Ha-ak11ha)*THK11Ha*WST;
        TCK11HA=TCK11HA+pzk11;
    end
    
    %M11Le
    if am11le>AM11Le								%we have a delay
        mm11le=(am11le-AM11Le);					%minutes of delay
        pm11le=mm11le*ARM11Le*WLA;					%cost of this delay
        pzm11le=0;
        if am11le-AM11Le>too_late
            um11le= ARM11Le;	%number of passengers arriving late due to this delay
        else
            um11le=0;
        end
    else
        um11le=0;
        mm11le=0;
        pm11le=0;
        pzm11le=(AM11Le-am11le)*THM11Le*WST;
        TCM11LE=TCM11LE + pzm11le;
    end
    
    %M11Aa
    if am11aa>AM11Aa								%we have a delay
        mm11aa=(am11aa-AM11Aa);					%minutes of delay
        pm11aa=mm11aa*ARM11Aa*WLA;					%cost of this delay
        pzm11aa=0;
        if am11aa-AM11Aa>too_late
            um11aa= ARM11Aa;	%number of passengers arriving late due to this delay
        else
            um11aa=0;
        end
    else
        um11aa=0;
        mm11aa=0;
        pm11aa=0;
        pzm11aa=(AM11Aa-am11aa)*THM11Aa*WST;
        TCM11AA=TCM11AA+pzm11aa;
    end
    
    %M10Aa
    if am10aa>AM10Aa								%we have a delay
        mm10aa=(am10aa-AM10Aa);					%minutes of delay
        pm10aa=mm10aa*ARM10Aa*WLA;					%cost of this delay
        pzm10aa=0;
        if am10aa-AM10Aa>too_late
            um10aa= ARM10Aa;	%number of passengers arriving late due to this delay
        else
            um10aa=0;
        end
    else
        um10aa=0;
        mm10aa=0;
        pm10aa=0;
        pzm10aa=(AM10Aa-am10aa)*THM10Aa*WST;
        TCM10AA=TCM10AA + pzm10aa;
    end
    
%     %M10He
%     if am10he>AM10He								%we have a delay
%         mm10he=(am10he-AM10He);					%minutes of delay
%         pm10he=mm10he*ARM10He*WLA;					%cost of this delay
%         pzm10he=0;
%         if am10he-AM10He>too_late
%             um10he= ARM10He;	%number of passengers arriving late due to this delay
%         else
%             um10he=0;
%         end
%     else
%         um10he=0;
%         mm10he=0;
%         pm10he=0;
%         pzm10he=(AM10He-am10he)*THM10He*WST;
%     end
    
    
    
    
    passengers_arriving_late(i)=uc10+ue11le+uk11+uk10+um11le+uc11+ue10ha+...
        ue10aa+ue11aa+um11aa+um10aa; %+um10he;
    delay(i)=mc10+me11le+mk11+mk10+mm11le+mc11+me10ha+me10aa+me11aa+...
        mm11aa+mm10aa;%+mm10he;
    cost_arriving_late(i)=pc10+pe11le+pk11+pk10+pm11le+pc11+pe10ha+pe10aa+...
        pe11aa+pm11aa+pm10aa;%+pm10he;
    cost_through_passengers(i)=pzc10+pze11le+pzk11+pzk10+pzm11le+pzc11+...
        pze10ha+pze10aa+pze11aa+pzm11aa+pzm10aa;%+pzm10he;
    
    
    
    
    
    
    %transfers
    
    %K10C21
    if ak10la + TT> DC21La
        missedK10C21 = missedK10C21 + 1;
        cmk10c21 = (DC31La-ak10la-TT)*TK10C21*WMT;
        pmk10c21 = TK10C21;
        plk10c21 = TK10C21;
    else
        cmk10c21 = (DC21La-ak10la-TT)*TK10C21*WEA;
        pmk10c21 = 0;
        if ak10la+TT+WA<DC21La
            plk10c21 = TK10C21;
        else
            plk10c21 = 0;
        end
    end
    
    %C10K11
    if ac10la + TT> DK11La
        missedC10K11 = missedC10K11 + 1;
        cmc10k11 = (DK31La-ac10la-TT)*TC10K11*WMT;
        pmc10k11 = TC10K11;
        plc10k11 = TC10K11;
    else
        cmc10k11 = (DK11La-ac10la-TT)*TC10K11*WEA;
        pmc10k11 = 0;
        if ac10la+TT+WA<DK11La
            plc10k11 = TC10K11;
        else
            plc10k11 = 0;
        end
    end
    
    %E10K20	Aarshot	Alken (Hasselt)
    if ae10ha + TT> DK20Ha
        missedE10K20 = missedE10K20 +1;
        cme10k20 = (DK30Ha-ae10ha-TT)*TE10K20*WMT;
        pme10k20 = TE10K20;
        ple10k20 = TE10K20;
    else
        cme10k20 = (DK20Ha-ae10ha-TT)*TE10K20*WEA;
        pme10k20 = 0;
        if ae10ha+TT+WA<DK20Ha
            ple10k20 = TE10K20;
        else
            ple10k20 = 0;
        end
    end
    
    %K11E21	Alken	Aarshot (Hasselt)
    if ak11ha + TT> DE21Ha
        missedK11E21 = missedK11E21 + 1;
        cmk11e21 = (DE31Ha-ak11ha-TT)*TK11E21*WMT;
        pmk11e21 = TK11E21;
        plk11e21 = TK11E21;
    else
        cmk11e21 = (DE21Ha-ak11ha-TT)*TK11E21*WEA;
        pmk11e21 = 0;
        if ak11ha+TT+WA<DE21Ha
            plk11e21 = TK11E21;
        else
            plk11e21 = 0;
        end
    end
    
    %E11M10	Hasselt	Heist
    if ae11aa + TT> DM10Aa
        missedE11M10 = missedE11M10 + 1;
        cme11m10 = (DM20Aa-ae11aa-TT)*TE11M10*WMT;
        pme11m10 = TE11M10;
        ple11m10 = TE11M10;
    else
        cme11m10 = (DM10Aa-ae11aa-TT)*TE11M10*WEA;
        pme11m10 = 0;
        if ae11aa+TT+WA<DM10Aa
            ple11m10 = TE11M10;
        else
            ple11m10 = 0;
        end
    end
    %M11E10	Heist	Hasselt
    if am11aa + TT> DE10Aa
        missedM11E10 = missedM11E10 +1;
        cmm11e10 = (DE20Aa-am11aa-TT)*TM11E10*WMT;
        pmm11e10 = TM11E10;
        plm11e10 = TM11E10;
    else
        cmm11e10 = (DE10Aa-am11aa-TT)*TM11E10*WEA;
        pmm11e10 = 0;
        if am11aa+TT+WA<DE10Aa
            plm11e10 = TM11E10;
        else
            plm11e10 = 0;
        end
    end
    
    %K11E10	Alken	Genk
    if ak11ha + TT> DE10Ha
        missedK11E10 = missedK11E10 +1;
        cmk11e10 = (DE20Ha-ak11ha-TT)*TK11E10*WMT;
        pmk11e10 = TK11E10;
        plk11e10 = TK11E10;
    else
        cmk11e10 = (DE10Ha-ak11ha-TT)*TK11E10*WEA;
        pmk11e10 = 0;
        if ak11ha+TT+WA<DE10Ha
            plk11e10 = TK11E10;
        else
            plk11e10 = 0;
        end
    end
    
    %E10K11	Aarschot	Liège
    if ae10ha + TT> DK11Ha
        missedE10K11 = missedE10K11 +1;
        cme10k11 = (DK21Ha-ae10ha-TT)*TE10K11*WMT;
        pme10k11 = TE10K11;
        ple10k11 = TE10K11;
    else
        cme10k11 = (DK11Ha-ae10ha-TT)*TE10K11*WEA;
        pme10k11 = 0;
        if ae10ha+TT+WA<DK11Ha
            ple10k11 = TE10K11;
        else
            ple10k11 = 0;
        end
    end
    
    %M11C20	Aarschot	Landen
    if am11le + TT> DC20Le
        missedM11C20 = missedM11C20 +1;
        cmm11c20 = (DC30Le-am11le-TT)*TM11C20*WMT;
        pmm11c20 = TM11C20;
        plm11c20 = TM11C20;
    else
        cmm11c20 = (DC20Le-am11le-TT)*TM11C20*WEA;
        pmm11c20 = 0;
        if am11le+TT+WA<DC20Le
            plm11c20 = TM11C20;
        else
            plm11c20 = 0;
        end
    end
    
    %E11C20	Aarschot	Landen
    if ae11le + TT> DC20Le
        missedE11C20 = missedE11C20 + 1;
        cme11c20 = (DC30Le-ae11le-TT)*TE11C20*WMT;
        pme11c20 = TE11C20;
        ple11c20 = TE11C20;
    else
        cme11c20 = (DC20Le-ae11le-TT)*TE11C20*WEA;
        pme11c20 = 0;
        if ae11le+TT+WA<DC20Le
            ple11c20 = TE11C20;
        else
            ple11c20 = 0;
        end
    end
    
    %C11M10	Landen	Aarschot
    if ac11le + TT> DM10Le
        missedC11M10 = missedC11M10 +1;
        cmc11m10 = (DM30Le-ac11le-TT)*TC11M10*WMT;
        pmc11m10 = TC11M10;
        plc11m10 = TC11M10;
    else
        cmc11m10 = (DM10Le-ac11le-TT)*TC11M10*WEA;
        pmc11m10 = 0;
        if ac11le+TT+WA<DM10Le
            plc11m10 = TC11M10;
        else
            plc11m10 = 0;
        end
    end
    
    
    
    
    cost_of_transfers(i)= cmk10c21+cmc10k11+cme10k20+cmk11e21+...
        cme11m10+cmm11e10+cmk11e10+cme10k11+cmm11c20+cme11c20+cmc11m10;
    
    missed_transfers(i)=pmk10c21+pmc10k11+pme10k20+pmk11e21+...
        pme11m10+pmm11e10+pmk11e10+pme10k11+pmm11c20+pme11c20+pmc11m10;
    
    long_transfers(i)= plk10c21+plc10k11+ple10k20+plk11e21+...
        ple11m10+plm11e10+plk11e10+ple10k11+plm11c20+ple11c20+plc11m10;
    
end

missed_transfers;
long_transfers; 	%due to long OR MISSED transfer
passengers_arriving_late;
total_passengers_arriving_late= sum(passengers_arriving_late)/a;
total_missed_transfers= sum(missed_transfers)/a;
total_long_transfers= sum(long_transfers)/a;
percentage_missed=100*total_missed_transfers/Total_number_transfer_pass
percentage_long=100*total_long_transfers/Total_number_transfer_pass
stopping_cost
total_cost_arriving_late= sum(cost_arriving_late)/a
total_delay=sum(delay)/a
total_cost_through_passengers= sum(cost_through_passengers)/a
total_cost_of_transfers= sum(cost_of_transfers)/a

totale_kost= stopping_cost + total_cost_arriving_late + total_cost_of_transfers + total_cost_through_passengers

if plot
    close all
    figure
    barplot = (1/a)*[missedK10C21
        missedC10K11
        missedE10K20
        missedK11E21
        missedE11M10
        missedM11E10
        missedK11E10
        missedE10K11
        missedM11C20
        missedC11M10
        missedE11C20
        missedC11E20];
    
    names = {
        'K10C21'
        'C10K11'
        'E10K20'
        'K11E21'
        'E11M10'
        'M11E10'
        'K11E10'
        'E10K11'
        'M11C20'
        'C11M10'
        'E11C20'
        'C11E20'};
    
    bar(barplot);
    set(gca,'xticklabel',names);
    title('Percentage missed transfers');
    
    figure
    barplot2 = (1/a)*[missedK10C21*TK10C21
        missedC10K11*TC10K11
        missedE10K20*TE10K20
        missedK11E21*TK11E21
        missedE11M10*TE11M10
        missedM11E10*TM11E10
        missedK11E10*TK11E10
        missedE10K11*TE10K11
        missedM11C20*TM11C20
        missedC11M10*TC11M10
        missedE11C20*TE11C20
        missedC11E20*TC11E20];
    bar(barplot2);
    set(gca,'xticklabel',names);
    title('missed passengers');
    
    figure
    barplot3 = (1/a)*[TCC10LA
        TCC11LE
        TCE10HA
        TCE10AA
        TCE11LE
        TCE11AA
        TCK11HA
        TCK10LA
        TCM11LE
        TCM11AA
        TCM10AA];
    
    names2 = {'C10LA'
        'C11LE'
        'E10HA'
        'E10AA'
        'E11LE'
        'E11AA'
        'K11HA'
        'K10LA'
        'M11LE'
        'M11AA'
        'M10AA'};
     bar(barplot3);
    set(gca,'xticklabel',names2);
    title('Through Costs Per Train');
    
end
end

