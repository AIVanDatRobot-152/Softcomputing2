C1=par(pop_index,1);
C2=par(pop_index,2);
C3=par(pop_index,3);
C4=par(pop_index,4);
C5=par(pop_index,5);
C6=par(pop_index,6);

if(C1 > 0.99)
    par(pop_index,1)= 0.99*rand;
end

if(C2 > 0.99)
    par(pop_index,2)= 0.99*rand;
end

if(C3 > 0.99)
    par(pop_index,3)= 0.99*rand;
end

if(C4 > 0.99)
    par(pop_index,4)= 0.99*rand;
end

if(C5 > 0.99)
    par(pop_index,5)= 0.99*rand;
end

if(C6 > 0.99)
    par(pop_index,6)= 0.99*rand;
end


if(C2 < C1)
    par(pop_index,1)=C2;
    par(pop_index,2)=C1;
end

if(C4 < C3)
    par(pop_index,3)=C4;
    par(pop_index,4)=C3;
end

if(C6 < C5)
    par(pop_index,5)=C6;
    par(pop_index,6)=C5;
end
