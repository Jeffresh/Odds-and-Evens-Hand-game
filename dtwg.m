function  rdtw = dtwg(pr,t,w)

n = size(pr,2);
m = size(t,2);
dtw = zeros(n+1,m+1);
dtw(:,1) = inf;
dtw(1,:) = inf;
dtw(1,1) = 0;

w = max(w, abs(n-m));



for i=2:n+1
    for j=max(2,i-w):min(m+1,i+w)
        
        dist = distancia(pr(i-1),t(i-1));
        
        rl = [ dtw(i-1,j) dtw(i,j-1) dtw(i-1,j-1)];
        dtw(i,j) = dist + min (rl);
        
    end
    
    
end

rdtw = dtw(n+1,m+1);
end