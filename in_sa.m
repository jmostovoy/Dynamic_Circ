%filename: in_sa.m  (initialization for the script sa)
T =0.0125;    %Duration of heartbeat (minutes)
%TS=linspace(0.0050,0.0200, n) %Duration of systole   (minutes)
n=20;
k=1;
TS=0.0050+((k-1)*(0.0200-0.0050)/n); %Duration of systole   (minutes) 
%TS = 0.0050; %OG
TMAX=0.0020;  %Time at which flow is max (minutes)
QMAX=28.0;   %Max flow through aortic valve (liters/minute)
Rs=17.86;     %Systemic resistance (mmHg/(liter/minute))
%Csa=0.00109632;  %Systemic arterial compliance (liters/(mmHg))
Csa=0.00175  %Systemic arterial compliance (liters/(mmHg)) O.G.
%This value of Csa is approximate and will need adjustment 
%to make the blood pressure be 120/80.
dt=0.01*T;    %Time step duration (minutes)
%This choice implies 100 timesteps per cardiac cycle.
klokmax=150*T/dt; %Total number of timesteps 
%This choice implies simulation of 15 cardiac cycles.
Psa=0;           %Initial value of Psa (mmHg)
%Any initial value is OK here; try some others.
%Initialize arrays to store data for plotting:
  t_plot=zeros(1,klokmax);
QAo_plot=zeros(1,klokmax);
Psa_plot=zeros(1,klokmax);
