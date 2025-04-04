clc;
clear all
warning off
rand('state',sum(100*clock));
Ts=1;
max_generation=100;
max_stall_generation=50;
epsilon=10e-6;

pop_size= 20 ;
npar = 6;%% C1 C2 C3 C4 C5 C6 C7 C8
range=[ 0 0 0 0 0 0  ;...
        1 1 1 1 1 1 ];

dec=[0 0 0 0 0 0 ];   % vi tri dau cham thap phan  0.00->0.99
sig=[3 3 3 3 3 3 ];   % so chu so co nghia

cross_prob = 0.9; %xac xuat lai ghep
mutate_prob = 0.1; % xac suat dot bien
elitism = 1;       % bao toan ca the tot nhat trong quan the

par=Init(pop_size,npar,range);

% rho=1/50;
rho = 0.02;
disp('GA is running...');

Terminal=0;
generation = 0;
stall_generation=0;
C1_a=0;
C2_a=0;
C3_a=0;
C4_a=0;
C5_a=0;
C6_a=0;
FuzzyPI=readfis('PI.fis');

pop=Init(pop_size,npar,range);

for pop_index=1:pop_size,
    FuzzyParamsFixed;
    Decode_FuzzyPI;
    writefis(FuzzyPI,'PI.fis');
    
    out = sim('singletank_2016a.slx');
    J=out.e'*out.e + rho*out.u'*out.u;
%     fitness(pop_index)=1/(J+eps);
        fitness(pop_index)=J+eps;
end;
[bestfit0,bestchrom]=min(fitness);
%%
P10=par(bestchrom,1);
P20=par(bestchrom,2);
P30=par(bestchrom,3);
P40=par(bestchrom,4);
K20=par(bestchrom,5);
K30=par(bestchrom,6);
%%
while ~Terminal,
    generation = generation+1;
    disp(['generation #' num2str(generation) ' of maximum ' num2str(max_generation)]);
    pop=Encode_Decimal_Unsigned(par,sig,dec);
    parent = Select_Linear_Ranking(pop,fitness,0.5,elitism,bestchrom);
    child = Cross_Twopoint(parent,cross_prob,elitism,bestchrom);
    pop=Mutate_Uniform(child,mutate_prob,elitism,bestchrom);
    par=Decode_Decimal_Unsigned(pop,sig,dec);
    
    for pop_index=1:pop_size,
        FuzzyParamsFixed;
        Decode_FuzzyPI;
        writefis(FuzzyPI,'PI.fis');
        
        sim('singletank_2016a.slx');
        J=e'*e+rho*u'*u;
%         fitness(pop_index)=1/(J+0.01);
        fitness(pop_index)=J+eps;
    end;
    [bestfit(generation),bestchrom]=min(fitness);
    
    C1_a=[C1_a par(bestchrom,1)];
    C2_a=[C2_a par(bestchrom,2)];
    C3_a=[C3_a par(bestchrom,3)];
    C4_a=[C4_a par(bestchrom,4)];
    C5_a=[C5_a par(bestchrom,5)];
    C6_a=[C6_a par(bestchrom,6)];

    C1 = par(bestchrom,1);
    C2 = par(bestchrom,2);
    C3 = par(bestchrom,3);
    C4 = par(bestchrom,4);
    C5 = par(bestchrom,5);
    C6 = par(bestchrom,6);

FuzzyPI= setfis(FuzzyPI,'input',1,'mf',1,'Params',[-2 -1.5 -C2 -C1]);
FuzzyPI= setfis(FuzzyPI,'input',1,'mf',2,'Params',[-C2 -C1  0]);
FuzzyPI= setfis(FuzzyPI,'input',1,'mf',3,'Params',[-C1 0 C1]);
FuzzyPI= setfis(FuzzyPI,'input',1,'mf',4,'Params',[0  C1  C2 ]);
FuzzyPI= setfis(FuzzyPI,'input',1,'mf',5,'Params',[C1 C2 1.5 2]);

FuzzyPI= setfis(FuzzyPI,'input',2,'mf',1,'Params',[-2 -1.5 -C4 -C3]);
FuzzyPI= setfis(FuzzyPI,'input',2,'mf',2,'Params',[-C4 -C3  0]);
FuzzyPI= setfis(FuzzyPI,'input',2,'mf',3,'Params',[-C3 0 C3]);
FuzzyPI= setfis(FuzzyPI,'input',2,'mf',4,'Params',[0  C3  C4 ]);
FuzzyPI= setfis(FuzzyPI,'input',2,'mf',5,'Params',[C3 C4 1.5 2]);
       
FuzzyPI= setfis(FuzzyPI,'output',1,'mf',1,'Params',[-1]);
FuzzyPI= setfis(FuzzyPI,'output',1,'mf',2,'Params',[-C6]);
FuzzyPI= setfis(FuzzyPI,'output',1,'mf',3,'Params',[-C5]);
FuzzyPI= setfis(FuzzyPI,'output',1,'mf',4,'Params',0);
FuzzyPI= setfis(FuzzyPI,'output',1,'mf',5,'Params',[C5]);
FuzzyPI= setfis(FuzzyPI,'output',1,'mf',6,'Params',[C6]);
FuzzyPI= setfis(FuzzyPI,'output',1,'mf',7,'Params',[1]);

    writefis(FuzzyPI,'PI.fis');
    
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
%%
plot(1./bestfit)
pop_index=bestchrom;


%%
    C1 = par(bestchrom,1);
    C2 = par(bestchrom,2);
    C3 = par(bestchrom,3);
    C4 = par(bestchrom,4);
    C5 = par(bestchrom,5);
    C6 = par(bestchrom,6);
C = [C1 C2 C3 C4 C5 C6]
%%
figure
hold on
plot(C1_a);
plot(C2_a);
plot(C3_a);
plot(C4_a);
plot(C5_a);
plot(C6_a);
J=1/bestfit(end)
sim('singletank_2016a.slx');




