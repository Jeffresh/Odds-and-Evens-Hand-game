function d = denodceps(m1,p)

ps = zeros(1,p);

m11 = ones(1,size(m1,2));

vnt = -p:p;

deno = [ ps , m11 ,ps];

finvt = size(vnt,2);


for i = 1:size(m1,2)
    
    pr(i,:) = (deno(:,i:finvt+(i-1)).*vnt).^2;
end

d = sum(pr,2);

end
