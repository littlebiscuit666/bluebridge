p=[0.4 0.3 0.2 0.1];
cishu=[0 0 0 0];
psum=cumsum(p);
for i=1:100
    mm=rand();
    target_possible=find(psum>=mm);
    location=target_possible(1)
    cishu=cishu(location);
end




















