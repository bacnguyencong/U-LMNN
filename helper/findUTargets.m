function [ Imp, Dimp] = findUTargets(xU, xTr, yTr)

   nInst = size(xTr, 2);
   labels= unique(yTr);    
   index = 1:nInst;   
   
   Imp   = zeros(2, size(xU,2));
   Dimp  = ones(2, size(xU,2))*Inf;
   
   for i=1:length(labels)
       ind{i}   = index(yTr == labels(i));
       group{i} = xTr(:, ind{i});
   end
      
   for i=1:length(labels)        
        [iknn, idist]  = kNearestNeighbors(xU, group{i}, 1);
        iknn = ind{i}(iknn);
        
        tmp  = Dimp(1,:) > idist;        
        
        Imp(2,tmp)  = Imp(1, tmp);
        Dimp(2,tmp) = Dimp(1, tmp);
        
        Imp(1,tmp)  = iknn(tmp);
        Dimp(1,tmp) = idist(tmp);        
        
        tmp2  = Dimp(2,:) > idist;
        
        Imp(2,tmp2 & (~tmp))  = iknn(tmp2 & (~tmp));
        Dimp(2,tmp2 & (~tmp)) = idist(tmp2 & (~tmp));        
    end
end

