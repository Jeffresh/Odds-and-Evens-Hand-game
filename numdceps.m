function pr = numdceps(m1,p)

ps = zeros(size(m1,1),p) ;

m11 = [ ps m1 ps ] ;

vnt = -p:p;

vnt = repmat(vnt,size(m1,1),1);
finv = size(vnt,2);




for i = 1:size(m1,2)
    
    pr(:,i)= sum(m11(:,i:finv+(i-1)).*vnt,2);
end

end




