%filename: sa.m
%% Solve for QAo and Psa
clearvars -except Psa1 % clear all variables
clf       % and figures
global T TS TMAX QMAX;
global Rs Csa dt;
in_sa %initialization
for klok=1:klokmax
  t=klok*dt;
  QAo=QAo_now(t);
  Psa=Psa_new(Psa,QAo); %new Psa overwrites old
  %Store values in arrays for future plotting:
  t_plot(klok)=t;
  QAo_plot(klok)=QAo;
  Psa_plot(klok)=Psa;
end
%Psa1(:,k) = Psa_plot;
%% Plot results in one figure, all data with labels

%with QAo(t) in upper frame
% and Psa(t) in lower frame
subplot(2,1,1), plot(t_plot,QAo_plot)
subplot(2,1,2), plot(t_plot,Psa_plot)
set( get(P1,'XLabel'), 'String', 'time' );
set( get(P2,'XLabel'), 'String', 'time' );
set( get(P1,'YLabel'), 'String', 'Q_{Ao}' );
set( get(P2,'YLabel'), 'String', 'P_{sa}' );
%% Last Period Plots
P1 = subplot(2,1,1), plot(t_plot(end-T/dt:end,k),QAo_plot(end-T/dt:end),k) %last period plots
P2 = subplot(2,1,2), plot(t_plot(end-T/dt:end,k),Psa_plot(end-T/dt:end),k) %last period plots
set( get(P1,'XLabel'), 'String', 'last period time' ); %last period plots
set( get(P2,'XLabel'), 'String', 'last period time' ); %last period plots
set( get(P1,'YLabel'), 'String', 'Q_{Ao}' ); %last period plots
set( get(P2,'YLabel'), 'String', 'P_{sa}' ); %last period plots
%% Figure of just QAo and its integral
P2 = plot(t_plot(end-T/dt:end),QAo_plot(end-T/dt:end),'LineWidth', 2) %last period plot for just 1 fig
xlabel('last period time') %label for 1 fig
ylabel('Q_{Ao}') %label for 1 fig
trapz(t_plot(end-T/dt:end), QAo_plot(end-T/dt:end))
%% Find mins and maxs of Psa1
for k=1:(n+1)
    minimax(1,k)=min(Psa1(end-T/dt:end,k));
    minimax(2,k)=max(Psa1(end-T/dt:end,k));
end
%% 
plot(linspace(0.0050,0.0200, n+1), minimax, 'LineWidth', 3)
xlabel('TS') %label for 1 fig
ylabel('P_{sa}') %label for 1 fig
legend('Minimum of Periodic P_{sa}(t)','Maximum of Periodic P_{sa}(t)'...
    ,'Location','northwest')