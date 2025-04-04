% Programmed by   : Huynh Thai Hoang, University of Technology at Ho Chi Minh City. 
% Last updated    : March 9, 2006

clc;
clear all
rand('state',sum(100*clock));
Ts=0.05;
max_generation=100;
max_stall_generation=10;
epsilon=0.00001;

pop_size=20;
npar = 6;%% P1 P2 P3 P4 K2 K3
range=[ 0 0 0 0 0.1 0.1 ;... 
        1 1 1 1 2 2];
  
cross_prob = 0.9; %xac xuat lai ghep
mutate_prob = 0.1; % xac suat dot bien
elitism = 1;       % bao toan ca the tot nhat trong quan the

rho=0.05;
disp('GA is running...');

Terminal=0;
generation = 0;
stall_generation=0;
P1_a=0;
P2_a=0;
P3_a=0;
P4_a=0;
K2_a=0;
K3_a=0;
FuzzyPD=readfis('PD.fis');

pop=Init(pop_size,npar,range);

for pop_index=1:pop_size,
    Params_Fixed;
    Decode_FuzzyPD;
%     FuzzyParamsFixed;
    sim('Crane');
     J=e'*e+rho*theta'*theta;
    fitness(pop_index)=1/(J+eps);
end;


[bestfit0,bestchrom]=max(fitness);

J0 = 1./bestfit0
%%
P10=pop(bestchrom,1);
P20=pop(bestchrom,2);
P30=pop(bestchrom,3);
P40=pop(bestchrom,4);
K20=pop(bestchrom,5);
K30=pop(bestchrom,6);
%%

while ~Terminal,
    generation = generation+1;
    disp(['generation #' num2str(generation) ' of maximum ' num2str(max_generation)]);

    parent = Select_Linear_Ranking(pop,fitness,0.5,elitism,bestchrom); 
    child = Cross_BLX(parent,cross_prob,0.5,elitism,bestchrom);
    pop = Mutate_Random(child,mutate_prob,range,elitism,bestchrom);
     
    for pop_index=1:pop_size,
        Params_Fixed;
        Decode_FuzzyPD;
%         FuzzyParamsFixed;
        sim('Crane');
     J=e'*e+rho*theta'*theta;
        fitness(pop_index)=1/(J+eps);
    end;
    [bestfit(generation),bestchrom]=max(fitness);
    
    
    P1_a=[P1_a pop(bestchrom,1)];
    P2_a=[P2_a pop(bestchrom,2)];
    P3_a=[P3_a pop(bestchrom,3)];
    P4_a=[P4_a pop(bestchrom,4)];
    K2_a=[K2_a pop(bestchrom,5)];
    K2_a=[K3_a pop(bestchrom,6)];
    
    writefis(FuzzyPD,'PD.fis');
    bestfit(generation)
    if generation == max_generation
        Terminal = 1;
    elseif generation>1,
        if abs(bestfit(generation)-bestfit(generation-1))<epsilon,
            stall_generation=stall_generation+1;
            if stall_generation == max_stall_generation, Terminal = 1;end
        else
            stall_generation=0;
        end;
    end;
    
end; %While

plot(1./bestfit)
pop_index=bestchrom;

Decode_FuzzyPD;

P=[P1 P2 P3 P4]
K=[K2 K3]
        
J=1/bestfit(end)
sim('Crane');

            
    

