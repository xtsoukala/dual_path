
#roles: A X Y Z B C
#semantics: :DET THE A :NOUN MAN WOMAN CAT DOG BOY GIRL FATHER MOTHER SISTER BROTHER NURSE TEACHER BALL STICK TOY KITE :VERB SLEEP JUMP WALK RUN PUSH HIT KICK CARRY GIVE THROW SHOW PRESENT GLORP :AUX IS ARE WAS WERE :BY BY :THAT THAT :TO TO :PER . :PAR -PAR :ING -ING :SS -S :ED -ED :BEING BEING
#lexicon: :det the a :noun man woman cat dog boy girl father mother sister brother nurse teacher ball stick toy kite :verb sleep jump walk run push hit kick carry give throw show present glorp :aux is are was were :by by :that that :to to :per . :par -par :ing -ing :ss -s :ed -ed :being being
#eventsemantics: PRES PAST SIMP PROG XX YY ZZ CC DD
name:{ a girl was present -ing a mother a stick . . }
#mess:   A=PRESENT X=GIRL,A Y=STICK,A Z=MOTHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 8 2 ;link 2 16 2 ;link 3 10 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father carry -ed a kite . . }
#mess:   A=CARRY X=FATHER,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother was push -ing the stick . . }
#mess:   A=PUSH X=BROTHER,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy throw -s a man a ball . . }
#mess:   A=THROW X=BOY,A Y=BALL,A Z=MAN,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 15 2 ;link 3 3 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse give -s a kite to a teacher . . }
#mess:   A=GIVE X=NURSE,A Y=KITE,A Z=TEACHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 18 2 ;link 3 14 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother give -s a nurse a stick . . }
#mess:   A=GIVE X=BROTHER,THE Y=STICK,A Z=NURSE,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 1 ;link 2 16 2 ;link 3 13 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother hit -s the kite . . }
#mess:   A=HIT X=BROTHER,THE Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse is run -ing . . }
#mess:   A=RUN Y=NURSE,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 13 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher is push -ing the kite . . }
#mess:   A=PUSH X=TEACHER,A Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy show -s a father the kite . . }
#mess:   A=SHOW X=BOY,A Y=KITE,THE Z=FATHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 2 ;link 2 18 1 ;link 3 9 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat throw -s the boy the ball . . }
#mess:   A=THROW X=CAT,THE Y=BALL,THE Z=BOY,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 5 1 ;link 2 15 1 ;link 3 7 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy was throw -ing the dog the ball . . }
#mess:   A=THROW X=BOY,THE Y=BALL,THE Z=DOG,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 1 ;link 2 15 1 ;link 3 6 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is kick -ing the ball . . }
#mess:   A=KICK X=MAN,THE Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 3 1 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy sleep -s . . }
#mess:   A=SLEEP Y=BOY,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 7 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman was give -ing the mother the kite . . }
#mess:   A=GIVE X=WOMAN,A Y=KITE,THE Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 18 1 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl show -ed the stick to a girl . . }
#mess:   A=SHOW X=GIRL,A Y=STICK,THE Z=GIRL,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 16 1 ;link 3 8 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman was present -ing the kite to the girl . . }
#mess:   A=PRESENT X=WOMAN,THE Y=KITE,THE Z=GIRL,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 4 1 ;link 2 18 1 ;link 3 8 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man was throw -ing a kite to the nurse . . }
#mess:   A=THROW X=MAN,THE Y=KITE,A Z=NURSE,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 3 1 ;link 2 18 2 ;link 3 13 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat present -ed the stick to the teacher . . }
#mess:   A=PRESENT X=CAT,A Y=STICK,THE Z=TEACHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 5 2 ;link 2 16 1 ;link 3 14 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister throw -s a brother the kite . . }
#mess:   A=THROW X=SISTER,A Y=KITE,THE Z=BROTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 18 1 ;link 3 12 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was kick -ing a toy . . }
#mess:   A=KICK X=TEACHER,THE Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother was push -ing a ball . . }
#mess:   A=PUSH X=BROTHER,THE Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is kick -ing the ball . . }
#mess:   A=KICK X=GIRL,A Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was run -ing . . }
#mess:   A=RUN Y=TEACHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 14 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog walk -s . . }
#mess:   A=WALK Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 6 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher kick -ed a kite . . }
#mess:   A=KICK X=TEACHER,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman run -s . . }
#mess:   A=RUN Y=WOMAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 4 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl show -ed a kite to a nurse . . }
#mess:   A=SHOW X=GIRL,A Y=KITE,A Z=NURSE,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 18 2 ;link 3 13 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick was push -par by a cat . . }
#mess:   A=PUSH X=CAT,A Y=STICK,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 16 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was kick -par by a boy . . }
#mess:   A=KICK X=BOY,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 7 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is carry -par by the woman . . }
#mess:   A=CARRY X=WOMAN,THE Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 1 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was kick -par by the cat . . }
#mess:   A=KICK X=CAT,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 5 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother kick -ed the ball . . }
#mess:   A=KICK X=BROTHER,A Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 2 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman present -ed the mother the ball . . }
#mess:   A=PRESENT X=WOMAN,THE Y=BALL,THE Z=MOTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 4 1 ;link 2 15 1 ;link 3 10 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher sleep -ed . . }
#mess:   A=SLEEP Y=TEACHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 14 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister present -ed a ball to a man . . }
#mess:   A=PRESENT X=SISTER,A Y=BALL,A Z=MAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 11 2 ;link 2 15 2 ;link 3 3 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl show -s the ball to the sister . . }
#mess:   A=SHOW X=GIRL,THE Y=BALL,THE Z=SISTER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 15 1 ;link 3 11 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister show -s a mother a kite . . }
#mess:   A=SHOW X=SISTER,A Y=KITE,A Z=MOTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 18 2 ;link 3 10 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is sleep -ing . . }
#mess:   A=SLEEP Y=MAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 3 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother show -ed the stick to a girl . . }
#mess:   A=SHOW X=MOTHER,A Y=STICK,THE Z=GIRL,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 10 2 ;link 2 16 1 ;link 3 8 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse present -ed the mother a ball . . }
#mess:   A=PRESENT X=NURSE,A Y=BALL,A Z=MOTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 2 ;link 2 15 2 ;link 3 10 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was kick -ing the stick . . }
#mess:   A=KICK X=TEACHER,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was present -ing the nurse a ball . . }
#mess:   A=PRESENT X=TEACHER,THE Y=BALL,A Z=NURSE,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 14 1 ;link 2 15 2 ;link 3 13 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman is run -ing . . }
#mess:   A=RUN Y=WOMAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 4 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother sleep -s . . }
#mess:   A=SLEEP Y=BROTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 12 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being carry -par by the nurse . . }
#mess:   A=CARRY X=NURSE,THE Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 13 1 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy carry -ed the kite . . }
#mess:   A=CARRY X=BOY,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being push -par by the teacher . . }
#mess:   A=PUSH X=TEACHER,THE Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 14 1 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman jump -ed . . }
#mess:   A=JUMP Y=WOMAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 4 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father throw -ed a teacher a toy . . }
#mess:   A=THROW X=FATHER,THE Y=TOY,A Z=TEACHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 9 1 ;link 2 17 2 ;link 3 14 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman was show -ing the dog the toy . . }
#mess:   A=SHOW X=WOMAN,THE Y=TOY,THE Z=DOG,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 1 ;link 2 17 1 ;link 3 6 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was carry -par by the teacher . . }
#mess:   A=CARRY X=TEACHER,THE Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 14 1 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father was give -ing the sister the ball . . }
#mess:   A=GIVE X=FATHER,A Y=BALL,THE Z=SISTER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 15 1 ;link 3 11 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy kick -ed the toy . . }
#mess:   A=KICK X=BOY,THE Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 7 1 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse push -ed a kite . . }
#mess:   A=PUSH X=NURSE,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 13 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman show -s a boy the stick . . }
#mess:   A=SHOW X=WOMAN,A Y=STICK,THE Z=BOY,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 16 1 ;link 3 7 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog is hit -ing a kite . . }
#mess:   A=HIT X=DOG,THE Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy push -ed a toy . . }
#mess:   A=PUSH X=BOY,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 7 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was carry -par by a boy . . }
#mess:   A=CARRY X=BOY,A Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog is present -ing the sister the ball . . }
#mess:   A=PRESENT X=DOG,A Y=BALL,THE Z=SISTER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 15 1 ;link 3 11 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was show -ing a ball to a dog . . }
#mess:   A=SHOW X=FATHER,THE Y=BALL,A Z=DOG,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 15 2 ;link 3 6 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is being carry -par by the boy . . }
#mess:   A=CARRY X=BOY,THE Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 7 1 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman show -s a brother a ball . . }
#mess:   A=SHOW X=WOMAN,THE Y=BALL,A Z=BROTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 1 ;link 2 15 2 ;link 3 12 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat jump -s . . }
#mess:   A=JUMP Y=CAT,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 5 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was hit -ing the stick . . }
#mess:   A=HIT X=SISTER,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was hit -par by the girl . . }
#mess:   A=HIT X=GIRL,THE Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse is show -ing the kite to a dog . . }
#mess:   A=SHOW X=NURSE,A Y=KITE,THE Z=DOG,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 18 1 ;link 3 6 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was jump -ing . . }
#mess:   A=JUMP Y=SISTER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 11 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is being hit -par by a mother . . }
#mess:   A=HIT X=MOTHER,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was kick -ing the ball . . }
#mess:   A=KICK X=CAT,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 5 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister hit -s a ball . . }
#mess:   A=HIT X=SISTER,THE Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 15 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy is give -ing the toy to a nurse . . }
#mess:   A=GIVE X=BOY,THE Y=TOY,THE Z=NURSE,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 17 1 ;link 3 13 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is being carry -par by a father . . }
#mess:   A=CARRY X=FATHER,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog was give -ing a toy to a mother . . }
#mess:   A=GIVE X=DOG,A Y=TOY,A Z=MOTHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 17 2 ;link 3 10 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog hit -ed a toy . . }
#mess:   A=HIT X=DOG,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother was carry -ing the stick . . }
#mess:   A=CARRY X=BROTHER,A Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man throw -s the toy to the nurse . . }
#mess:   A=THROW X=MAN,A Y=TOY,THE Z=NURSE,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 3 2 ;link 2 17 1 ;link 3 13 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother present -ed a kite to the nurse . . }
#mess:   A=PRESENT X=BROTHER,A Y=KITE,A Z=NURSE,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 18 2 ;link 3 13 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father is throw -ing a father a toy . . }
#mess:   A=THROW X=FATHER,THE Y=TOY,A Z=FATHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 9 1 ;link 2 17 2 ;link 3 9 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat walk -ed . . }
#mess:   A=WALK Y=CAT,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother is hit -ing the ball . . }
#mess:   A=HIT X=BROTHER,THE Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is push -par by a father . . }
#mess:   A=PUSH X=FATHER,A Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 9 2 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was being kick -par by a dog . . }
#mess:   A=KICK X=DOG,A Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 6 2 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog kick -s a kite . . }
#mess:   A=KICK X=DOG,THE Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 1 ;link 2 18 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother throw -ed a girl a stick . . }
#mess:   A=THROW X=BROTHER,A Y=STICK,A Z=GIRL,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 16 2 ;link 3 8 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister was walk -ing . . }
#mess:   A=WALK Y=SISTER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 11 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was hit -par by a man . . }
#mess:   A=HIT X=MAN,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 3 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher is show -ing the teacher the toy . . }
#mess:   A=SHOW X=TEACHER,THE Y=TOY,THE Z=TEACHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 14 1 ;link 2 17 1 ;link 3 14 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father is throw -ing the toy to a mother . . }
#mess:   A=THROW X=FATHER,THE Y=TOY,THE Z=MOTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 1 ;link 2 17 1 ;link 3 10 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister throw -ed a toy to the mother . . }
#mess:   A=THROW X=SISTER,A Y=TOY,A Z=MOTHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 17 2 ;link 3 10 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl hit -ed the kite . . }
#mess:   A=HIT X=GIRL,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 8 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is being hit -par by the brother . . }
#mess:   A=HIT X=BROTHER,THE Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is being carry -par by the cat . . }
#mess:   A=CARRY X=CAT,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 5 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was give -ing the kite to a cat . . }
#mess:   A=GIVE X=TEACHER,THE Y=KITE,THE Z=CAT,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 18 1 ;link 3 5 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat walk -ed . . }
#mess:   A=WALK Y=CAT,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was give -ing the father a toy . . }
#mess:   A=GIVE X=NURSE,A Y=TOY,A Z=FATHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 17 2 ;link 3 9 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog throw -ed a man a ball . . }
#mess:   A=THROW X=DOG,A Y=BALL,A Z=MAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 6 2 ;link 2 15 2 ;link 3 3 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog walk -s . . }
#mess:   A=WALK Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 6 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher carry -ed a kite . . }
#mess:   A=CARRY X=TEACHER,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 14 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother jump -s . . }
#mess:   A=JUMP Y=BROTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 12 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse throw -ed a toy to a father . . }
#mess:   A=THROW X=NURSE,A Y=TOY,A Z=FATHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 17 2 ;link 3 9 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy was jump -ing . . }
#mess:   A=JUMP Y=BOY,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 7 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father present -ed the mother a ball . . }
#mess:   A=PRESENT X=FATHER,A Y=BALL,A Z=MOTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 9 2 ;link 2 15 2 ;link 3 10 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman give -ed the man the stick . . }
#mess:   A=GIVE X=WOMAN,THE Y=STICK,THE Z=MAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 4 1 ;link 2 16 1 ;link 3 3 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was show -ing the teacher the kite . . }
#mess:   A=SHOW X=DOG,THE Y=KITE,THE Z=TEACHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 18 1 ;link 3 14 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman is push -ing a toy . . }
#mess:   A=PUSH X=WOMAN,THE Y=TOY,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 4 1 ;link 2 17 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being carry -par by a man . . }
#mess:   A=CARRY X=MAN,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was hit -par by the girl . . }
#mess:   A=HIT X=GIRL,THE Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister throw -s the toy to a nurse . . }
#mess:   A=THROW X=SISTER,A Y=TOY,THE Z=NURSE,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 17 1 ;link 3 13 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy sleep -s . . }
#mess:   A=SLEEP Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 7 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse present -ed a dog a stick . . }
#mess:   A=PRESENT X=NURSE,THE Y=STICK,A Z=DOG,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 1 ;link 2 16 2 ;link 3 6 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was run -ing . . }
#mess:   A=RUN Y=BOY,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 7 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother is jump -ing . . }
#mess:   A=JUMP Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse sleep -s . . }
#mess:   A=SLEEP Y=NURSE,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 13 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father hit -ed the ball . . }
#mess:   A=HIT X=FATHER,A Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 9 2 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister was throw -ing the kite to a boy . . }
#mess:   A=THROW X=SISTER,A Y=KITE,THE Z=BOY,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 18 1 ;link 3 7 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy kick -s a kite . . }
#mess:   A=KICK X=BOY,A Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 7 2 ;link 2 18 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is give -ing the ball to the mother . . }
#mess:   A=GIVE X=MAN,THE Y=BALL,THE Z=MOTHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 3 1 ;link 2 15 1 ;link 3 10 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother present -ed the ball to a boy . . }
#mess:   A=PRESENT X=MOTHER,A Y=BALL,THE Z=BOY,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 2 ;link 2 15 1 ;link 3 7 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was give -ing a stick to the sister . . }
#mess:   A=GIVE X=CAT,THE Y=STICK,A Z=SISTER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 5 1 ;link 2 16 2 ;link 3 11 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was give -ing the woman a stick . . }
#mess:   A=GIVE X=TEACHER,THE Y=STICK,A Z=WOMAN,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 16 2 ;link 3 4 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball was being push -par by a dog . . }
#mess:   A=PUSH X=DOG,A Y=BALL,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 2 ;link 2 15 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat is present -ing the brother a stick . . }
#mess:   A=PRESENT X=CAT,A Y=STICK,A Z=BROTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 2 ;link 2 16 2 ;link 3 12 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother was present -ing the girl a stick . . }
#mess:   A=PRESENT X=BROTHER,THE Y=STICK,A Z=GIRL,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 12 1 ;link 2 16 2 ;link 3 8 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister push -ed a toy . . }
#mess:   A=PUSH X=SISTER,THE Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 1 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is present -ing the kite to the sister . . }
#mess:   A=PRESENT X=GIRL,THE Y=KITE,THE Z=SISTER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 8 1 ;link 2 18 1 ;link 3 11 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman was give -ing the stick to the brother . . }
#mess:   A=GIVE X=WOMAN,A Y=STICK,THE Z=BROTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 16 1 ;link 3 12 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother run -s . . }
#mess:   A=RUN Y=BROTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 12 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man walk -s . . }
#mess:   A=WALK Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 3 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man is present -ing a stick to the man . . }
#mess:   A=PRESENT X=MAN,A Y=STICK,A Z=MAN,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 3 2 ;link 2 16 2 ;link 3 3 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father is kick -ing a ball . . }
#mess:   A=KICK X=FATHER,THE Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was throw -ing the ball to the brother . . }
#mess:   A=THROW X=CAT,A Y=BALL,THE Z=BROTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 5 2 ;link 2 15 1 ;link 3 12 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat is hit -ing a kite . . }
#mess:   A=HIT X=CAT,A Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 5 2 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister is give -ing the dog a kite . . }
#mess:   A=GIVE X=SISTER,A Y=KITE,A Z=DOG,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 18 2 ;link 3 6 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl show -ed a nurse a stick . . }
#mess:   A=SHOW X=GIRL,A Y=STICK,A Z=NURSE,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 16 2 ;link 3 13 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat present -s the kite to a woman . . }
#mess:   A=PRESENT X=CAT,THE Y=KITE,THE Z=WOMAN,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 18 1 ;link 3 4 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher throw -ed the cat the stick . . }
#mess:   A=THROW X=TEACHER,THE Y=STICK,THE Z=CAT,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 16 1 ;link 3 5 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was push -ing a kite . . }
#mess:   A=PUSH X=DOG,THE Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was give -ing a stick to the mother . . }
#mess:   A=GIVE X=DOG,THE Y=STICK,A Z=MOTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 1 ;link 2 16 2 ;link 3 10 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog walk -s . . }
#mess:   A=WALK Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 6 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is carry -par by the dog . . }
#mess:   A=CARRY X=DOG,THE Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man give -ed the ball to the cat . . }
#mess:   A=GIVE X=MAN,A Y=BALL,THE Z=CAT,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 3 2 ;link 2 15 1 ;link 3 5 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is carry -par by a father . . }
#mess:   A=CARRY X=FATHER,A Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog show -s a dog a stick . . }
#mess:   A=SHOW X=DOG,THE Y=STICK,A Z=DOG,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 16 2 ;link 3 6 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother was kick -ing the stick . . }
#mess:   A=KICK X=BROTHER,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother was push -ing a toy . . }
#mess:   A=PUSH X=BROTHER,A Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 12 2 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher is throw -ing a ball to the dog . . }
#mess:   A=THROW X=TEACHER,THE Y=BALL,A Z=DOG,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 15 2 ;link 3 6 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father run -ed . . }
#mess:   A=RUN Y=FATHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 9 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is push -par by a brother . . }
#mess:   A=PUSH X=BROTHER,A Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 2 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman present -s a nurse a stick . . }
#mess:   A=PRESENT X=WOMAN,THE Y=STICK,A Z=NURSE,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 4 1 ;link 2 16 2 ;link 3 13 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick was being kick -par by a sister . . }
#mess:   A=KICK X=SISTER,A Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 11 2 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman throw -ed the nurse the ball . . }
#mess:   A=THROW X=WOMAN,THE Y=BALL,THE Z=NURSE,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 15 1 ;link 3 13 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is push -par by the dog . . }
#mess:   A=PUSH X=DOG,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was kick -par by a girl . . }
#mess:   A=KICK X=GIRL,A Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man is hit -ing a ball . . }
#mess:   A=HIT X=MAN,A Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 2 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother is show -ing the toy to a father . . }
#mess:   A=SHOW X=BROTHER,A Y=TOY,THE Z=FATHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 12 2 ;link 2 17 1 ;link 3 9 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was walk -ing . . }
#mess:   A=WALK Y=FATHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 9 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl carry -ed a stick . . }
#mess:   A=CARRY X=GIRL,A Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister is throw -ing a sister the kite . . }
#mess:   A=THROW X=SISTER,THE Y=KITE,THE Z=SISTER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 1 ;link 2 18 1 ;link 3 11 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was show -ing the mother a ball . . }
#mess:   A=SHOW X=TEACHER,THE Y=BALL,A Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 14 1 ;link 2 15 2 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog walk -s . . }
#mess:   A=WALK Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 6 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman carry -s the kite . . }
#mess:   A=CARRY X=WOMAN,THE Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 4 1 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was throw -ing the ball to a man . . }
#mess:   A=THROW X=BOY,A Y=BALL,THE Z=MAN,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 15 1 ;link 3 3 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother jump -ed . . }
#mess:   A=JUMP Y=MOTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 10 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother jump -s . . }
#mess:   A=JUMP Y=MOTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 10 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy show -ed a woman a stick . . }
#mess:   A=SHOW X=BOY,A Y=STICK,A Z=WOMAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 2 ;link 2 16 2 ;link 3 4 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother was show -ing a boy a kite . . }
#mess:   A=SHOW X=MOTHER,THE Y=KITE,A Z=BOY,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 1 ;link 2 18 2 ;link 3 7 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being carry -par by the cat . . }
#mess:   A=CARRY X=CAT,THE Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 5 1 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse is walk -ing . . }
#mess:   A=WALK Y=NURSE,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 13 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat is hit -ing a toy . . }
#mess:   A=HIT X=CAT,A Y=TOY,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 5 2 ;link 2 17 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is being hit -par by the cat . . }
#mess:   A=HIT X=CAT,THE Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother is jump -ing . . }
#mess:   A=JUMP Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother is give -ing a toy to the mother . . }
#mess:   A=GIVE X=BROTHER,A Y=TOY,A Z=MOTHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 17 2 ;link 3 10 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher present -s a sister the stick . . }
#mess:   A=PRESENT X=TEACHER,A Y=STICK,THE Z=SISTER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 14 2 ;link 2 16 1 ;link 3 11 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man walk -s . . }
#mess:   A=WALK Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 3 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse was push -ing a ball . . }
#mess:   A=PUSH X=NURSE,THE Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 13 1 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse show -ed a father a toy . . }
#mess:   A=SHOW X=NURSE,A Y=TOY,A Z=FATHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 17 2 ;link 3 9 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse show -ed a ball to a mother . . }
#mess:   A=SHOW X=NURSE,A Y=BALL,A Z=MOTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 15 2 ;link 3 10 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman throw -s a ball to the dog . . }
#mess:   A=THROW X=WOMAN,A Y=BALL,A Z=DOG,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 2 ;link 2 15 2 ;link 3 6 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father present -s a cat the kite . . }
#mess:   A=PRESENT X=FATHER,THE Y=KITE,THE Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 9 1 ;link 2 18 1 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy sleep -s . . }
#mess:   A=SLEEP Y=BOY,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 7 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being carry -par by a man . . }
#mess:   A=CARRY X=MAN,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl push -ed the stick . . }
#mess:   A=PUSH X=GIRL,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 8 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father throw -s a kite to a nurse . . }
#mess:   A=THROW X=FATHER,A Y=KITE,A Z=NURSE,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 2 ;link 2 18 2 ;link 3 13 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was push -par by a girl . . }
#mess:   A=PUSH X=GIRL,A Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 8 2 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball was being carry -par by a boy . . }
#mess:   A=CARRY X=BOY,A Y=BALL,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 15 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was hit -par by the dog . . }
#mess:   A=HIT X=DOG,THE Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was show -ing the toy to a brother . . }
#mess:   A=SHOW X=CAT,A Y=TOY,THE Z=BROTHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 17 1 ;link 3 12 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy carry -ed the ball . . }
#mess:   A=CARRY X=BOY,THE Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 7 1 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother was present -ing a kite to the mother . . }
#mess:   A=PRESENT X=BROTHER,THE Y=KITE,A Z=MOTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 1 ;link 2 18 2 ;link 3 10 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was jump -ing . . }
#mess:   A=JUMP Y=TEACHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 14 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse present -ed the man the ball . . }
#mess:   A=PRESENT X=NURSE,THE Y=BALL,THE Z=MAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 1 ;link 2 15 1 ;link 3 3 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy push -ed the kite . . }
#mess:   A=PUSH X=BOY,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 7 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl give -s a kite to the girl . . }
#mess:   A=GIVE X=GIRL,THE Y=KITE,A Z=GIRL,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 18 2 ;link 3 8 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister sleep -ed . . }
#mess:   A=SLEEP Y=SISTER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 11 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman throw -s a toy to a woman . . }
#mess:   A=THROW X=WOMAN,A Y=TOY,A Z=WOMAN,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 2 ;link 2 17 2 ;link 3 4 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was being push -par by the cat . . }
#mess:   A=PUSH X=CAT,THE Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl throw -s the teacher a stick . . }
#mess:   A=THROW X=GIRL,A Y=STICK,A Z=TEACHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 2 ;link 2 16 2 ;link 3 14 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse is present -ing the nurse a ball . . }
#mess:   A=PRESENT X=NURSE,THE Y=BALL,A Z=NURSE,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 1 ;link 2 15 2 ;link 3 13 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy sleep -s . . }
#mess:   A=SLEEP Y=BOY,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 7 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl jump -s . . }
#mess:   A=JUMP Y=GIRL,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 8 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother give -s a ball to a man . . }
#mess:   A=GIVE X=MOTHER,A Y=BALL,A Z=MAN,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 10 2 ;link 2 15 2 ;link 3 3 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was show -ing the woman a kite . . }
#mess:   A=SHOW X=SISTER,THE Y=KITE,A Z=WOMAN,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 1 ;link 2 18 2 ;link 3 4 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother is hit -ing the stick . . }
#mess:   A=HIT X=BROTHER,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman sleep -ed . . }
#mess:   A=SLEEP Y=WOMAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 4 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is being kick -par by a mother . . }
#mess:   A=KICK X=MOTHER,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 10 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was being push -par by a teacher . . }
#mess:   A=PUSH X=TEACHER,A Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy run -s . . }
#mess:   A=RUN Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 7 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is kick -ing the kite . . }
#mess:   A=KICK X=BOY,A Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 7 2 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman is carry -ing the ball . . }
#mess:   A=CARRY X=WOMAN,THE Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 4 1 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy push -s the stick . . }
#mess:   A=PUSH X=BOY,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 7 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse give -s a teacher the ball . . }
#mess:   A=GIVE X=NURSE,A Y=BALL,THE Z=TEACHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 15 1 ;link 3 14 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman was give -ing the toy to the dog . . }
#mess:   A=GIVE X=WOMAN,A Y=TOY,THE Z=DOG,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 17 1 ;link 3 6 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was being carry -par by a brother . . }
#mess:   A=CARRY X=BROTHER,A Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was give -ing the toy to the man . . }
#mess:   A=GIVE X=BOY,A Y=TOY,THE Z=MAN,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 2 ;link 2 17 1 ;link 3 3 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man was show -ing a mother a kite . . }
#mess:   A=SHOW X=MAN,A Y=KITE,A Z=MOTHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 3 2 ;link 2 18 2 ;link 3 10 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite is being kick -par by a nurse . . }
#mess:   A=KICK X=NURSE,A Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog push -ed a stick . . }
#mess:   A=PUSH X=DOG,THE Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother is show -ing the stick to a father . . }
#mess:   A=SHOW X=BROTHER,THE Y=STICK,THE Z=FATHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 16 1 ;link 3 9 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy throw -ed the girl a ball . . }
#mess:   A=THROW X=BOY,A Y=BALL,A Z=GIRL,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 15 2 ;link 3 8 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog show -s a kite to a mother . . }
#mess:   A=SHOW X=DOG,THE Y=KITE,A Z=MOTHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 18 2 ;link 3 10 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse is present -ing a mother the ball . . }
#mess:   A=PRESENT X=NURSE,A Y=BALL,THE Z=MOTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 2 ;link 2 15 1 ;link 3 10 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog show -ed the ball to a father . . }
#mess:   A=SHOW X=DOG,THE Y=BALL,THE Z=FATHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 15 1 ;link 3 9 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman present -s a toy to a girl . . }
#mess:   A=PRESENT X=WOMAN,THE Y=TOY,A Z=GIRL,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 4 1 ;link 2 17 2 ;link 3 8 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was run -ing . . }
#mess:   A=RUN Y=SISTER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 11 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father show -s a dog a toy . . }
#mess:   A=SHOW X=FATHER,A Y=TOY,A Z=DOG,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 9 2 ;link 2 17 2 ;link 3 6 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is sleep -ing . . }
#mess:   A=SLEEP Y=MOTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 10 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was sleep -ing . . }
#mess:   A=SLEEP Y=FATHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 9 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother walk -ed . . }
#mess:   A=WALK Y=BROTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 12 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl was sleep -ing . . }
#mess:   A=SLEEP Y=GIRL,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 8 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man jump -s . . }
#mess:   A=JUMP Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 3 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher carry -ed a ball . . }
#mess:   A=CARRY X=TEACHER,THE Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 14 1 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher kick -ed a ball . . }
#mess:   A=KICK X=TEACHER,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman is push -ing the stick . . }
#mess:   A=PUSH X=WOMAN,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 4 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being carry -par by the girl . . }
#mess:   A=CARRY X=GIRL,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother is walk -ing . . }
#mess:   A=WALK Y=MOTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 10 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat show -ed a kite to the mother . . }
#mess:   A=SHOW X=CAT,A Y=KITE,A Z=MOTHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 18 2 ;link 3 10 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being kick -par by a man . . }
#mess:   A=KICK X=MAN,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman is sleep -ing . . }
#mess:   A=SLEEP Y=WOMAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 4 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother was show -ing the brother a ball . . }
#mess:   A=SHOW X=MOTHER,THE Y=BALL,A Z=BROTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 1 ;link 2 15 2 ;link 3 12 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is being kick -par by the nurse . . }
#mess:   A=KICK X=NURSE,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was present -ing a teacher a toy . . }
#mess:   A=PRESENT X=DOG,THE Y=TOY,A Z=TEACHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 6 1 ;link 2 17 2 ;link 3 14 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man kick -ed the ball . . }
#mess:   A=KICK X=MAN,THE Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 3 1 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother present -ed the kite to a man . . }
#mess:   A=PRESENT X=BROTHER,THE Y=KITE,THE Z=MAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 1 ;link 2 18 1 ;link 3 3 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was hit -ing the kite . . }
#mess:   A=HIT X=TEACHER,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick was being carry -par by the mother . . }
#mess:   A=CARRY X=MOTHER,THE Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 10 1 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is throw -ing a man a kite . . }
#mess:   A=THROW X=MAN,THE Y=KITE,A Z=MAN,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 3 1 ;link 2 18 2 ;link 3 3 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was push -par by a nurse . . }
#mess:   A=PUSH X=NURSE,A Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 13 2 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother throw -s a cat the toy . . }
#mess:   A=THROW X=BROTHER,A Y=TOY,THE Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 17 1 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher run -ed . . }
#mess:   A=RUN Y=TEACHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 14 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man kick -s a ball . . }
#mess:   A=KICK X=MAN,A Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 15 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father run -s . . }
#mess:   A=RUN Y=FATHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 9 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister walk -s . . }
#mess:   A=WALK Y=SISTER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 11 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was show -ing the father the ball . . }
#mess:   A=SHOW X=CAT,A Y=BALL,THE Z=FATHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 15 1 ;link 3 9 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father kick -s a kite . . }
#mess:   A=KICK X=FATHER,THE Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 18 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother is sleep -ing . . }
#mess:   A=SLEEP Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being hit -par by a teacher . . }
#mess:   A=HIT X=TEACHER,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 14 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman is walk -ing . . }
#mess:   A=WALK Y=WOMAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 4 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister was show -ing a ball to the cat . . }
#mess:   A=SHOW X=SISTER,A Y=BALL,A Z=CAT,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 15 2 ;link 3 5 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman is jump -ing . . }
#mess:   A=JUMP Y=WOMAN,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 4 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy was run -ing . . }
#mess:   A=RUN Y=BOY,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 7 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man is hit -ing a stick . . }
#mess:   A=HIT X=MAN,A Y=STICK,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 2 ;link 2 16 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was kick -par by the nurse . . }
#mess:   A=KICK X=NURSE,THE Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher show -s the woman a kite . . }
#mess:   A=SHOW X=TEACHER,THE Y=KITE,A Z=WOMAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 14 1 ;link 2 18 2 ;link 3 4 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is being push -par by a man . . }
#mess:   A=PUSH X=MAN,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother is carry -ing the toy . . }
#mess:   A=CARRY X=MOTHER,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother walk -s . . }
#mess:   A=WALK Y=BROTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 12 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman present -s the kite to a teacher . . }
#mess:   A=PRESENT X=WOMAN,THE Y=KITE,THE Z=TEACHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 4 1 ;link 2 18 1 ;link 3 14 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father run -ed . . }
#mess:   A=RUN Y=FATHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 9 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man throw -s a toy to the father . . }
#mess:   A=THROW X=MAN,THE Y=TOY,A Z=FATHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 3 1 ;link 2 17 2 ;link 3 9 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog was present -ing a ball to a cat . . }
#mess:   A=PRESENT X=DOG,A Y=BALL,A Z=CAT,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 15 2 ;link 3 5 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman walk -ed . . }
#mess:   A=WALK Y=WOMAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 4 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl was kick -ing the toy . . }
#mess:   A=KICK X=GIRL,THE Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 1 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is give -ing a stick to the dog . . }
#mess:   A=GIVE X=GIRL,THE Y=STICK,A Z=DOG,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 16 2 ;link 3 6 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was carry -par by the brother . . }
#mess:   A=CARRY X=BROTHER,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 12 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was kick -par by the mother . . }
#mess:   A=KICK X=MOTHER,THE Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 10 1 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog show -s a girl the stick . . }
#mess:   A=SHOW X=DOG,A Y=STICK,THE Z=GIRL,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 6 2 ;link 2 16 1 ;link 3 8 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat show -s the stick to the boy . . }
#mess:   A=SHOW X=CAT,THE Y=STICK,THE Z=BOY,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 16 1 ;link 3 7 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother was give -ing a girl a kite . . }
#mess:   A=GIVE X=BROTHER,A Y=KITE,A Z=GIRL,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 18 2 ;link 3 8 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being push -par by the boy . . }
#mess:   A=PUSH X=BOY,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 7 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is jump -ing . . }
#mess:   A=JUMP Y=BOY,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 7 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is push -par by a woman . . }
#mess:   A=PUSH X=WOMAN,A Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 4 2 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is being kick -par by a sister . . }
#mess:   A=KICK X=SISTER,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 11 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man was hit -ing a stick . . }
#mess:   A=HIT X=MAN,A Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 2 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog present -ed the sister a ball . . }
#mess:   A=PRESENT X=DOG,THE Y=BALL,A Z=SISTER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 6 1 ;link 2 15 2 ;link 3 11 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother sleep -ed . . }
#mess:   A=SLEEP Y=BROTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 12 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was give -ing a sister a toy . . }
#mess:   A=GIVE X=CAT,THE Y=TOY,A Z=SISTER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 1 ;link 2 17 2 ;link 3 11 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl was present -ing a girl the kite . . }
#mess:   A=PRESENT X=GIRL,THE Y=KITE,THE Z=GIRL,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 8 1 ;link 2 18 1 ;link 3 8 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister sleep -ed . . }
#mess:   A=SLEEP Y=SISTER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 11 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog was give -ing the kite to a woman . . }
#mess:   A=GIVE X=DOG,A Y=KITE,THE Z=WOMAN,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 18 1 ;link 3 4 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father walk -ed . . }
#mess:   A=WALK Y=FATHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 9 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy hit -ed the toy . . }
#mess:   A=HIT X=BOY,A Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 7 2 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is give -ing a ball to the nurse . . }
#mess:   A=GIVE X=MAN,THE Y=BALL,A Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 3 1 ;link 2 15 2 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog throw -ed a ball to a cat . . }
#mess:   A=THROW X=DOG,A Y=BALL,A Z=CAT,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 6 2 ;link 2 15 2 ;link 3 5 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman show -ed the ball to a mother . . }
#mess:   A=SHOW X=WOMAN,A Y=BALL,THE Z=MOTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 15 1 ;link 3 10 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man show -ed the stick to the dog . . }
#mess:   A=SHOW X=MAN,A Y=STICK,THE Z=DOG,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 3 2 ;link 2 16 1 ;link 3 6 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl jump -ed . . }
#mess:   A=JUMP Y=GIRL,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 8 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was present -ing a boy the toy . . }
#mess:   A=PRESENT X=CAT,THE Y=TOY,THE Z=BOY,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 17 1 ;link 3 7 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite is being carry -par by the mother . . }
#mess:   A=CARRY X=MOTHER,THE Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 10 1 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is carry -ing the toy . . }
#mess:   A=CARRY X=MOTHER,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was carry -par by the teacher . . }
#mess:   A=CARRY X=TEACHER,THE Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 14 1 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father sleep -s . . }
#mess:   A=SLEEP Y=FATHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 9 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse is give -ing a father the ball . . }
#mess:   A=GIVE X=NURSE,A Y=BALL,THE Z=FATHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 15 1 ;link 3 9 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister jump -ed . . }
#mess:   A=JUMP Y=SISTER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 11 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister give -s a sister a ball . . }
#mess:   A=GIVE X=SISTER,THE Y=BALL,A Z=SISTER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 15 2 ;link 3 11 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother was push -ing a toy . . }
#mess:   A=PUSH X=BROTHER,A Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 12 2 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was present -ing the father the toy . . }
#mess:   A=PRESENT X=CAT,THE Y=TOY,THE Z=FATHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 17 1 ;link 3 9 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is hit -ing the kite . . }
#mess:   A=HIT X=GIRL,THE Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog carry -s a stick . . }
#mess:   A=CARRY X=DOG,THE Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 16 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was throw -ing a woman the ball . . }
#mess:   A=THROW X=BOY,A Y=BALL,THE Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 15 1 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is show -ing a man the ball . . }
#mess:   A=SHOW X=BOY,A Y=BALL,THE Z=MAN,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 2 ;link 2 15 1 ;link 3 3 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse present -ed a mother the ball . . }
#mess:   A=PRESENT X=NURSE,THE Y=BALL,THE Z=MOTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 1 ;link 2 15 1 ;link 3 10 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was run -ing . . }
#mess:   A=RUN Y=NURSE,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 13 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man present -ed the man the stick . . }
#mess:   A=PRESENT X=MAN,THE Y=STICK,THE Z=MAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 16 1 ;link 3 3 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman was present -ing the kite to the man . . }
#mess:   A=PRESENT X=WOMAN,A Y=KITE,THE Z=MAN,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 4 2 ;link 2 18 1 ;link 3 3 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy show -s a teacher the stick . . }
#mess:   A=SHOW X=BOY,A Y=STICK,THE Z=TEACHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 2 ;link 2 16 1 ;link 3 14 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy kick -s the toy . . }
#mess:   A=KICK X=BOY,A Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 7 2 ;link 2 17 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was kick -par by the teacher . . }
#mess:   A=KICK X=TEACHER,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister sleep -ed . . }
#mess:   A=SLEEP Y=SISTER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 11 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being hit -par by the father . . }
#mess:   A=HIT X=FATHER,THE Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 9 1 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman was jump -ing . . }
#mess:   A=JUMP Y=WOMAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 4 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being push -par by the cat . . }
#mess:   A=PUSH X=CAT,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was push -ing a toy . . }
#mess:   A=PUSH X=NURSE,A Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 13 2 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog present -ed the girl a toy . . }
#mess:   A=PRESENT X=DOG,THE Y=TOY,A Z=GIRL,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 6 1 ;link 2 17 2 ;link 3 8 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was being push -par by a dog . . }
#mess:   A=PUSH X=DOG,A Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 2 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is hit -par by the nurse . . }
#mess:   A=HIT X=NURSE,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 13 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was kick -ing a ball . . }
#mess:   A=KICK X=TEACHER,A Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 2 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was jump -ing . . }
#mess:   A=JUMP Y=TEACHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 14 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was throw -ing a ball to the boy . . }
#mess:   A=THROW X=NURSE,A Y=BALL,A Z=BOY,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 15 2 ;link 3 7 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was jump -ing . . }
#mess:   A=JUMP Y=SISTER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 11 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat throw -ed a teacher a stick . . }
#mess:   A=THROW X=CAT,THE Y=STICK,A Z=TEACHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 5 1 ;link 2 16 2 ;link 3 14 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman is give -ing a kite to the boy . . }
#mess:   A=GIVE X=WOMAN,A Y=KITE,A Z=BOY,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 18 2 ;link 3 7 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother was sleep -ing . . }
#mess:   A=SLEEP Y=MOTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 10 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy throw -ed the toy to a father . . }
#mess:   A=THROW X=BOY,A Y=TOY,THE Z=FATHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 17 1 ;link 3 9 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother show -ed a brother a toy . . }
#mess:   A=SHOW X=MOTHER,A Y=TOY,A Z=BROTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 2 ;link 2 17 2 ;link 3 12 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl carry -ed the kite . . }
#mess:   A=CARRY X=GIRL,THE Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother is run -ing . . }
#mess:   A=RUN Y=BROTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 12 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother was kick -ing the kite . . }
#mess:   A=KICK X=MOTHER,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 10 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was kick -par by the nurse . . }
#mess:   A=KICK X=NURSE,THE Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy is show -ing a woman the ball . . }
#mess:   A=SHOW X=BOY,THE Y=BALL,THE Z=WOMAN,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 1 ;link 2 15 1 ;link 3 4 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse was throw -ing the man a kite . . }
#mess:   A=THROW X=NURSE,THE Y=KITE,A Z=MAN,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 13 1 ;link 2 18 2 ;link 3 3 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is throw -ing a woman the stick . . }
#mess:   A=THROW X=MAN,THE Y=STICK,THE Z=WOMAN,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 3 1 ;link 2 16 1 ;link 3 4 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was carry -par by a dog . . }
#mess:   A=CARRY X=DOG,A Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 6 2 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is present -ing the toy to a dog . . }
#mess:   A=PRESENT X=BOY,A Y=TOY,THE Z=DOG,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 7 2 ;link 2 17 1 ;link 3 6 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was give -ing a ball to the sister . . }
#mess:   A=GIVE X=NURSE,A Y=BALL,A Z=SISTER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 15 2 ;link 3 11 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman was sleep -ing . . }
#mess:   A=SLEEP Y=WOMAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 4 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat carry -s the stick . . }
#mess:   A=CARRY X=CAT,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was being push -par by the woman . . }
#mess:   A=PUSH X=WOMAN,THE Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 4 1 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was kick -ing a kite . . }
#mess:   A=KICK X=CAT,THE Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 5 1 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman show -s a cat a ball . . }
#mess:   A=SHOW X=WOMAN,THE Y=BALL,A Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 1 ;link 2 15 2 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is carry -ing the stick . . }
#mess:   A=CARRY X=MAN,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 3 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister walk -ed . . }
#mess:   A=WALK Y=SISTER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 11 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is being hit -par by a brother . . }
#mess:   A=HIT X=BROTHER,A Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 2 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father present -s the stick to a father . . }
#mess:   A=PRESENT X=FATHER,A Y=STICK,THE Z=FATHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 9 2 ;link 2 16 1 ;link 3 9 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is give -ing a boy a stick . . }
#mess:   A=GIVE X=MOTHER,A Y=STICK,A Z=BOY,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 10 2 ;link 2 16 2 ;link 3 7 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog push -ed a ball . . }
#mess:   A=PUSH X=DOG,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman show -s the dog a ball . . }
#mess:   A=SHOW X=WOMAN,A Y=BALL,A Z=DOG,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 15 2 ;link 3 6 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is kick -par by a brother . . }
#mess:   A=KICK X=BROTHER,A Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 12 2 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy give -s the kite to the girl . . }
#mess:   A=GIVE X=BOY,THE Y=KITE,THE Z=GIRL,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 18 1 ;link 3 8 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat is throw -ing a ball to a brother . . }
#mess:   A=THROW X=CAT,A Y=BALL,A Z=BROTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 5 2 ;link 2 15 2 ;link 3 12 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse give -ed a kite to the dog . . }
#mess:   A=GIVE X=NURSE,THE Y=KITE,A Z=DOG,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 13 1 ;link 2 18 2 ;link 3 6 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was present -ing the teacher a kite . . }
#mess:   A=PRESENT X=NURSE,A Y=KITE,A Z=TEACHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 2 ;link 2 18 2 ;link 3 14 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother throw -s the toy to a dog . . }
#mess:   A=THROW X=BROTHER,THE Y=TOY,THE Z=DOG,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 17 1 ;link 3 6 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was hit -ing a toy . . }
#mess:   A=HIT X=NURSE,A Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 13 2 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother push -ed the toy . . }
#mess:   A=PUSH X=BROTHER,THE Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl throw -s a father a stick . . }
#mess:   A=THROW X=GIRL,THE Y=STICK,A Z=FATHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 1 ;link 2 16 2 ;link 3 9 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man give -s the stick to a teacher . . }
#mess:   A=GIVE X=MAN,THE Y=STICK,THE Z=TEACHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 3 1 ;link 2 16 1 ;link 3 14 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister is throw -ing the man the ball . . }
#mess:   A=THROW X=SISTER,THE Y=BALL,THE Z=MAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 1 ;link 2 15 1 ;link 3 3 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is present -ing the ball to the brother . . }
#mess:   A=PRESENT X=MAN,THE Y=BALL,THE Z=BROTHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 15 1 ;link 3 12 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman kick -s a stick . . }
#mess:   A=KICK X=WOMAN,THE Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 4 1 ;link 2 16 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother throw -ed a toy to the girl . . }
#mess:   A=THROW X=BROTHER,A Y=TOY,A Z=GIRL,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 17 2 ;link 3 8 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was give -ing the ball to a teacher . . }
#mess:   A=GIVE X=BOY,A Y=BALL,THE Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 2 ;link 2 15 1 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse is throw -ing a kite to a girl . . }
#mess:   A=THROW X=NURSE,A Y=KITE,A Z=GIRL,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 18 2 ;link 3 8 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man present -ed a father a ball . . }
#mess:   A=PRESENT X=MAN,THE Y=BALL,A Z=FATHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 15 2 ;link 3 9 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is being push -par by the brother . . }
#mess:   A=PUSH X=BROTHER,THE Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being carry -par by a girl . . }
#mess:   A=CARRY X=GIRL,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman is walk -ing . . }
#mess:   A=WALK Y=WOMAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 4 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was kick -par by a man . . }
#mess:   A=KICK X=MAN,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat hit -ed a ball . . }
#mess:   A=HIT X=CAT,THE Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is being kick -par by the mother . . }
#mess:   A=KICK X=MOTHER,THE Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 10 1 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was present -ing a boy a kite . . }
#mess:   A=PRESENT X=FATHER,THE Y=KITE,A Z=BOY,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 9 1 ;link 2 18 2 ;link 3 7 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother is present -ing a father a kite . . }
#mess:   A=PRESENT X=BROTHER,A Y=KITE,A Z=FATHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 18 2 ;link 3 9 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was jump -ing . . }
#mess:   A=JUMP Y=TEACHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 14 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister push -s the toy . . }
#mess:   A=PUSH X=SISTER,THE Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 1 ;link 2 17 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man carry -ed a kite . . }
#mess:   A=CARRY X=MAN,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 3 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher show -ed a girl the kite . . }
#mess:   A=SHOW X=TEACHER,A Y=KITE,THE Z=GIRL,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 14 2 ;link 2 18 1 ;link 3 8 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother was walk -ing . . }
#mess:   A=WALK Y=MOTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 10 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher run -ed . . }
#mess:   A=RUN Y=TEACHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 14 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother run -ed . . }
#mess:   A=RUN Y=BROTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 12 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat run -s . . }
#mess:   A=RUN Y=CAT,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 5 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite is kick -par by a father . . }
#mess:   A=KICK X=FATHER,A Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being push -par by a woman . . }
#mess:   A=PUSH X=WOMAN,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 4 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is being push -par by a girl . . }
#mess:   A=PUSH X=GIRL,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 8 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being kick -par by a man . . }
#mess:   A=KICK X=MAN,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman hit -ed a stick . . }
#mess:   A=HIT X=WOMAN,A Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is being kick -par by a man . . }
#mess:   A=KICK X=MAN,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman is carry -ing a ball . . }
#mess:   A=CARRY X=WOMAN,A Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is being hit -par by a father . . }
#mess:   A=HIT X=FATHER,A Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 9 2 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man was kick -ing the stick . . }
#mess:   A=KICK X=MAN,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 3 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman show -s the boy the ball . . }
#mess:   A=SHOW X=WOMAN,A Y=BALL,THE Z=BOY,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 15 1 ;link 3 7 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man is carry -ing the stick . . }
#mess:   A=CARRY X=MAN,A Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man was jump -ing . . }
#mess:   A=JUMP Y=MAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 3 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is show -ing the toy to a boy . . }
#mess:   A=SHOW X=FATHER,A Y=TOY,THE Z=BOY,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 9 2 ;link 2 17 1 ;link 3 7 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister show -ed a girl the ball . . }
#mess:   A=SHOW X=SISTER,A Y=BALL,THE Z=GIRL,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 15 1 ;link 3 8 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is throw -ing the dog the ball . . }
#mess:   A=THROW X=FATHER,A Y=BALL,THE Z=DOG,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 9 2 ;link 2 15 1 ;link 3 6 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is carry -ing the toy . . }
#mess:   A=CARRY X=BOY,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was kick -par by a father . . }
#mess:   A=KICK X=FATHER,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was being carry -par by a girl . . }
#mess:   A=CARRY X=GIRL,A Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is being push -par by the dog . . }
#mess:   A=PUSH X=DOG,THE Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being push -par by the cat . . }
#mess:   A=PUSH X=CAT,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was walk -ing . . }
#mess:   A=WALK Y=CAT,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister give -s the woman a ball . . }
#mess:   A=GIVE X=SISTER,A Y=BALL,A Z=WOMAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 15 2 ;link 3 4 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother give -ed a sister a stick . . }
#mess:   A=GIVE X=MOTHER,THE Y=STICK,A Z=SISTER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 10 1 ;link 2 16 2 ;link 3 11 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher is push -ing the toy . . }
#mess:   A=PUSH X=TEACHER,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was kick -ing a stick . . }
#mess:   A=KICK X=FATHER,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher run -s . . }
#mess:   A=RUN Y=TEACHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 14 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is kick -par by a woman . . }
#mess:   A=KICK X=WOMAN,A Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 4 2 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister push -ed the toy . . }
#mess:   A=PUSH X=SISTER,THE Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 1 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother is show -ing a cat a stick . . }
#mess:   A=SHOW X=MOTHER,THE Y=STICK,A Z=CAT,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 1 ;link 2 16 2 ;link 3 5 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being push -par by the woman . . }
#mess:   A=PUSH X=WOMAN,THE Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 4 1 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was kick -par by a mother . . }
#mess:   A=KICK X=MOTHER,A Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 10 2 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was walk -ing . . }
#mess:   A=WALK Y=TEACHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 14 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was carry -ing a stick . . }
#mess:   A=CARRY X=FATHER,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher throw -s a stick to the father . . }
#mess:   A=THROW X=TEACHER,THE Y=STICK,A Z=FATHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 16 2 ;link 3 9 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog run -s . . }
#mess:   A=RUN Y=DOG,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 6 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy give -ed the kite to a mother . . }
#mess:   A=GIVE X=BOY,THE Y=KITE,THE Z=MOTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 18 1 ;link 3 10 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher is push -ing the toy . . }
#mess:   A=PUSH X=TEACHER,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat present -ed a stick to a woman . . }
#mess:   A=PRESENT X=CAT,THE Y=STICK,A Z=WOMAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 16 2 ;link 3 4 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog is hit -ing the toy . . }
#mess:   A=HIT X=DOG,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man walk -s . . }
#mess:   A=WALK Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 3 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister is throw -ing a ball to the dog . . }
#mess:   A=THROW X=SISTER,A Y=BALL,A Z=DOG,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 15 2 ;link 3 6 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman was throw -ing the man the ball . . }
#mess:   A=THROW X=WOMAN,THE Y=BALL,THE Z=MAN,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 15 1 ;link 3 3 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is run -ing . . }
#mess:   A=RUN Y=GIRL,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 8 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was show -ing a father a stick . . }
#mess:   A=SHOW X=CAT,A Y=STICK,A Z=FATHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 16 2 ;link 3 9 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father give -s the woman a kite . . }
#mess:   A=GIVE X=FATHER,THE Y=KITE,A Z=WOMAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 18 2 ;link 3 4 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father give -s a father a kite . . }
#mess:   A=GIVE X=FATHER,THE Y=KITE,A Z=FATHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 18 2 ;link 3 9 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is push -par by a cat . . }
#mess:   A=PUSH X=CAT,A Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher is push -ing a ball . . }
#mess:   A=PUSH X=TEACHER,THE Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 14 1 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is being kick -par by the mother . . }
#mess:   A=KICK X=MOTHER,THE Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 10 1 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is show -ing the cat a kite . . }
#mess:   A=SHOW X=GIRL,A Y=KITE,A Z=CAT,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 18 2 ;link 3 5 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman throw -ed a ball to the man . . }
#mess:   A=THROW X=WOMAN,THE Y=BALL,A Z=MAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 15 2 ;link 3 3 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl walk -ed . . }
#mess:   A=WALK Y=GIRL,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 8 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother give -ed the stick to a boy . . }
#mess:   A=GIVE X=BROTHER,A Y=STICK,THE Z=BOY,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 16 1 ;link 3 7 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat carry -ed the stick . . }
#mess:   A=CARRY X=CAT,A Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 2 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was jump -ing . . }
#mess:   A=JUMP Y=TEACHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 14 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister hit -ed a ball . . }
#mess:   A=HIT X=SISTER,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was hit -ing a stick . . }
#mess:   A=HIT X=FATHER,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 9 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister was show -ing a mother a toy . . }
#mess:   A=SHOW X=SISTER,A Y=TOY,A Z=MOTHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 17 2 ;link 3 10 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is hit -par by the teacher . . }
#mess:   A=HIT X=TEACHER,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother throw -ed a sister a stick . . }
#mess:   A=THROW X=BROTHER,THE Y=STICK,A Z=SISTER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 16 2 ;link 3 11 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother was hit -ing the ball . . }
#mess:   A=HIT X=BROTHER,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 12 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was show -ing a stick to the sister . . }
#mess:   A=SHOW X=NURSE,A Y=STICK,A Z=SISTER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 16 2 ;link 3 11 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man run -ed . . }
#mess:   A=RUN Y=MAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 3 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat give -ed a brother a ball . . }
#mess:   A=GIVE X=CAT,A Y=BALL,A Z=BROTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 2 ;link 2 15 2 ;link 3 12 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother jump -ed . . }
#mess:   A=JUMP Y=BROTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 12 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was being kick -par by a father . . }
#mess:   A=KICK X=FATHER,A Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is kick -par by the cat . . }
#mess:   A=KICK X=CAT,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 5 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister jump -ed . . }
#mess:   A=JUMP Y=SISTER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 11 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball was being push -par by the man . . }
#mess:   A=PUSH X=MAN,THE Y=BALL,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 15 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother show -ed a kite to the girl . . }
#mess:   A=SHOW X=MOTHER,A Y=KITE,A Z=GIRL,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 10 2 ;link 2 18 2 ;link 3 8 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister run -ed . . }
#mess:   A=RUN Y=SISTER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 11 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man push -s the stick . . }
#mess:   A=PUSH X=MAN,THE Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 16 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is carry -ing a kite . . }
#mess:   A=CARRY X=FATHER,A Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog is give -ing the stick to a nurse . . }
#mess:   A=GIVE X=DOG,A Y=STICK,THE Z=NURSE,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 16 1 ;link 3 13 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse is sleep -ing . . }
#mess:   A=SLEEP Y=NURSE,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 13 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog jump -ed . . }
#mess:   A=JUMP Y=DOG,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 6 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is show -ing the dog the toy . . }
#mess:   A=SHOW X=MAN,THE Y=TOY,THE Z=DOG,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 17 1 ;link 3 6 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is hit -par by the teacher . . }
#mess:   A=HIT X=TEACHER,THE Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man present -ed a ball to the woman . . }
#mess:   A=PRESENT X=MAN,THE Y=BALL,A Z=WOMAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 15 2 ;link 3 4 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy was throw -ing the kite to the man . . }
#mess:   A=THROW X=BOY,THE Y=KITE,THE Z=MAN,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 7 1 ;link 2 18 1 ;link 3 3 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick was being hit -par by the cat . . }
#mess:   A=HIT X=CAT,THE Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother present -ed a man the toy . . }
#mess:   A=PRESENT X=MOTHER,A Y=TOY,THE Z=MAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 10 2 ;link 2 17 1 ;link 3 3 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse hit -ed a toy . . }
#mess:   A=HIT X=NURSE,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 13 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse run -ed . . }
#mess:   A=RUN Y=NURSE,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 13 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher run -ed . . }
#mess:   A=RUN Y=TEACHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 14 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is give -ing a sister the ball . . }
#mess:   A=GIVE X=MAN,THE Y=BALL,THE Z=SISTER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 3 1 ;link 2 15 1 ;link 3 11 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was carry -ing the toy . . }
#mess:   A=CARRY X=BOY,A Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy present -s a cat the stick . . }
#mess:   A=PRESENT X=BOY,THE Y=STICK,THE Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 7 1 ;link 2 16 1 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is push -par by a teacher . . }
#mess:   A=PUSH X=TEACHER,A Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother was jump -ing . . }
#mess:   A=JUMP Y=BROTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 12 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister give -ed the teacher a toy . . }
#mess:   A=GIVE X=SISTER,A Y=TOY,A Z=TEACHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 17 2 ;link 3 14 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father kick -ed the toy . . }
#mess:   A=KICK X=FATHER,A Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher push -ed the toy . . }
#mess:   A=PUSH X=TEACHER,A Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy present -ed the toy to a mother . . }
#mess:   A=PRESENT X=BOY,A Y=TOY,THE Z=MOTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 7 2 ;link 2 17 1 ;link 3 10 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse throw -ed a stick to a cat . . }
#mess:   A=THROW X=NURSE,THE Y=STICK,A Z=CAT,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 13 1 ;link 2 16 2 ;link 3 5 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister hit -s a stick . . }
#mess:   A=HIT X=SISTER,THE Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 16 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is hit -par by a nurse . . }
#mess:   A=HIT X=NURSE,A Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 13 2 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father is throw -ing a kite to a man . . }
#mess:   A=THROW X=FATHER,THE Y=KITE,A Z=MAN,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 1 ;link 2 18 2 ;link 3 3 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother jump -ed . . }
#mess:   A=JUMP Y=MOTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 10 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother is give -ing a stick to the nurse . . }
#mess:   A=GIVE X=BROTHER,THE Y=STICK,A Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 12 1 ;link 2 16 2 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse is walk -ing . . }
#mess:   A=WALK Y=NURSE,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 13 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher walk -s . . }
#mess:   A=WALK Y=TEACHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 14 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being push -par by a boy . . }
#mess:   A=PUSH X=BOY,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 7 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother was push -ing a ball . . }
#mess:   A=PUSH X=BROTHER,A Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 12 2 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog kick -ed the ball . . }
#mess:   A=KICK X=DOG,THE Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 1 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother present -s the woman a stick . . }
#mess:   A=PRESENT X=MOTHER,THE Y=STICK,A Z=WOMAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 10 1 ;link 2 16 2 ;link 3 4 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother show -s the toy to a mother . . }
#mess:   A=SHOW X=BROTHER,A Y=TOY,THE Z=MOTHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 12 2 ;link 2 17 1 ;link 3 10 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is give -ing a dog a toy . . }
#mess:   A=GIVE X=BOY,A Y=TOY,A Z=DOG,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 7 2 ;link 2 17 2 ;link 3 6 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother sleep -ed . . }
#mess:   A=SLEEP Y=MOTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 10 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse is show -ing the kite to the cat . . }
#mess:   A=SHOW X=NURSE,A Y=KITE,THE Z=CAT,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 18 1 ;link 3 5 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man show -ed the stick to the man . . }
#mess:   A=SHOW X=MAN,A Y=STICK,THE Z=MAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 3 2 ;link 2 16 1 ;link 3 3 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman walk -s . . }
#mess:   A=WALK Y=WOMAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 4 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher show -ed a cat the toy . . }
#mess:   A=SHOW X=TEACHER,A Y=TOY,THE Z=CAT,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 14 2 ;link 2 17 1 ;link 3 5 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl show -s a boy a stick . . }
#mess:   A=SHOW X=GIRL,A Y=STICK,A Z=BOY,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 16 2 ;link 3 7 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman is throw -ing a dog a ball . . }
#mess:   A=THROW X=WOMAN,THE Y=BALL,A Z=DOG,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 15 2 ;link 3 6 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman give -ed a teacher the ball . . }
#mess:   A=GIVE X=WOMAN,THE Y=BALL,THE Z=TEACHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 4 1 ;link 2 15 1 ;link 3 14 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man hit -ed the kite . . }
#mess:   A=HIT X=MAN,THE Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 1 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl was carry -ing a stick . . }
#mess:   A=CARRY X=GIRL,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father was throw -ing a stick to the cat . . }
#mess:   A=THROW X=FATHER,A Y=STICK,A Z=CAT,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 2 ;link 2 16 2 ;link 3 5 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was sleep -ing . . }
#mess:   A=SLEEP Y=CAT,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 5 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man sleep -ed . . }
#mess:   A=SLEEP Y=MAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 3 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man hit -s the kite . . }
#mess:   A=HIT X=MAN,THE Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 1 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was hit -ing the kite . . }
#mess:   A=HIT X=CAT,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman push -ed the toy . . }
#mess:   A=PUSH X=WOMAN,A Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 4 2 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was push -par by a man . . }
#mess:   A=PUSH X=MAN,A Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is hit -par by a nurse . . }
#mess:   A=HIT X=NURSE,A Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 13 2 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite is hit -par by the brother . . }
#mess:   A=HIT X=BROTHER,THE Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being hit -par by the brother . . }
#mess:   A=HIT X=BROTHER,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog jump -s . . }
#mess:   A=JUMP Y=DOG,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 6 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher jump -s . . }
#mess:   A=JUMP Y=TEACHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 14 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman was throw -ing the brother the toy . . }
#mess:   A=THROW X=WOMAN,THE Y=TOY,THE Z=BROTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 17 1 ;link 3 12 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog throw -s the ball to a woman . . }
#mess:   A=THROW X=DOG,THE Y=BALL,THE Z=WOMAN,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 6 1 ;link 2 15 1 ;link 3 4 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog throw -ed a toy to the dog . . }
#mess:   A=THROW X=DOG,THE Y=TOY,A Z=DOG,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 6 1 ;link 2 17 2 ;link 3 6 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother present -ed a kite to the teacher . . }
#mess:   A=PRESENT X=BROTHER,THE Y=KITE,A Z=TEACHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 1 ;link 2 18 2 ;link 3 14 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is jump -ing . . }
#mess:   A=JUMP Y=FATHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 9 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister sleep -ed . . }
#mess:   A=SLEEP Y=SISTER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 11 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman sleep -ed . . }
#mess:   A=SLEEP Y=WOMAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 4 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl sleep -ed . . }
#mess:   A=SLEEP Y=GIRL,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 8 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is being hit -par by the girl . . }
#mess:   A=HIT X=GIRL,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog present -ed a kite to the teacher . . }
#mess:   A=PRESENT X=DOG,THE Y=KITE,A Z=TEACHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 6 1 ;link 2 18 2 ;link 3 14 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman was jump -ing . . }
#mess:   A=JUMP Y=WOMAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 4 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is being hit -par by a sister . . }
#mess:   A=HIT X=SISTER,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher push -s the kite . . }
#mess:   A=PUSH X=TEACHER,THE Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 14 1 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher show -ed a dog the kite . . }
#mess:   A=SHOW X=TEACHER,A Y=KITE,THE Z=DOG,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 14 2 ;link 2 18 1 ;link 3 6 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat is give -ing the toy to a girl . . }
#mess:   A=GIVE X=CAT,THE Y=TOY,THE Z=GIRL,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 5 1 ;link 2 17 1 ;link 3 8 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother present -ed a ball to the boy . . }
#mess:   A=PRESENT X=MOTHER,A Y=BALL,A Z=BOY,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 2 ;link 2 15 2 ;link 3 7 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl was throw -ing a girl the ball . . }
#mess:   A=THROW X=GIRL,THE Y=BALL,THE Z=GIRL,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 1 ;link 2 15 1 ;link 3 8 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was being push -par by the mother . . }
#mess:   A=PUSH X=MOTHER,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 10 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball was push -par by a sister . . }
#mess:   A=PUSH X=SISTER,A Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 11 2 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother was throw -ing a teacher the ball . . }
#mess:   A=THROW X=BROTHER,THE Y=BALL,THE Z=TEACHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 15 1 ;link 3 14 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is being carry -par by the nurse . . }
#mess:   A=CARRY X=NURSE,THE Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 13 1 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man present -s a stick to the cat . . }
#mess:   A=PRESENT X=MAN,A Y=STICK,A Z=CAT,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 3 2 ;link 2 16 2 ;link 3 5 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was being push -par by a girl . . }
#mess:   A=PUSH X=GIRL,A Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 8 2 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was show -ing the stick to the brother . . }
#mess:   A=SHOW X=CAT,THE Y=STICK,THE Z=BROTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 16 1 ;link 3 12 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher run -ed . . }
#mess:   A=RUN Y=TEACHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 14 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl kick -s the toy . . }
#mess:   A=KICK X=GIRL,A Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 17 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother give -ed the kite to the teacher . . }
#mess:   A=GIVE X=MOTHER,A Y=KITE,THE Z=TEACHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 10 2 ;link 2 18 1 ;link 3 14 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is show -ing a stick to the mother . . }
#mess:   A=SHOW X=BOY,A Y=STICK,A Z=MOTHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 7 2 ;link 2 16 2 ;link 3 10 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother present -ed a dog the stick . . }
#mess:   A=PRESENT X=MOTHER,A Y=STICK,THE Z=DOG,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 10 2 ;link 2 16 1 ;link 3 6 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is present -ing a stick to a nurse . . }
#mess:   A=PRESENT X=MOTHER,A Y=STICK,A Z=NURSE,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 2 ;link 2 16 2 ;link 3 13 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was hit -ing the toy . . }
#mess:   A=HIT X=DOG,THE Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse kick -ed the stick . . }
#mess:   A=KICK X=NURSE,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is sleep -ing . . }
#mess:   A=SLEEP Y=GIRL,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 8 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother push -s a stick . . }
#mess:   A=PUSH X=BROTHER,A Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 12 2 ;link 2 16 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman show -ed the stick to a boy . . }
#mess:   A=SHOW X=WOMAN,THE Y=STICK,THE Z=BOY,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 4 1 ;link 2 16 1 ;link 3 7 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy walk -s . . }
#mess:   A=WALK Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 7 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman is present -ing a cat the ball . . }
#mess:   A=PRESENT X=WOMAN,A Y=BALL,THE Z=CAT,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 4 2 ;link 2 15 1 ;link 3 5 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher give -ed the stick to a father . . }
#mess:   A=GIVE X=TEACHER,A Y=STICK,THE Z=FATHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 16 1 ;link 3 9 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl throw -ed a father a ball . . }
#mess:   A=THROW X=GIRL,THE Y=BALL,A Z=FATHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 1 ;link 2 15 2 ;link 3 9 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was being hit -par by the girl . . }
#mess:   A=HIT X=GIRL,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is throw -ing the stick to the nurse . . }
#mess:   A=THROW X=MAN,THE Y=STICK,THE Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 3 1 ;link 2 16 1 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy is hit -ing the kite . . }
#mess:   A=HIT X=BOY,THE Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 7 1 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was push -par by a boy . . }
#mess:   A=PUSH X=BOY,A Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 7 2 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman give -ed the father a toy . . }
#mess:   A=GIVE X=WOMAN,A Y=TOY,A Z=FATHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 17 2 ;link 3 9 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog sleep -s . . }
#mess:   A=SLEEP Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 6 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher show -ed a kite to a father . . }
#mess:   A=SHOW X=TEACHER,A Y=KITE,A Z=FATHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 14 2 ;link 2 18 2 ;link 3 9 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother present -s the mother the kite . . }
#mess:   A=PRESENT X=BROTHER,THE Y=KITE,THE Z=MOTHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 12 1 ;link 2 18 1 ;link 3 10 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was being carry -par by a girl . . }
#mess:   A=CARRY X=GIRL,A Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog is carry -ing the ball . . }
#mess:   A=CARRY X=DOG,A Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 2 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl jump -s . . }
#mess:   A=JUMP Y=GIRL,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 8 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man was give -ing the teacher the toy . . }
#mess:   A=GIVE X=MAN,A Y=TOY,THE Z=TEACHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 3 2 ;link 2 17 1 ;link 3 14 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was show -ing the ball to a father . . }
#mess:   A=SHOW X=FATHER,THE Y=BALL,THE Z=FATHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 15 1 ;link 3 9 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is being kick -par by the boy . . }
#mess:   A=KICK X=BOY,THE Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 7 1 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man present -ed the woman the kite . . }
#mess:   A=PRESENT X=MAN,THE Y=KITE,THE Z=WOMAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 18 1 ;link 3 4 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is jump -ing . . }
#mess:   A=JUMP Y=MAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 3 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man push -s the kite . . }
#mess:   A=PUSH X=MAN,THE Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother was show -ing the cat the stick . . }
#mess:   A=SHOW X=BROTHER,A Y=STICK,THE Z=CAT,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 2 ;link 2 16 1 ;link 3 5 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was throw -ing a man the toy . . }
#mess:   A=THROW X=BOY,A Y=TOY,THE Z=MAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 17 1 ;link 3 3 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is being push -par by the mother . . }
#mess:   A=PUSH X=MOTHER,THE Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 10 1 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl throw -ed a cat the ball . . }
#mess:   A=THROW X=GIRL,A Y=BALL,THE Z=CAT,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 2 ;link 2 15 1 ;link 3 5 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother walk -ed . . }
#mess:   A=WALK Y=MOTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 10 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was throw -ing the stick to the dog . . }
#mess:   A=THROW X=DOG,THE Y=STICK,THE Z=DOG,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 6 1 ;link 2 16 1 ;link 3 6 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog present -ed the toy to a girl . . }
#mess:   A=PRESENT X=DOG,A Y=TOY,THE Z=GIRL,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 17 1 ;link 3 8 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher show -s the ball to the girl . . }
#mess:   A=SHOW X=TEACHER,THE Y=BALL,THE Z=GIRL,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 14 1 ;link 2 15 1 ;link 3 8 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was being carry -par by the teacher . . }
#mess:   A=CARRY X=TEACHER,THE Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 14 1 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman throw -ed a father the stick . . }
#mess:   A=THROW X=WOMAN,A Y=STICK,THE Z=FATHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 4 2 ;link 2 16 1 ;link 3 9 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is being hit -par by the man . . }
#mess:   A=HIT X=MAN,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 3 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was present -ing the woman a stick . . }
#mess:   A=PRESENT X=BOY,A Y=STICK,A Z=WOMAN,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 7 2 ;link 2 16 2 ;link 3 4 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is kick -par by the father . . }
#mess:   A=KICK X=FATHER,THE Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy show -s the woman a stick . . }
#mess:   A=SHOW X=BOY,THE Y=STICK,A Z=WOMAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 1 ;link 2 16 2 ;link 3 4 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is being hit -par by a brother . . }
#mess:   A=HIT X=BROTHER,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse show -s a girl a ball . . }
#mess:   A=SHOW X=NURSE,A Y=BALL,A Z=GIRL,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 15 2 ;link 3 8 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick was carry -par by the father . . }
#mess:   A=CARRY X=FATHER,THE Y=STICK,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 9 1 ;link 2 16 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was hit -ing the stick . . }
#mess:   A=HIT X=SISTER,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was carry -par by the mother . . }
#mess:   A=CARRY X=MOTHER,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 10 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being push -par by the man . . }
#mess:   A=PUSH X=MAN,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother is walk -ing . . }
#mess:   A=WALK Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man sleep -s . . }
#mess:   A=SLEEP Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 3 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is being carry -par by a mother . . }
#mess:   A=CARRY X=MOTHER,A Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 10 2 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy present -ed a cat a stick . . }
#mess:   A=PRESENT X=BOY,THE Y=STICK,A Z=CAT,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 7 1 ;link 2 16 2 ;link 3 5 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog run -s . . }
#mess:   A=RUN Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 6 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is being kick -par by the father . . }
#mess:   A=KICK X=FATHER,THE Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother was show -ing the toy to the man . . }
#mess:   A=SHOW X=MOTHER,THE Y=TOY,THE Z=MAN,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 10 1 ;link 2 17 1 ;link 3 3 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman walk -s . . }
#mess:   A=WALK Y=WOMAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 4 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister throw -ed the stick to the brother . . }
#mess:   A=THROW X=SISTER,THE Y=STICK,THE Z=BROTHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 1 ;link 2 16 1 ;link 3 12 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was give -ing a woman a toy . . }
#mess:   A=GIVE X=SISTER,THE Y=TOY,A Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 17 2 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister throw -s a boy the ball . . }
#mess:   A=THROW X=SISTER,THE Y=BALL,THE Z=BOY,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 1 ;link 2 15 1 ;link 3 7 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy walk -ed . . }
#mess:   A=WALK Y=BOY,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 7 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother show -ed the ball to the boy . . }
#mess:   A=SHOW X=MOTHER,A Y=BALL,THE Z=BOY,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 10 2 ;link 2 15 1 ;link 3 7 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is push -par by the brother . . }
#mess:   A=PUSH X=BROTHER,THE Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat is throw -ing the teacher the kite . . }
#mess:   A=THROW X=CAT,THE Y=KITE,THE Z=TEACHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 5 1 ;link 2 18 1 ;link 3 14 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is being push -par by a mother . . }
#mess:   A=PUSH X=MOTHER,A Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 10 2 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is hit -ing the ball . . }
#mess:   A=HIT X=FATHER,A Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 9 2 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is walk -ing . . }
#mess:   A=WALK Y=GIRL,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 8 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog walk -s . . }
#mess:   A=WALK Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 6 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother give -ed a cat the kite . . }
#mess:   A=GIVE X=MOTHER,THE Y=KITE,THE Z=CAT,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 10 1 ;link 2 18 1 ;link 3 5 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman is show -ing the woman the kite . . }
#mess:   A=SHOW X=WOMAN,A Y=KITE,THE Z=WOMAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 18 1 ;link 3 4 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman show -s the ball to the woman . . }
#mess:   A=SHOW X=WOMAN,A Y=BALL,THE Z=WOMAN,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 15 1 ;link 3 4 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister throw -s a mother the toy . . }
#mess:   A=THROW X=SISTER,A Y=TOY,THE Z=MOTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 17 1 ;link 3 10 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was run -ing . . }
#mess:   A=RUN Y=NURSE,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 13 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog is give -ing a boy a kite . . }
#mess:   A=GIVE X=DOG,A Y=KITE,A Z=BOY,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 18 2 ;link 3 7 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man throw -ed the stick to the nurse . . }
#mess:   A=THROW X=MAN,A Y=STICK,THE Z=NURSE,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 3 2 ;link 2 16 1 ;link 3 13 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was present -ing the stick to a woman . . }
#mess:   A=PRESENT X=SISTER,THE Y=STICK,THE Z=WOMAN,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 11 1 ;link 2 16 1 ;link 3 4 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man give -s the ball to the boy . . }
#mess:   A=GIVE X=MAN,A Y=BALL,THE Z=BOY,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 3 2 ;link 2 15 1 ;link 3 7 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse hit -ed the stick . . }
#mess:   A=HIT X=NURSE,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 13 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog push -s the kite . . }
#mess:   A=PUSH X=DOG,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy was sleep -ing . . }
#mess:   A=SLEEP Y=BOY,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 7 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman was throw -ing a ball to a mother . . }
#mess:   A=THROW X=WOMAN,A Y=BALL,A Z=MOTHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 2 ;link 2 15 2 ;link 3 10 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man is jump -ing . . }
#mess:   A=JUMP Y=MAN,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 3 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother show -ed the ball to a woman . . }
#mess:   A=SHOW X=BROTHER,A Y=BALL,THE Z=WOMAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 12 2 ;link 2 15 1 ;link 3 4 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father carry -ed the stick . . }
#mess:   A=CARRY X=FATHER,A Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is being hit -par by the mother . . }
#mess:   A=HIT X=MOTHER,THE Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother jump -s . . }
#mess:   A=JUMP Y=MOTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 10 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is hit -par by the father . . }
#mess:   A=HIT X=FATHER,THE Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 9 1 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother was kick -ing a stick . . }
#mess:   A=KICK X=MOTHER,A Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 10 2 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is hit -par by the woman . . }
#mess:   A=HIT X=WOMAN,THE Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is sleep -ing . . }
#mess:   A=SLEEP Y=GIRL,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 8 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse push -ed a stick . . }
#mess:   A=PUSH X=NURSE,A Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 13 2 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher sleep -ed . . }
#mess:   A=SLEEP Y=TEACHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 14 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was give -ing a sister a toy . . }
#mess:   A=GIVE X=DOG,THE Y=TOY,A Z=SISTER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 6 1 ;link 2 17 2 ;link 3 11 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is kick -par by a girl . . }
#mess:   A=KICK X=GIRL,A Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is sleep -ing . . }
#mess:   A=SLEEP Y=FATHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 9 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is jump -ing . . }
#mess:   A=JUMP Y=MOTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 10 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman hit -s a toy . . }
#mess:   A=HIT X=WOMAN,THE Y=TOY,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 17 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse is throw -ing the kite to the cat . . }
#mess:   A=THROW X=NURSE,A Y=KITE,THE Z=CAT,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 18 1 ;link 3 5 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy present -ed the dog the toy . . }
#mess:   A=PRESENT X=BOY,THE Y=TOY,THE Z=DOG,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 7 1 ;link 2 17 1 ;link 3 6 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse was throw -ing a father a kite . . }
#mess:   A=THROW X=NURSE,THE Y=KITE,A Z=FATHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 13 1 ;link 2 18 2 ;link 3 9 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother hit -ed a ball . . }
#mess:   A=HIT X=BROTHER,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 12 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse jump -s . . }
#mess:   A=JUMP Y=NURSE,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 13 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse was walk -ing . . }
#mess:   A=WALK Y=NURSE,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 13 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was being carry -par by a man . . }
#mess:   A=CARRY X=MAN,A Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher give -s a sister the kite . . }
#mess:   A=GIVE X=TEACHER,A Y=KITE,THE Z=SISTER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 18 1 ;link 3 11 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog throw -s the toy to a brother . . }
#mess:   A=THROW X=DOG,THE Y=TOY,THE Z=BROTHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 6 1 ;link 2 17 1 ;link 3 12 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister hit -ed the kite . . }
#mess:   A=HIT X=SISTER,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother was present -ing the girl the kite . . }
#mess:   A=PRESENT X=MOTHER,THE Y=KITE,THE Z=GIRL,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 10 1 ;link 2 18 1 ;link 3 8 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was jump -ing . . }
#mess:   A=JUMP Y=NURSE,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 13 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman throw -s the kite to the mother . . }
#mess:   A=THROW X=WOMAN,THE Y=KITE,THE Z=MOTHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 18 1 ;link 3 10 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was walk -ing . . }
#mess:   A=WALK Y=CAT,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was hit -par by a man . . }
#mess:   A=HIT X=MAN,A Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 3 2 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse sleep -ed . . }
#mess:   A=SLEEP Y=NURSE,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 13 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man was throw -ing the toy to the boy . . }
#mess:   A=THROW X=MAN,A Y=TOY,THE Z=BOY,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 3 2 ;link 2 17 1 ;link 3 7 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man is run -ing . . }
#mess:   A=RUN Y=MAN,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 3 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl show -ed a toy to a boy . . }
#mess:   A=SHOW X=GIRL,A Y=TOY,A Z=BOY,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 17 2 ;link 3 7 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being push -par by a man . . }
#mess:   A=PUSH X=MAN,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is hit -par by a dog . . }
#mess:   A=HIT X=DOG,A Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man was present -ing the father the toy . . }
#mess:   A=PRESENT X=MAN,THE Y=TOY,THE Z=FATHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 17 1 ;link 3 9 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was being carry -par by a woman . . }
#mess:   A=CARRY X=WOMAN,A Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse is give -ing the brother the toy . . }
#mess:   A=GIVE X=NURSE,THE Y=TOY,THE Z=BROTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 13 1 ;link 2 17 1 ;link 3 12 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was hit -ing the stick . . }
#mess:   A=HIT X=TEACHER,A Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 2 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl was sleep -ing . . }
#mess:   A=SLEEP Y=GIRL,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 8 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher give -ed a father a kite . . }
#mess:   A=GIVE X=TEACHER,THE Y=KITE,A Z=FATHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 18 2 ;link 3 9 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat is walk -ing . . }
#mess:   A=WALK Y=CAT,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog throw -s a man a kite . . }
#mess:   A=THROW X=DOG,THE Y=KITE,A Z=MAN,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 6 1 ;link 2 18 2 ;link 3 3 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man hit -ed the ball . . }
#mess:   A=HIT X=MAN,A Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 2 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother was give -ing the dog a stick . . }
#mess:   A=GIVE X=BROTHER,A Y=STICK,A Z=DOG,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 16 2 ;link 3 6 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is jump -ing . . }
#mess:   A=JUMP Y=GIRL,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 8 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is throw -ing the kite to the sister . . }
#mess:   A=THROW X=FATHER,A Y=KITE,THE Z=SISTER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 2 ;link 2 18 1 ;link 3 11 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother was throw -ing the teacher the stick . . }
#mess:   A=THROW X=BROTHER,THE Y=STICK,THE Z=TEACHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 16 1 ;link 3 14 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was kick -par by the nurse . . }
#mess:   A=KICK X=NURSE,THE Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother present -ed a toy to a mother . . }
#mess:   A=PRESENT X=MOTHER,A Y=TOY,A Z=MOTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 2 ;link 2 17 2 ;link 3 10 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man show -s a kite to a nurse . . }
#mess:   A=SHOW X=MAN,THE Y=KITE,A Z=NURSE,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 18 2 ;link 3 13 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was being hit -par by the cat . . }
#mess:   A=HIT X=CAT,THE Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is kick -ing a toy . . }
#mess:   A=KICK X=GIRL,THE Y=TOY,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 1 ;link 2 17 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl was walk -ing . . }
#mess:   A=WALK Y=GIRL,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 8 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father run -ed . . }
#mess:   A=RUN Y=FATHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 9 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was kick -par by the sister . . }
#mess:   A=KICK X=SISTER,THE Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 11 1 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl give -s a sister a stick . . }
#mess:   A=GIVE X=GIRL,THE Y=STICK,A Z=SISTER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 16 2 ;link 3 11 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl was hit -ing the stick . . }
#mess:   A=HIT X=GIRL,A Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 8 2 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse show -s the boy the stick . . }
#mess:   A=SHOW X=NURSE,A Y=STICK,THE Z=BOY,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 16 1 ;link 3 7 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman is throw -ing a toy to the man . . }
#mess:   A=THROW X=WOMAN,THE Y=TOY,A Z=MAN,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 17 2 ;link 3 3 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse kick -ed the kite . . }
#mess:   A=KICK X=NURSE,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl throw -ed the toy to a man . . }
#mess:   A=THROW X=GIRL,THE Y=TOY,THE Z=MAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 8 1 ;link 2 17 1 ;link 3 3 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being kick -par by a mother . . }
#mess:   A=KICK X=MOTHER,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 10 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was present -ing the ball to a brother . . }
#mess:   A=PRESENT X=SISTER,THE Y=BALL,THE Z=BROTHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 11 1 ;link 2 15 1 ;link 3 12 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite is carry -par by the teacher . . }
#mess:   A=CARRY X=TEACHER,THE Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 14 1 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother kick -ed the kite . . }
#mess:   A=KICK X=MOTHER,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 10 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother throw -s a kite to a teacher . . }
#mess:   A=THROW X=BROTHER,A Y=KITE,A Z=TEACHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 18 2 ;link 3 14 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was give -ing a stick to a cat . . }
#mess:   A=GIVE X=CAT,THE Y=STICK,A Z=CAT,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 5 1 ;link 2 16 2 ;link 3 5 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is sleep -ing . . }
#mess:   A=SLEEP Y=GIRL,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 8 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman was give -ing the toy to the brother . . }
#mess:   A=GIVE X=WOMAN,THE Y=TOY,THE Z=BROTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 1 ;link 2 17 1 ;link 3 12 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man is give -ing the stick to the mother . . }
#mess:   A=GIVE X=MAN,A Y=STICK,THE Z=MOTHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 3 2 ;link 2 16 1 ;link 3 10 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat kick -s a ball . . }
#mess:   A=KICK X=CAT,A Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 5 2 ;link 2 15 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog is show -ing a stick to a mother . . }
#mess:   A=SHOW X=DOG,A Y=STICK,A Z=MOTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 6 2 ;link 2 16 2 ;link 3 10 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother sleep -s . . }
#mess:   A=SLEEP Y=BROTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 12 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite is kick -par by the brother . . }
#mess:   A=KICK X=BROTHER,THE Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 12 1 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was kick -par by the boy . . }
#mess:   A=KICK X=BOY,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 7 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man was push -ing a kite . . }
#mess:   A=PUSH X=MAN,A Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat carry -ed a toy . . }
#mess:   A=CARRY X=CAT,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat throw -s a teacher a ball . . }
#mess:   A=THROW X=CAT,THE Y=BALL,A Z=TEACHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 5 1 ;link 2 15 2 ;link 3 14 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is kick -par by a woman . . }
#mess:   A=KICK X=WOMAN,A Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 4 2 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman push -ed the kite . . }
#mess:   A=PUSH X=WOMAN,THE Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 4 1 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister is sleep -ing . . }
#mess:   A=SLEEP Y=SISTER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 11 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother was jump -ing . . }
#mess:   A=JUMP Y=MOTHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 10 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher hit -ed a kite . . }
#mess:   A=HIT X=TEACHER,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister hit -ed the kite . . }
#mess:   A=HIT X=SISTER,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was carry -ing the kite . . }
#mess:   A=CARRY X=CAT,A Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 2 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy hit -s the kite . . }
#mess:   A=HIT X=BOY,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 7 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse carry -ed a kite . . }
#mess:   A=CARRY X=NURSE,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 13 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was hit -par by a nurse . . }
#mess:   A=HIT X=NURSE,A Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 13 2 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat carry -s a kite . . }
#mess:   A=CARRY X=CAT,A Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 2 ;link 2 18 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father throw -s the stick to a nurse . . }
#mess:   A=THROW X=FATHER,A Y=STICK,THE Z=NURSE,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 2 ;link 2 16 1 ;link 3 13 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was walk -ing . . }
#mess:   A=WALK Y=CAT,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman present -ed the teacher the ball . . }
#mess:   A=PRESENT X=WOMAN,THE Y=BALL,THE Z=TEACHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 4 1 ;link 2 15 1 ;link 3 14 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father give -ed the kite to a sister . . }
#mess:   A=GIVE X=FATHER,THE Y=KITE,THE Z=SISTER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 18 1 ;link 3 11 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother give -ed the father a kite . . }
#mess:   A=GIVE X=MOTHER,THE Y=KITE,A Z=FATHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 10 1 ;link 2 18 2 ;link 3 9 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is being push -par by a woman . . }
#mess:   A=PUSH X=WOMAN,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 4 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was hit -par by a boy . . }
#mess:   A=HIT X=BOY,A Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 7 2 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman throw -s a toy to a boy . . }
#mess:   A=THROW X=WOMAN,THE Y=TOY,A Z=BOY,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 17 2 ;link 3 7 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog is give -ing a dog the stick . . }
#mess:   A=GIVE X=DOG,A Y=STICK,THE Z=DOG,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 16 1 ;link 3 6 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father kick -ed the toy . . }
#mess:   A=KICK X=FATHER,THE Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother show -ed a teacher the ball . . }
#mess:   A=SHOW X=BROTHER,A Y=BALL,THE Z=TEACHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 2 ;link 2 15 1 ;link 3 14 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl give -s the kite to the teacher . . }
#mess:   A=GIVE X=GIRL,A Y=KITE,THE Z=TEACHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 2 ;link 2 18 1 ;link 3 14 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother run -ed . . }
#mess:   A=RUN Y=MOTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 10 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was walk -ing . . }
#mess:   A=WALK Y=DOG,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 6 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister give -ed the toy to a woman . . }
#mess:   A=GIVE X=SISTER,THE Y=TOY,THE Z=WOMAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 17 1 ;link 3 4 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother is carry -ing a kite . . }
#mess:   A=CARRY X=BROTHER,THE Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 12 1 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was present -ing a toy to a cat . . }
#mess:   A=PRESENT X=CAT,A Y=TOY,A Z=CAT,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 5 2 ;link 2 17 2 ;link 3 5 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man was walk -ing . . }
#mess:   A=WALK Y=MAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 3 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father is show -ing the ball to a man . . }
#mess:   A=SHOW X=FATHER,THE Y=BALL,THE Z=MAN,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 15 1 ;link 3 3 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog walk -ed . . }
#mess:   A=WALK Y=DOG,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 6 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is present -ing the toy to the brother . . }
#mess:   A=PRESENT X=GIRL,THE Y=TOY,THE Z=BROTHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 8 1 ;link 2 17 1 ;link 3 12 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is throw -ing a toy to a woman . . }
#mess:   A=THROW X=MOTHER,A Y=TOY,A Z=WOMAN,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 10 2 ;link 2 17 2 ;link 3 4 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat is hit -ing the stick . . }
#mess:   A=HIT X=CAT,A Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 5 2 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is being kick -par by the sister . . }
#mess:   A=KICK X=SISTER,THE Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 11 1 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother jump -s . . }
#mess:   A=JUMP Y=MOTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 10 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister show -s a kite to a boy . . }
#mess:   A=SHOW X=SISTER,A Y=KITE,A Z=BOY,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 18 2 ;link 3 7 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman show -ed a ball to the teacher . . }
#mess:   A=SHOW X=WOMAN,THE Y=BALL,A Z=TEACHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 4 1 ;link 2 15 2 ;link 3 14 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog push -ed the ball . . }
#mess:   A=PUSH X=DOG,A Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 2 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is hit -par by the cat . . }
#mess:   A=HIT X=CAT,THE Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy was give -ing the dog a kite . . }
#mess:   A=GIVE X=BOY,THE Y=KITE,A Z=DOG,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 18 2 ;link 3 6 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother give -s a stick to a teacher . . }
#mess:   A=GIVE X=MOTHER,A Y=STICK,A Z=TEACHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 10 2 ;link 2 16 2 ;link 3 14 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse show -s the cat the kite . . }
#mess:   A=SHOW X=NURSE,A Y=KITE,THE Z=CAT,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 18 1 ;link 3 5 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy sleep -ed . . }
#mess:   A=SLEEP Y=BOY,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 7 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick was being carry -par by a boy . . }
#mess:   A=CARRY X=BOY,A Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was carry -par by a father . . }
#mess:   A=CARRY X=FATHER,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher sleep -ed . . }
#mess:   A=SLEEP Y=TEACHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 14 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man run -s . . }
#mess:   A=RUN Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 3 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is being hit -par by the girl . . }
#mess:   A=HIT X=GIRL,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was walk -ing . . }
#mess:   A=WALK Y=SISTER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 11 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father present -s a brother the stick . . }
#mess:   A=PRESENT X=FATHER,A Y=STICK,THE Z=BROTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 9 2 ;link 2 16 1 ;link 3 12 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman is run -ing . . }
#mess:   A=RUN Y=WOMAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 4 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was carry -par by a brother . . }
#mess:   A=CARRY X=BROTHER,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher give -s the ball to a sister . . }
#mess:   A=GIVE X=TEACHER,A Y=BALL,THE Z=SISTER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 15 1 ;link 3 11 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was sleep -ing . . }
#mess:   A=SLEEP Y=CAT,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 5 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy present -s the sister the stick . . }
#mess:   A=PRESENT X=BOY,THE Y=STICK,THE Z=SISTER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 7 1 ;link 2 16 1 ;link 3 11 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl was jump -ing . . }
#mess:   A=JUMP Y=GIRL,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 8 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman is give -ing the dog the kite . . }
#mess:   A=GIVE X=WOMAN,A Y=KITE,THE Z=DOG,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 18 1 ;link 3 6 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher present -ed the nurse a stick . . }
#mess:   A=PRESENT X=TEACHER,A Y=STICK,A Z=NURSE,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 14 2 ;link 2 16 2 ;link 3 13 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse present -ed a toy to the man . . }
#mess:   A=PRESENT X=NURSE,THE Y=TOY,A Z=MAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 13 1 ;link 2 17 2 ;link 3 3 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog kick -ed a toy . . }
#mess:   A=KICK X=DOG,THE Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 1 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was walk -ing . . }
#mess:   A=WALK Y=SISTER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 11 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball was carry -par by a father . . }
#mess:   A=CARRY X=FATHER,A Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse was sleep -ing . . }
#mess:   A=SLEEP Y=NURSE,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 13 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was throw -ing a toy to a man . . }
#mess:   A=THROW X=TEACHER,THE Y=TOY,A Z=MAN,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 17 2 ;link 3 3 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy was show -ing a dog the kite . . }
#mess:   A=SHOW X=BOY,THE Y=KITE,THE Z=DOG,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 1 ;link 2 18 1 ;link 3 6 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother present -ed a toy to the teacher . . }
#mess:   A=PRESENT X=MOTHER,THE Y=TOY,A Z=TEACHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 1 ;link 2 17 2 ;link 3 14 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was kick -par by a father . . }
#mess:   A=KICK X=FATHER,A Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is being kick -par by the sister . . }
#mess:   A=KICK X=SISTER,THE Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 11 1 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick was hit -par by a girl . . }
#mess:   A=HIT X=GIRL,A Y=STICK,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 2 ;link 2 16 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat give -ed a ball to a brother . . }
#mess:   A=GIVE X=CAT,A Y=BALL,A Z=BROTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 5 2 ;link 2 15 2 ;link 3 12 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is push -ing the stick . . }
#mess:   A=PUSH X=MOTHER,A Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 10 2 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was throw -ing a kite to a teacher . . }
#mess:   A=THROW X=TEACHER,A Y=KITE,A Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 18 2 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher give -s a ball to the girl . . }
#mess:   A=GIVE X=TEACHER,THE Y=BALL,A Z=GIRL,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 15 2 ;link 3 8 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother present -ed a mother a ball . . }
#mess:   A=PRESENT X=MOTHER,THE Y=BALL,A Z=MOTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 10 1 ;link 2 15 2 ;link 3 10 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother show -ed the stick to the man . . }
#mess:   A=SHOW X=BROTHER,A Y=STICK,THE Z=MAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 12 2 ;link 2 16 1 ;link 3 3 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is being kick -par by a girl . . }
#mess:   A=KICK X=GIRL,A Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher push -ed the toy . . }
#mess:   A=PUSH X=TEACHER,A Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman give -s a toy to a boy . . }
#mess:   A=GIVE X=WOMAN,A Y=TOY,A Z=BOY,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 17 2 ;link 3 7 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother present -ed a sister the toy . . }
#mess:   A=PRESENT X=MOTHER,THE Y=TOY,THE Z=SISTER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 10 1 ;link 2 17 1 ;link 3 11 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl kick -ed a toy . . }
#mess:   A=KICK X=GIRL,THE Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 1 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother was walk -ing . . }
#mess:   A=WALK Y=BROTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 12 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher is present -ing a brother the stick . . }
#mess:   A=PRESENT X=TEACHER,THE Y=STICK,THE Z=BROTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 14 1 ;link 2 16 1 ;link 3 12 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is being push -par by a boy . . }
#mess:   A=PUSH X=BOY,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 7 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was walk -ing . . }
#mess:   A=WALK Y=SISTER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 11 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother carry -s the toy . . }
#mess:   A=CARRY X=MOTHER,A Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 2 ;link 2 17 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is being carry -par by the teacher . . }
#mess:   A=CARRY X=TEACHER,THE Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 14 1 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman sleep -s . . }
#mess:   A=SLEEP Y=WOMAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 4 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father hit -s the ball . . }
#mess:   A=HIT X=FATHER,THE Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 9 1 ;link 2 15 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother is throw -ing the toy to the sister . . }
#mess:   A=THROW X=MOTHER,THE Y=TOY,THE Z=SISTER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 10 1 ;link 2 17 1 ;link 3 11 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was give -ing the toy to a teacher . . }
#mess:   A=GIVE X=DOG,THE Y=TOY,THE Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 1 ;link 2 17 1 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat present -s the teacher a kite . . }
#mess:   A=PRESENT X=CAT,THE Y=KITE,A Z=TEACHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 18 2 ;link 3 14 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat is walk -ing . . }
#mess:   A=WALK Y=CAT,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman throw -ed the mother the ball . . }
#mess:   A=THROW X=WOMAN,THE Y=BALL,THE Z=MOTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 15 1 ;link 3 10 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is hit -par by a brother . . }
#mess:   A=HIT X=BROTHER,A Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 2 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat is present -ing a teacher the kite . . }
#mess:   A=PRESENT X=CAT,THE Y=KITE,THE Z=TEACHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 18 1 ;link 3 14 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse give -s a brother a toy . . }
#mess:   A=GIVE X=NURSE,THE Y=TOY,A Z=BROTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 13 1 ;link 2 17 2 ;link 3 12 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl was show -ing a kite to the cat . . }
#mess:   A=SHOW X=GIRL,THE Y=KITE,A Z=CAT,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 18 2 ;link 3 5 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was being kick -par by the boy . . }
#mess:   A=KICK X=BOY,THE Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 7 1 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is show -ing the woman the toy . . }
#mess:   A=SHOW X=GIRL,A Y=TOY,THE Z=WOMAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 17 1 ;link 3 4 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being push -par by the brother . . }
#mess:   A=PUSH X=BROTHER,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man hit -ed a toy . . }
#mess:   A=HIT X=MAN,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick was being hit -par by a sister . . }
#mess:   A=HIT X=SISTER,A Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog give -s the kite to the father . . }
#mess:   A=GIVE X=DOG,A Y=KITE,THE Z=FATHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 18 1 ;link 3 9 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was push -ing the stick . . }
#mess:   A=PUSH X=CAT,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is show -ing a nurse the toy . . }
#mess:   A=SHOW X=MAN,THE Y=TOY,THE Z=NURSE,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 17 1 ;link 3 13 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman give -ed a mother a stick . . }
#mess:   A=GIVE X=WOMAN,A Y=STICK,A Z=MOTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 16 2 ;link 3 10 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father show -ed the mother a ball . . }
#mess:   A=SHOW X=FATHER,A Y=BALL,A Z=MOTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 9 2 ;link 2 15 2 ;link 3 10 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog show -s the toy to the brother . . }
#mess:   A=SHOW X=DOG,THE Y=TOY,THE Z=BROTHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 17 1 ;link 3 12 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is throw -ing the ball to a dog . . }
#mess:   A=THROW X=MOTHER,A Y=BALL,THE Z=DOG,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 10 2 ;link 2 15 1 ;link 3 6 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat throw -s the boy the ball . . }
#mess:   A=THROW X=CAT,THE Y=BALL,THE Z=BOY,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 5 1 ;link 2 15 1 ;link 3 7 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse give -ed a toy to the girl . . }
#mess:   A=GIVE X=NURSE,A Y=TOY,A Z=GIRL,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 17 2 ;link 3 8 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother give -s a mother the kite . . }
#mess:   A=GIVE X=BROTHER,THE Y=KITE,THE Z=MOTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 1 ;link 2 18 1 ;link 3 10 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was push -par by the dog . . }
#mess:   A=PUSH X=DOG,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy is sleep -ing . . }
#mess:   A=SLEEP Y=BOY,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 7 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister is show -ing a ball to a man . . }
#mess:   A=SHOW X=SISTER,THE Y=BALL,A Z=MAN,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 1 ;link 2 15 2 ;link 3 3 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father was show -ing the man a kite . . }
#mess:   A=SHOW X=FATHER,A Y=KITE,A Z=MAN,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 9 2 ;link 2 18 2 ;link 3 3 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl was present -ing the ball to the cat . . }
#mess:   A=PRESENT X=GIRL,A Y=BALL,THE Z=CAT,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 8 2 ;link 2 15 1 ;link 3 5 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was kick -ing a stick . . }
#mess:   A=KICK X=FATHER,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was run -ing . . }
#mess:   A=RUN Y=DOG,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 6 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy carry -s the ball . . }
#mess:   A=CARRY X=BOY,THE Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 7 1 ;link 2 15 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher show -ed a sister a stick . . }
#mess:   A=SHOW X=TEACHER,THE Y=STICK,A Z=SISTER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 14 1 ;link 2 16 2 ;link 3 11 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is kick -ing the ball . . }
#mess:   A=KICK X=GIRL,A Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl run -s . . }
#mess:   A=RUN Y=GIRL,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 8 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher give -s the woman a toy . . }
#mess:   A=GIVE X=TEACHER,THE Y=TOY,A Z=WOMAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 17 2 ;link 3 4 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball was hit -par by the dog . . }
#mess:   A=HIT X=DOG,THE Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was run -ing . . }
#mess:   A=RUN Y=FATHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 9 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother run -s . . }
#mess:   A=RUN Y=MOTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 10 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy is push -ing the kite . . }
#mess:   A=PUSH X=BOY,THE Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 7 1 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy present -ed the man the stick . . }
#mess:   A=PRESENT X=BOY,A Y=STICK,THE Z=MAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 7 2 ;link 2 16 1 ;link 3 3 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog throw -s a boy a ball . . }
#mess:   A=THROW X=DOG,THE Y=BALL,A Z=BOY,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 6 1 ;link 2 15 2 ;link 3 7 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog was throw -ing the teacher a toy . . }
#mess:   A=THROW X=DOG,A Y=TOY,A Z=TEACHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 6 2 ;link 2 17 2 ;link 3 14 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher present -s a ball to the man . . }
#mess:   A=PRESENT X=TEACHER,THE Y=BALL,A Z=MAN,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 14 1 ;link 2 15 2 ;link 3 3 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was show -ing a ball to the brother . . }
#mess:   A=SHOW X=TEACHER,A Y=BALL,A Z=BROTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 14 2 ;link 2 15 2 ;link 3 12 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man was sleep -ing . . }
#mess:   A=SLEEP Y=MAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 3 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother kick -s a kite . . }
#mess:   A=KICK X=BROTHER,A Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 2 ;link 2 18 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher hit -ed the toy . . }
#mess:   A=HIT X=TEACHER,THE Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy present -s a boy the kite . . }
#mess:   A=PRESENT X=BOY,A Y=KITE,THE Z=BOY,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 7 2 ;link 2 18 1 ;link 3 7 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl was give -ing the kite to a teacher . . }
#mess:   A=GIVE X=GIRL,A Y=KITE,THE Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 2 ;link 2 18 1 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is show -ing the girl the stick . . }
#mess:   A=SHOW X=MOTHER,A Y=STICK,THE Z=GIRL,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 2 ;link 2 16 1 ;link 3 8 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was kick -ing the toy . . }
#mess:   A=KICK X=DOG,THE Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 1 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman throw -ed a kite to the boy . . }
#mess:   A=THROW X=WOMAN,THE Y=KITE,A Z=BOY,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 18 2 ;link 3 7 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father present -s the stick to the boy . . }
#mess:   A=PRESENT X=FATHER,THE Y=STICK,THE Z=BOY,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 9 1 ;link 2 16 1 ;link 3 7 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is kick -ing the toy . . }
#mess:   A=KICK X=BOY,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 7 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher give -s the sister a toy . . }
#mess:   A=GIVE X=TEACHER,A Y=TOY,A Z=SISTER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 17 2 ;link 3 11 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was hit -par by a woman . . }
#mess:   A=HIT X=WOMAN,A Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog is hit -ing the stick . . }
#mess:   A=HIT X=DOG,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was kick -par by a nurse . . }
#mess:   A=KICK X=NURSE,A Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman is show -ing the stick to a cat . . }
#mess:   A=SHOW X=WOMAN,A Y=STICK,THE Z=CAT,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 16 1 ;link 3 5 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was push -par by the man . . }
#mess:   A=PUSH X=MAN,THE Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was being hit -par by a nurse . . }
#mess:   A=HIT X=NURSE,A Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 13 2 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher throw -s a mother the stick . . }
#mess:   A=THROW X=TEACHER,A Y=STICK,THE Z=MOTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 16 1 ;link 3 10 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse is hit -ing the ball . . }
#mess:   A=HIT X=NURSE,THE Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 13 1 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher push -ed the kite . . }
#mess:   A=PUSH X=TEACHER,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher is give -ing a man a ball . . }
#mess:   A=GIVE X=TEACHER,A Y=BALL,A Z=MAN,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 15 2 ;link 3 3 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was being hit -par by the mother . . }
#mess:   A=HIT X=MOTHER,THE Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is being kick -par by a boy . . }
#mess:   A=KICK X=BOY,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 7 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is being carry -par by the man . . }
#mess:   A=CARRY X=MAN,THE Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 1 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister was show -ing a toy to a woman . . }
#mess:   A=SHOW X=SISTER,A Y=TOY,A Z=WOMAN,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 17 2 ;link 3 4 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat push -s the toy . . }
#mess:   A=PUSH X=CAT,A Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 17 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl show -ed the woman a stick . . }
#mess:   A=SHOW X=GIRL,A Y=STICK,A Z=WOMAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 16 2 ;link 3 4 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother run -s . . }
#mess:   A=RUN Y=BROTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 12 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is push -par by the man . . }
#mess:   A=PUSH X=MAN,THE Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being kick -par by a nurse . . }
#mess:   A=KICK X=NURSE,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl walk -ed . . }
#mess:   A=WALK Y=GIRL,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 8 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl kick -ed a ball . . }
#mess:   A=KICK X=GIRL,THE Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 1 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was show -ing the kite to a father . . }
#mess:   A=SHOW X=TEACHER,A Y=KITE,THE Z=FATHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 14 2 ;link 2 18 1 ;link 3 9 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl push -s a ball . . }
#mess:   A=PUSH X=GIRL,A Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 8 2 ;link 2 15 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father is jump -ing . . }
#mess:   A=JUMP Y=FATHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 9 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister jump -s . . }
#mess:   A=JUMP Y=SISTER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 11 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is jump -ing . . }
#mess:   A=JUMP Y=FATHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 9 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was carry -ing the kite . . }
#mess:   A=CARRY X=SISTER,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 11 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball was kick -par by the man . . }
#mess:   A=KICK X=MAN,THE Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 3 1 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother is give -ing the toy to a man . . }
#mess:   A=GIVE X=MOTHER,THE Y=TOY,THE Z=MAN,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 10 1 ;link 2 17 1 ;link 3 3 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher show -ed the toy to the man . . }
#mess:   A=SHOW X=TEACHER,THE Y=TOY,THE Z=MAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 14 1 ;link 2 17 1 ;link 3 3 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was kick -par by the cat . . }
#mess:   A=KICK X=CAT,THE Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 5 1 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog hit -ed the ball . . }
#mess:   A=HIT X=DOG,A Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse is push -ing the ball . . }
#mess:   A=PUSH X=NURSE,THE Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 13 1 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother hit -ed a ball . . }
#mess:   A=HIT X=MOTHER,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 10 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is carry -par by the sister . . }
#mess:   A=CARRY X=SISTER,THE Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 11 1 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher jump -s . . }
#mess:   A=JUMP Y=TEACHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 14 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister kick -ed the stick . . }
#mess:   A=KICK X=SISTER,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 11 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy is push -ing the toy . . }
#mess:   A=PUSH X=BOY,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 7 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman present -s the woman the ball . . }
#mess:   A=PRESENT X=WOMAN,A Y=BALL,THE Z=WOMAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 4 2 ;link 2 15 1 ;link 3 4 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is push -par by a teacher . . }
#mess:   A=PUSH X=TEACHER,A Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was sleep -ing . . }
#mess:   A=SLEEP Y=CAT,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 5 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog is give -ing a ball to the teacher . . }
#mess:   A=GIVE X=DOG,A Y=BALL,A Z=TEACHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 15 2 ;link 3 14 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is being kick -par by a brother . . }
#mess:   A=KICK X=BROTHER,A Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 12 2 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother is walk -ing . . }
#mess:   A=WALK Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father kick -s a toy . . }
#mess:   A=KICK X=FATHER,A Y=TOY,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 17 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher present -s the mother the toy . . }
#mess:   A=PRESENT X=TEACHER,THE Y=TOY,THE Z=MOTHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 14 1 ;link 2 17 1 ;link 3 10 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother present -ed a boy the stick . . }
#mess:   A=PRESENT X=BROTHER,A Y=STICK,THE Z=BOY,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 16 1 ;link 3 7 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher sleep -s . . }
#mess:   A=SLEEP Y=TEACHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 14 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is being push -par by a cat . . }
#mess:   A=PUSH X=CAT,A Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse sleep -ed . . }
#mess:   A=SLEEP Y=NURSE,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 13 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is hit -par by a father . . }
#mess:   A=HIT X=FATHER,A Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 9 2 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is carry -ing a ball . . }
#mess:   A=CARRY X=GIRL,A Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister throw -s a mother a kite . . }
#mess:   A=THROW X=SISTER,THE Y=KITE,A Z=MOTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 1 ;link 2 18 2 ;link 3 10 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father throw -ed a toy to the teacher . . }
#mess:   A=THROW X=FATHER,THE Y=TOY,A Z=TEACHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 1 ;link 2 17 2 ;link 3 14 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman throw -s the nurse the stick . . }
#mess:   A=THROW X=WOMAN,THE Y=STICK,THE Z=NURSE,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 16 1 ;link 3 13 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother show -s a mother a stick . . }
#mess:   A=SHOW X=BROTHER,THE Y=STICK,A Z=MOTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 16 2 ;link 3 10 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man sleep -s . . }
#mess:   A=SLEEP Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 3 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman carry -ed the ball . . }
#mess:   A=CARRY X=WOMAN,A Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy is give -ing a girl the stick . . }
#mess:   A=GIVE X=BOY,THE Y=STICK,THE Z=GIRL,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 16 1 ;link 3 8 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog was kick -ing a stick . . }
#mess:   A=KICK X=DOG,A Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 2 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father push -ed a ball . . }
#mess:   A=PUSH X=FATHER,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 9 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being push -par by a cat . . }
#mess:   A=PUSH X=CAT,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is push -par by the teacher . . }
#mess:   A=PUSH X=TEACHER,THE Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 14 1 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat was push -ing the ball . . }
#mess:   A=PUSH X=CAT,THE Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball was being kick -par by a boy . . }
#mess:   A=KICK X=BOY,A Y=BALL,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 7 2 ;link 2 15 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother is throw -ing the toy to the boy . . }
#mess:   A=THROW X=BROTHER,A Y=TOY,THE Z=BOY,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 17 1 ;link 3 7 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister push -s the stick . . }
#mess:   A=PUSH X=SISTER,THE Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 1 ;link 2 16 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was run -ing . . }
#mess:   A=RUN Y=DOG,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 6 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy was sleep -ing . . }
#mess:   A=SLEEP Y=BOY,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 7 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is push -par by the sister . . }
#mess:   A=PUSH X=SISTER,THE Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 11 1 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being carry -par by a brother . . }
#mess:   A=CARRY X=BROTHER,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat is give -ing the nurse the stick . . }
#mess:   A=GIVE X=CAT,THE Y=STICK,THE Z=NURSE,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 1 ;link 2 16 1 ;link 3 13 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was kick -ing a ball . . }
#mess:   A=KICK X=NURSE,A Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother carry -ed a kite . . }
#mess:   A=CARRY X=BROTHER,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 12 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse walk -s . . }
#mess:   A=WALK Y=NURSE,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 13 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was kick -par by a teacher . . }
#mess:   A=KICK X=TEACHER,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 14 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man was carry -ing a ball . . }
#mess:   A=CARRY X=MAN,THE Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 3 1 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy give -s a boy a kite . . }
#mess:   A=GIVE X=BOY,THE Y=KITE,A Z=BOY,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 18 2 ;link 3 7 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother hit -s the kite . . }
#mess:   A=HIT X=MOTHER,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 10 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is carry -par by a dog . . }
#mess:   A=CARRY X=DOG,A Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 6 2 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is present -ing the toy to a nurse . . }
#mess:   A=PRESENT X=MAN,THE Y=TOY,THE Z=NURSE,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 17 1 ;link 3 13 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is throw -ing the kite to a sister . . }
#mess:   A=THROW X=MOTHER,A Y=KITE,THE Z=SISTER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 10 2 ;link 2 18 1 ;link 3 11 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father jump -ed . . }
#mess:   A=JUMP Y=FATHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 9 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was run -ing . . }
#mess:   A=RUN Y=BOY,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 7 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher was give -ing the mother a ball . . }
#mess:   A=GIVE X=TEACHER,THE Y=BALL,A Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 15 2 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother carry -ed the ball . . }
#mess:   A=CARRY X=MOTHER,THE Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 1 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father show -s a kite to a teacher . . }
#mess:   A=SHOW X=FATHER,A Y=KITE,A Z=TEACHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 9 2 ;link 2 18 2 ;link 3 14 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman is run -ing . . }
#mess:   A=RUN Y=WOMAN,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 4 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister was throw -ing the stick to the teacher . . }
#mess:   A=THROW X=SISTER,A Y=STICK,THE Z=TEACHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 16 1 ;link 3 14 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy was run -ing . . }
#mess:   A=RUN Y=BOY,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 7 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy was show -ing the ball to a teacher . . }
#mess:   A=SHOW X=BOY,THE Y=BALL,THE Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 7 1 ;link 2 15 1 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother was run -ing . . }
#mess:   A=RUN Y=MOTHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 10 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is walk -ing . . }
#mess:   A=WALK Y=GIRL,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 8 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was kick -par by the teacher . . }
#mess:   A=KICK X=TEACHER,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog is walk -ing . . }
#mess:   A=WALK Y=DOG,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 6 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher give -ed the boy a kite . . }
#mess:   A=GIVE X=TEACHER,THE Y=KITE,A Z=BOY,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 18 2 ;link 3 7 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man was run -ing . . }
#mess:   A=RUN Y=MAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 3 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother show -ed the cat the stick . . }
#mess:   A=SHOW X=MOTHER,THE Y=STICK,THE Z=CAT,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 1 ;link 2 16 1 ;link 3 5 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl present -s a cat a stick . . }
#mess:   A=PRESENT X=GIRL,A Y=STICK,A Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 8 2 ;link 2 16 2 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother show -ed a toy to a boy . . }
#mess:   A=SHOW X=MOTHER,A Y=TOY,A Z=BOY,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 10 2 ;link 2 17 2 ;link 3 7 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse kick -ed a toy . . }
#mess:   A=KICK X=NURSE,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite is being push -par by a father . . }
#mess:   A=PUSH X=FATHER,A Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 9 2 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is hit -par by the brother . . }
#mess:   A=HIT X=BROTHER,THE Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is kick -par by the woman . . }
#mess:   A=KICK X=WOMAN,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 4 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy give -ed a kite to a brother . . }
#mess:   A=GIVE X=BOY,A Y=KITE,A Z=BROTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 2 ;link 2 18 2 ;link 3 12 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl was push -ing a kite . . }
#mess:   A=PUSH X=GIRL,THE Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 8 1 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was push -ing the stick . . }
#mess:   A=PUSH X=CAT,A Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother is show -ing a boy a stick . . }
#mess:   A=SHOW X=BROTHER,THE Y=STICK,A Z=BOY,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 16 2 ;link 3 7 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse show -s a dog a ball . . }
#mess:   A=SHOW X=NURSE,A Y=BALL,A Z=DOG,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 15 2 ;link 3 6 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother jump -s . . }
#mess:   A=JUMP Y=MOTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 10 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was being push -par by a boy . . }
#mess:   A=PUSH X=BOY,A Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 7 2 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman walk -ed . . }
#mess:   A=WALK Y=WOMAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 4 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is being push -par by a father . . }
#mess:   A=PUSH X=FATHER,A Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 9 2 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is being carry -par by a girl . . }
#mess:   A=CARRY X=GIRL,A Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is give -ing a cat the toy . . }
#mess:   A=GIVE X=GIRL,A Y=TOY,THE Z=CAT,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 8 2 ;link 2 17 1 ;link 3 5 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse present -s the kite to a cat . . }
#mess:   A=PRESENT X=NURSE,A Y=KITE,THE Z=CAT,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 13 2 ;link 2 18 1 ;link 3 5 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is being carry -par by the girl . . }
#mess:   A=CARRY X=GIRL,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother run -s . . }
#mess:   A=RUN Y=BROTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 12 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was kick -par by the nurse . . }
#mess:   A=KICK X=NURSE,THE Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was carry -par by a nurse . . }
#mess:   A=CARRY X=NURSE,A Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 13 2 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat is show -ing a girl a kite . . }
#mess:   A=SHOW X=CAT,A Y=KITE,A Z=GIRL,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 18 2 ;link 3 8 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is kick -par by a cat . . }
#mess:   A=KICK X=CAT,A Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 5 2 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy show -ed the mother the stick . . }
#mess:   A=SHOW X=BOY,A Y=STICK,THE Z=MOTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 2 ;link 2 16 1 ;link 3 10 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father is give -ing a sister a kite . . }
#mess:   A=GIVE X=FATHER,THE Y=KITE,A Z=SISTER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 18 2 ;link 3 11 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is sleep -ing . . }
#mess:   A=SLEEP Y=FATHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 9 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher hit -s the kite . . }
#mess:   A=HIT X=TEACHER,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl run -ed . . }
#mess:   A=RUN Y=GIRL,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 8 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is show -ing a stick to a dog . . }
#mess:   A=SHOW X=GIRL,A Y=STICK,A Z=DOG,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 16 2 ;link 3 6 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister is throw -ing the girl the kite . . }
#mess:   A=THROW X=SISTER,A Y=KITE,THE Z=GIRL,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 18 1 ;link 3 8 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is kick -par by a boy . . }
#mess:   A=KICK X=BOY,A Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 7 2 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball is hit -par by a dog . . }
#mess:   A=HIT X=DOG,A Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher throw -ed a father the ball . . }
#mess:   A=THROW X=TEACHER,THE Y=BALL,THE Z=FATHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 15 1 ;link 3 9 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was give -ing a boy the ball . . }
#mess:   A=GIVE X=SISTER,THE Y=BALL,THE Z=BOY,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 15 1 ;link 3 7 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man push -s the stick . . }
#mess:   A=PUSH X=MAN,THE Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 16 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog is show -ing a girl the stick . . }
#mess:   A=SHOW X=DOG,THE Y=STICK,THE Z=GIRL,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 16 1 ;link 3 8 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was carry -par by the teacher . . }
#mess:   A=CARRY X=TEACHER,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 14 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is being hit -par by the teacher . . }
#mess:   A=HIT X=TEACHER,THE Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse was run -ing . . }
#mess:   A=RUN Y=NURSE,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 13 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother is carry -ing the ball . . }
#mess:   A=CARRY X=MOTHER,THE Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 1 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl is walk -ing . . }
#mess:   A=WALK Y=GIRL,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 8 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother was throw -ing a teacher the ball . . }
#mess:   A=THROW X=MOTHER,A Y=BALL,THE Z=TEACHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 10 2 ;link 2 15 1 ;link 3 14 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite is kick -par by the woman . . }
#mess:   A=KICK X=WOMAN,THE Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 4 1 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister is give -ing a stick to the sister . . }
#mess:   A=GIVE X=SISTER,THE Y=STICK,A Z=SISTER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 16 2 ;link 3 11 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman was give -ing a toy to the teacher . . }
#mess:   A=GIVE X=WOMAN,A Y=TOY,A Z=TEACHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 17 2 ;link 3 14 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy carry -s the kite . . }
#mess:   A=CARRY X=BOY,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog carry -ed the stick . . }
#mess:   A=CARRY X=DOG,A Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 2 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is being push -par by a mother . . }
#mess:   A=PUSH X=MOTHER,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 10 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 40
t:{word 1.0} 40
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;