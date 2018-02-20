%filename: sa.m
%clearvars -except Psa1 % clear all variables
clear all
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
%Now plot results in one figure 
%with QAo(t) in upper frame
% and Psa(t) in lower frame
Psa1(:,k) = Psa_plot; % saves kth iteration of PSa
P1 = subplot(2,1,1), plot(t_plot(end-T/dt:end,k),QAo_plot(end-T/dt:end),k) %last period plots
P2 = subplot(2,1,2), plot(t_plot(end-T/dt:end,k),Psa_plot(end-T/dt:end),k) %last period plots
%P2 = plot(t_plot(end-T/dt:end),Psa_plot(end-T/dt:end)) %last period plot for just 1 fig
%P1 = subplot(2,1,1), plot(t_plot,QAo_plot)
%P2 = subplot(2,1,2), plot(t_plot,Psa_plot)
%set( get(P1,'XLabel'), 'String', 'time' );
%set( get(P2,'XLabel'), 'String', 'time' );
%set( get(P1,'YLabel'), 'String', 'Q_{Ao}' );
%set( get(P2,'YLabel'), 'String', 'P_{sa}' );
%xlabel('last period time') %label for 1 fig
%ylabel('P_{sa}') %label for 1 fig
set( get(P1,'XLabel'), 'String', 'last period time' ); %last period plots
set( get(P2,'XLabel'), 'String', 'last period time' ); %last period plots
set( get(P1,'YLabel'), 'String', 'Q_{Ao}' ); %last period plots
set( get(P2,'YLabel'), 'String', 'P_{sa}' ); %last period plots
