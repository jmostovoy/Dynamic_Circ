function W = calcWork(P,V)
% P is a list of pressure values, V is a list of volume values
% both are uniformly spaced in time with spacing dt and represent a periodic
% cycle
% return W, the work of the P-V cycle
    [argvalueV, argmaxV] = max(V);
    islessthan = 1:100;
    for j = 1:(length(V)-1)
        islessthan(j)= V(j)<= V(j+1); %test if V is increasing
    end
% engine to find how long the function is increasing. We use the fact that
% there will be two large increasing and decreasing regions
  i = find(diff(islessthan)) 
  n = [i numel(islessthan)] - [0 i]
  c = arrayfun(@(X) X-1:-1:0, n , 'un',0)
  y = cat(2,c{:})
  % find the longest increasing/decreasing region
  [argvalueV1, argmaxV1] = max(y);
  range1 = argmaxV1:argvalueV1+argmaxV1;
  y(range1)=0; %removes the longest increasing/decreasing region
  [argvalueV2, argmaxV2] = max(y) %finds the second longest increasing region
  range2 = argmaxV2:argvalueV2+argmaxV2;
  %final ouput, which reduces to 8 = 2^2*2 possibilities
  % dependent on if the ranges for V are increasing or decreasing
  % and which region is "U" or "L" in our model
  % note only works if P("middle") has two distinct values 
  if P(range1(ceil(end/2)))>P(range2(ceil(end/2)))...
          && V(range1(ceil(end/2)))<=V(range1(ceil(end/2))+1)...
          && V(range2(ceil(end/2)))<=V(range2(ceil(end/2))+1)
      W = trapz(V(range1),P(range1))-trapz(V(range2),P(range2))
  elseif P(range1(ceil(end/2)))>P(range2(ceil(end/2)))...
          && V(range1(ceil(end/2)))>=V(range1(ceil(end/2))+1)...
          && V(range2(ceil(end/2)))<=V(range2(ceil(end/2))+1)
      W = -trapz(V(range1),P(range1))-trapz(V(range2),P(range2))
  elseif P(range1(ceil(end/2)))>P(range2(ceil(end/2)))...
          && V(range1(ceil(end/2)))<=V(range1(ceil(end/2))+1)...
          && V(range2(ceil(end/2)))>=V(range2(ceil(end/2))+1)
      W = trapz(V(range1),P(range1))+trapz(V(range2),P(range2))
  elseif P(range1(ceil(end/2)))>P(range2(ceil(end/2)))...
          && V(range1(ceil(end/2)))>=V(range1(ceil(end/2))+1)...
          && V(range2(ceil(end/2)))>=V(range2(ceil(end/2))+1)
      W = -trapz(V(range1),P(range1))+trapz(V(range2),P(range2))
  elseif P(range1(ceil(end/2)))<P(range2(ceil(end/2)))...
          && V(range1(ceil(end/2)))<=V(range1(ceil(end/2))+1)...
          && V(range2(ceil(end/2)))<=V(range2(ceil(end/2))+1)
      W = trapz(V(range2),P(range2))-trapz(V(range1),P(range1))
  elseif P(range1(ceil(end/2)))<P(range2(ceil(end/2)))...
          && V(range1(ceil(end/2)))>=V(range1(ceil(end/2))+1)...
          && V(range2(ceil(end/2)))<=V(range2(ceil(end/2))+1)
      W = trapz(V(range2),P(range2))+trapz(V(range1),P(range1))
  elseif P(range1(ceil(end/2)))<P(range2(ceil(end/2)))...
          && V(range1(ceil(end/2)))<=V(range1(ceil(end/2))+1)...
          && V(range2(ceil(end/2)))>=V(range2(ceil(end/2))+1)
      W = -trapz(V(range2),P(range2))-trapz(V(range1),P(range1))
 elseif P(range1(ceil(end/2)))<P(range2(ceil(end/2)))...
          && V(range1(ceil(end/2)))>=V(range1(ceil(end/2))+1)...
          && V(range2(ceil(end/2)))>=V(range2(ceil(end/2))+1)
      W = -trapz(V(range2),P(range2))+trapz(V(range1),P(range1))
  end
end
