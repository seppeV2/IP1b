function [] = basisNew()

TT=3; %"necessary" transfer time is 3 minutes

%VOT: value of time, weight for different types of waiting
WEA= 2;     %early arrival, normal waiting
WMT= 2.2;   %waiting due to a missed train
WLA= 2.5;   %arriving late at final destination
WST= 1.5; 	%Waiting in a stopped train due to early arrival

%number of arriving passengers in end stations 
%NEW END STATIONS LEUVEN,HASSELT, AARSCHOT AND LANDEN

%through passengers per train

%transfer passengers
%NEW TRANSFERRING STATIONS LEUVEN,HASSELT, AARSCHOT AND LANDEN

%through passengers in other stations

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



end

