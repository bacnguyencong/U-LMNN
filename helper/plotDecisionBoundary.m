function hcont =  plotDecisionBoundary(u, x, t, L, color, rep, x1, x2, y1, y2)
    
    N = size(x,1);
    ma = {'ks','ko'};
    fc = {'b','g'};
    tv = unique(t);
    
    
    
    %[Xv Yv] = meshgrid(min(x(:,1)):0.1:max(x(:,1)),min(x(:,2)):0.1:max(x(:,2)));
    [Xv Yv] = meshgrid(x1:0.1:x2,y1:0.1:y2);
    classes = zeros(size(Xv));
    K = 1;
    for i = 1:length(Xv(:))
        this = [Xv(i) Yv(i)];
        dists = sum((x*L' - repmat(this,N,1)*L').^2,2);
        [d I] = sort(dists,'ascend');
        [a,b] = hist(t(I(1:K)));
        pos = find(a==max(a));
        if length(pos)>1
            order = randperm(length(pos));
            pos = pos(order(1));
        end
        classes(i) = b(pos);
    end
    %figure(1); hold off
    if (rep)
        for i = 1:length(tv)
            pos = find(t==tv(i));
            plot(x(pos,1),x(pos,2),ma{i});%,'markerfacecolor',fc{i});        
            hold on
        end    
        plot(u(:,1),u(:,2), 'r*');
    end
        
    [~, hc2] = contour(Xv,Yv,classes,[0.5 0.5], color, 'LineWidth', 1.2),
    hcont = get(hc2,'children') % get vector of single contours handl.   

    
    %ti = sprintf('K = %g',K);
    %title(ti);
end

