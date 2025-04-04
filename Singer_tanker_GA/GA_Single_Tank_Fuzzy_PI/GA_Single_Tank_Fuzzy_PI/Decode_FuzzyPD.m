% Create new FIS with changing of parameters' membership function

FuzzyPD= setfis(FuzzyPD,'input',1,'mf',1,'Params',[-3 -2 -1 -P1]);
FuzzyPD= setfis(FuzzyPD,'input',1,'mf',2,'Params',[-1 -P1  0]);
FuzzyPD= setfis(FuzzyPD,'input',1,'mf',3,'Params',[-P1 0 P1]);
FuzzyPD= setfis(FuzzyPD,'input',1,'mf',4,'Params',[0  P2  1 ]);
FuzzyPD= setfis(FuzzyPD,'input',1,'mf',5,'Params',[P2 1 2 3]);

FuzzyPD= setfis(FuzzyPD,'input',2,'mf',1,'Params',[-3 -2 -1 -P2]);
FuzzyPD= setfis(FuzzyPD,'input',2,'mf',2,'Params',[-1  -P2  0]);
FuzzyPD= setfis(FuzzyPD,'input',2,'mf',3,'Params',[-P2 0 P2]);
FuzzyPD= setfis(FuzzyPD,'input',2,'mf',4,'Params',[0  P2  1 ]);
FuzzyPD= setfis(FuzzyPD,'input',2,'mf',5,'Params',[P2 1 2 3]);
       
FuzzyPD= setfis(FuzzyPD,'output',1,'mf',1,'Params',-1);
FuzzyPD= setfis(FuzzyPD,'output',1,'mf',2,'Params',-P3);
FuzzyPD= setfis(FuzzyPD,'output',1,'mf',3,'Params',-P4);
FuzzyPD= setfis(FuzzyPD,'output',1,'mf',4,'Params',0);
FuzzyPD= setfis(FuzzyPD,'output',1,'mf',5,'Params',P4);
FuzzyPD= setfis(FuzzyPD,'output',1,'mf',6,'Params',P3);
FuzzyPD= setfis(FuzzyPD,'output',1,'mf',7,'Params',1);
