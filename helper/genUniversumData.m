function U = genUniversumData(xTr, yTr, num)    
    dim    = size(xTr, 1);
    labels = unique(yTr);    
    U      = zeros(dim, num);
    
    for i = 1:length(labels)
       group = xTr(:,labels(i) == yTr);
       U = U + group(:, randi(size(group,2),1,num));
    end
    
    U = U ./length(labels);
end