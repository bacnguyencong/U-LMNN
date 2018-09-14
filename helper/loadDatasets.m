function [xTr yTr xTe yTe xVa yVa, U] = loadDatasets(ntr, nva)    
    load('mnist_all.mat');
    
    U = [test3; test6];
    X = [train5; train8];
    T = [test5; test8];
    
    [~, U] = normalize(X, U);
    [X, T] = normalize(X, T);
    X = X'; T = T'; U = U';
    
%     L = rand(size(X,1), 5);
%     X = L'*X; T = L'*T; U = L'*U;
    
    
    label = [repmat(5, size(train5, 1), 1); repmat(8, size(train8, 1), 1)];    
    index = randperm(size(X,2));
    
    
    xTr = X(:,  index(1:ntr));
    yTr = label(index(1:ntr));
    
    xVa = X(:,  index(ntr+1:ntr+nva));
    yVa = label(index(ntr+1:ntr+nva));
    
    xTe = T;
    yTe = [repmat(5, size(test5, 1), 1); repmat(8, size(test8, 1), 1)];
end
