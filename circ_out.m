%filename: circ_out.m
%script to plot results of computer simulation 
%of the entire circulation.
%left ventricular compliance, pressures, and flows:
%% Fig 1
clearvars P1 P2 P3 
figure(1)
P1 = subplot(3,1,1),plot(t_plot(end-T/dt:end),C_plot(iLV,end-T/dt:end), 'LineWidth', 2)
legend('Left Ventricular Compliance, (iLV)','Location','northeast')
P2 = subplot(3,1,2),plot(t_plot(end-T/dt:end),P_plot([ipv,iLV,isa],end-T/dt:end)...
    , 'LineWidth', 2)
legend('Ventricular Pressure, (ipv)','Ventricular Pressure, (iLV)'...
    ,'Ventricular Pressure, (isa)','Location','northeast')
P3 = subplot(3,1,3),plot(t_plot(end-T/dt:end),Q_plot([jMi,jAo],end-T/dt:end)...
    , 'LineWidth', 2)
legend('Ventricular Flows (jMi)', 'Ventricular Flows (jAo)'...
    ,'Location','northeast')
set( get(P1,'XLabel'), 'String', 'time' );
set( get(P2,'XLabel'), 'String', 'time' );
set( get(P3,'XLabel'), 'String', 'time' );
set( get(P1,'YLabel'), 'String', 'Compliance' );
set( get(P2,'YLabel'), 'String', 'Pressure' );
set( get(P3,'YLabel'), 'String', 'Flow' );
%right ventricular compliance, pressures, and flows:
%% Fig 2
clearvars P1 P2 P3 
figure(2)
P1= subplot(3,1,1),plot(t_plot(end-T/dt:end),C_plot(iRV,end-T/dt:end),...
    'LineWidth', 2)
legend('Right Ventricular Compliance, (iRV)','Location','northeast')
P2 = subplot(3,1,2),plot(t_plot(end-T/dt:end),P_plot([isv,iRV,ipa],end-T/dt:end),...
    'LineWidth', 2)
legend('Ventricular Pressure, (isv)','Ventricular Pressure, (iRV)'...
    ,'Ventricular Pressure, (ipa)','Location','northeast')
P3 = subplot(3,1,3),plot(t_plot(end-T/dt:end),Q_plot([jTr,jPu],end-T/dt:end)...
    , 'LineWidth', 2)
legend('Ventricular Flows (jTr)', 'Ventricular Flows (jPu)'...
    ,'Location','northeast')
set( get(P1,'XLabel'), 'String', 'time' );
set( get(P2,'XLabel'), 'String', 'time' );
set( get(P3,'XLabel'), 'String', 'time' );
set( get(P1,'YLabel'), 'String', 'Compliance' );
set( get(P2,'YLabel'), 'String', 'Pressure' );
set( get(P3,'YLabel'), 'String', 'Flow' );
%systemic and pulmonary flows:
%% Fig 3
clearvars P1 P2 P3 
figure(3)
P1 = plot(t_plot(end-T/dt:end),Q_plot([js,jp],end-T/dt:end), 'LineWidth', 2)
legend('Systelm Flows, (js)', 'Pulmonary Flows','Location','northeast')
xlabel('time')
ylabel('Flow')
%% Fig 4
clearvars P1 P2 P3 
figure(4)%pressure-volume loops for both ventricles
P1 = subplot(2,1,1),plot(V_plot(iLV,end-T/dt:end),P_plot(iLV,end-T/dt:end), 'LineWidth', 2)
P2 = subplot(2,1,2),plot(V_plot(iRV,end-T/dt:end),P_plot(iRV,end-T/dt:end), 'LineWidth', 2)
set( get(P1,'XLabel'), 'String', 'Left Ventricle Pressure' );
set( get(P2,'XLabel'), 'String', 'Right Ventricle Pressure' );
set( get(P1,'YLabel'), 'String', 'Left Ventricle Volume' );
set( get(P2,'YLabel'), 'String', 'Right Ventricle Volume' );