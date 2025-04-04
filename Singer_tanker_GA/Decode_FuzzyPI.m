% Create new FIS with changing of parameters' membership function

C1=pop(pop_index,1);
C2=pop(pop_index,2);
C3=pop(pop_index,3);
C4=pop(pop_index,4);
C5=pop(pop_index,5);
C6=pop(pop_index,6);



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
