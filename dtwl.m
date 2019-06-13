function  rdtw = dtwl(pr,t)

n = size(pr,2);
m = size(t,2);
dtw = zeros(n+1,m+1);
dtw(:,1) = inf;
dtw(1,:) = inf;
dtw(1,1) = 0;



for j=2:m+1
    for i=2:n+1
        
        %dist = distancia(pr(i-1),t(i-1));
         dist = norm(pr(:,i-1)-t(:,j-1));
        
        rl = [ dtw(i-1,j) dtw(i,j-1) dtw(i-1,j-1)];
        dtw(i,j) = dist + min (rl);
        
    end
    
    
end

rdtw = dtw(n+1,m+1);
end