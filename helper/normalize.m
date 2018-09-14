function [train, test] = normalize(d, t)
%% Normalize data by row vectors so that max is 1, and min is 0
   d = double(d);
   t = double(t);
   train = (d -repmat(min(d,[],1),size(d,1),1)).*...
       1./max(1e-9, repmat(max(d,[],1)-min(d,[],1), size(d,1),1));
   test=[];
   if exist('t', 'var')
        test = (t -repmat(min(d,[],1),size(t,1),1)).*...
         1./max(1e-9, repmat(max(d,[],1)-min(d,[],1), size(t,1),1));
   end    
end