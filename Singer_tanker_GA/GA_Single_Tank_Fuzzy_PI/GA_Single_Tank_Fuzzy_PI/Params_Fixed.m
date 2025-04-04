
P1=pop(pop_index,1);
P2=pop(pop_index,2);
P3=pop(pop_index,3);
P4=pop(pop_index,4);
K2=pop(pop_index,5);
K3=pop(pop_index,6);

if(P1 > 0.99)
    P1=0.99*rand;
    par(pop_index,1)= P1;
end

if(P1 < 0.01)
    P1=0.01;
    par(pop_index,1)= P1;
end

if(P2 > 0.99)
    P2=0.99*rand;
    par(pop_index,2)= P2;
end

if(P2 < 0.01)
    P2=0.01;
    par(pop_index,2)= P2;
end

if(P3 > 0.99)
    P3=0.99*rand;
    par(pop_index,3)= P3;
end

if(P3 < 0.01)
    P3=0.01;
    par(pop_index,3)= P3;
end

if(P4 > 0.99)
    P4=0.99*rand;
    par(pop_index,4)= P4;
end

if(P4 <0.01)
    P4=0.01;
    par(pop_index,4)= P4;
end

if(P3 < P4)
    par(pop_index,3)=P4;
    par(pop_index,4)=P3;
end

if(K3 > 1.5)
    K3 = 1.5;
end

if(K2 > 2)
    K2 = 2;
end




