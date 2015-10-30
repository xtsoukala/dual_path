
#roles: A X Y Z B C
#semantics: :DET THE A :NOUN MAN WOMAN CAT DOG BOY GIRL FATHER MOTHER SISTER BROTHER NURSE TEACHER BALL STICK TOY KITE :VERB SLEEP JUMP WALK RUN PUSH HIT KICK CARRY GIVE THROW SHOW PRESENT GLORP :AUX IS ARE WAS WERE :BY BY :THAT THAT :TO TO :PER . :PAR -PAR :ING -ING :SS -S :ED -ED :BEING BEING
#lexicon: :det the a :noun man woman cat dog boy girl father mother sister brother nurse teacher ball stick toy kite :verb sleep jump walk run push hit kick carry give throw show present glorp :aux is are was were :by by :that that :to to :per . :par -par :ing -ing :ss -s :ed -ed :being being
#eventsemantics: PRES PAST SIMP PROG XX YY ZZ CC DD
name:{ the toy is carry -par by the man . . }
#mess:   A=CARRY X=MAN,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
t:{word 1.0} 1
t:{word 1.0} 17
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the man carry -s the ball . . }
#mess:   A=CARRY X=MAN,THE Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 3 1 ;link 2 15 1 ;tlink 0 2 4 5;} 
8
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 26
t:{word 1.0} 42
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the girl give -ed a man a ball . . }
#mess:   A=GIVE X=GIRL,THE Y=BALL,A Z=MAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 15 2 ;link 3 3 2 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 1
t:{word 1.0} 8
t:{word 1.0} 27
t:{word 1.0} 43
t:{word 1.0} 2
t:{word 1.0} 3
t:{word 1.0} 2
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the cat is present -ing a toy to a teacher . . }
#mess:   A=PRESENT X=CAT,THE Y=TOY,A Z=TEACHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 17 2 ;link 3 14 2 ;tlink 0 3 4 5 -1 6;} 
12
t:{word 1.0} 1
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 30
t:{word 1.0} 41
t:{word 1.0} 2
t:{word 1.0} 17
t:{word 1.0} 38
t:{word 1.0} 2
t:{word 1.0} 14
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the woman throw -s a stick to the girl . . }
#mess:   A=THROW X=WOMAN,THE Y=STICK,A Z=GIRL,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 16 2 ;link 3 8 1 ;tlink 0 2 4 5 -1 6;} 
11
t:{word 1.0} 1
t:{word 1.0} 4
t:{word 1.0} 28
t:{word 1.0} 42
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 38
t:{word 1.0} 1
t:{word 1.0} 8
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a girl push -ed a kite . . }
#mess:   A=PUSH X=GIRL,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 8 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 2
t:{word 1.0} 8
t:{word 1.0} 23
t:{word 1.0} 43
t:{word 1.0} 2
t:{word 1.0} 18
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the ball was being push -par by the brother . . }
#mess:   A=PUSH X=BROTHER,THE Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
11
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 44
t:{word 1.0} 23
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 12
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the woman was carry -ing the ball . . }
#mess:   A=CARRY X=WOMAN,THE Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 4 1 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 1
t:{word 1.0} 4
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the brother carry -s the kite . . }
#mess:   A=CARRY X=BROTHER,THE Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 12 1 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
t:{word 1.0} 1
t:{word 1.0} 12
t:{word 1.0} 26
t:{word 1.0} 42
t:{word 1.0} 1
t:{word 1.0} 18
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a dog was carry -ing the ball . . }
#mess:   A=CARRY X=DOG,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 2
t:{word 1.0} 6
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the father is give -ing a kite to a brother . . }
#mess:   A=GIVE X=FATHER,THE Y=KITE,A Z=BROTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 18 2 ;link 3 12 2 ;tlink 0 3 4 5 -1 6;} 
12
t:{word 1.0} 1
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 27
t:{word 1.0} 41
t:{word 1.0} 2
t:{word 1.0} 18
t:{word 1.0} 38
t:{word 1.0} 2
t:{word 1.0} 12
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a sister is sleep -ing . . }
#mess:   A=SLEEP Y=SISTER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 11 2 ;tlink 0 3 5;} 
7
t:{word 1.0} 2
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a teacher give -ed a ball to the woman . . }
#mess:   A=GIVE X=TEACHER,A Y=BALL,A Z=WOMAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 15 2 ;link 3 4 1 ;tlink 1 2 4 5 -1 6;} 
11
t:{word 1.0} 2
t:{word 1.0} 14
t:{word 1.0} 27
t:{word 1.0} 43
t:{word 1.0} 2
t:{word 1.0} 15
t:{word 1.0} 38
t:{word 1.0} 1
t:{word 1.0} 4
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being hit -par by the sister . . }
#mess:   A=HIT X=SISTER,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
t:{word 1.0} 2
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 44
t:{word 1.0} 24
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 11
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the kite was carry -par by a dog . . }
#mess:   A=CARRY X=DOG,A Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 6 2 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
10
t:{word 1.0} 1
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 6
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a cat carry -s a ball . . }
#mess:   A=CARRY X=CAT,A Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 2 ;link 2 15 2 ;tlink 0 2 4 5;} 
8
t:{word 1.0} 2
t:{word 1.0} 5
t:{word 1.0} 26
t:{word 1.0} 42
t:{word 1.0} 2
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a girl is kick -ing a kite . . }
#mess:   A=KICK X=GIRL,A Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
t:{word 1.0} 2
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 41
t:{word 1.0} 2
t:{word 1.0} 18
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the girl is run -ing . . }
#mess:   A=RUN Y=GIRL,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 8 1 ;tlink 0 3 5;} 
7
t:{word 1.0} 1
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a father walk -ed . . }
#mess:   A=WALK Y=FATHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 9 2 ;tlink 1 2 5;} 
6
t:{word 1.0} 2
t:{word 1.0} 9
t:{word 1.0} 21
t:{word 1.0} 43
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a boy is run -ing . . }
#mess:   A=RUN Y=BOY,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 7 2 ;tlink 0 3 5;} 
7
t:{word 1.0} 2
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the girl sleep -s . . }
#mess:   A=SLEEP Y=GIRL,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 8 1 ;tlink 0 2 5;} 
6
t:{word 1.0} 1
t:{word 1.0} 8
t:{word 1.0} 19
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the nurse sleep -s . . }
#mess:   A=SLEEP Y=NURSE,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 13 1 ;tlink 0 2 5;} 
6
t:{word 1.0} 1
t:{word 1.0} 13
t:{word 1.0} 19
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a man carry -ed a toy . . }
#mess:   A=CARRY X=MAN,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 2
t:{word 1.0} 3
t:{word 1.0} 26
t:{word 1.0} 43
t:{word 1.0} 2
t:{word 1.0} 17
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the cat show -ed a toy to a man . . }
#mess:   A=SHOW X=CAT,THE Y=TOY,A Z=MAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 17 2 ;link 3 3 2 ;tlink 1 2 4 5 -1 6;} 
11
t:{word 1.0} 1
t:{word 1.0} 5
t:{word 1.0} 29
t:{word 1.0} 43
t:{word 1.0} 2
t:{word 1.0} 17
t:{word 1.0} 38
t:{word 1.0} 2
t:{word 1.0} 3
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a sister walk -s . . }
#mess:   A=WALK Y=SISTER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 11 2 ;tlink 0 2 5;} 
6
t:{word 1.0} 2
t:{word 1.0} 11
t:{word 1.0} 21
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the father show -ed a girl the stick . . }
#mess:   A=SHOW X=FATHER,THE Y=STICK,THE Z=GIRL,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 16 1 ;link 3 8 2 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 1
t:{word 1.0} 9
t:{word 1.0} 29
t:{word 1.0} 43
t:{word 1.0} 2
t:{word 1.0} 8
t:{word 1.0} 1
t:{word 1.0} 16
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the man was push -ing the stick . . }
#mess:   A=PUSH X=MAN,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 16
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a dog walk -ed . . }
#mess:   A=WALK Y=DOG,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 6 2 ;tlink 1 2 5;} 
6
t:{word 1.0} 2
t:{word 1.0} 6
t:{word 1.0} 21
t:{word 1.0} 43
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a stick was being push -par by a nurse . . }
#mess:   A=PUSH X=NURSE,A Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 13 2 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
11
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 44
t:{word 1.0} 23
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 13
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a mother was carry -ing the stick . . }
#mess:   A=CARRY X=MOTHER,A Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 2 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 2
t:{word 1.0} 10
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 16
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the girl was carry -ing the ball . . }
#mess:   A=CARRY X=GIRL,THE Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 1
t:{word 1.0} 8
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the father run -s . . }
#mess:   A=RUN Y=FATHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 9 1 ;tlink 0 2 5;} 
6
t:{word 1.0} 1
t:{word 1.0} 9
t:{word 1.0} 22
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the ball is being push -par by a cat . . }
#mess:   A=PUSH X=CAT,A Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 32
t:{word 1.0} 44
t:{word 1.0} 23
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 5
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the woman was walk -ing . . }
#mess:   A=WALK Y=WOMAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 4 1 ;tlink 1 3 5;} 
7
t:{word 1.0} 1
t:{word 1.0} 4
t:{word 1.0} 34
t:{word 1.0} 21
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a father is run -ing . . }
#mess:   A=RUN Y=FATHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 9 2 ;tlink 0 3 5;} 
7
t:{word 1.0} 2
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a cat give -s a toy to the mother . . }
#mess:   A=GIVE X=CAT,A Y=TOY,A Z=MOTHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 5 2 ;link 2 17 2 ;link 3 10 1 ;tlink 0 2 4 5 -1 6;} 
11
t:{word 1.0} 2
t:{word 1.0} 5
t:{word 1.0} 27
t:{word 1.0} 42
t:{word 1.0} 2
t:{word 1.0} 17
t:{word 1.0} 38
t:{word 1.0} 1
t:{word 1.0} 10
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a father was give -ing the cat a stick . . }
#mess:   A=GIVE X=FATHER,A Y=STICK,A Z=CAT,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 16 2 ;link 3 5 1 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 2
t:{word 1.0} 9
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 5
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the man present -ed a stick to a cat . . }
#mess:   A=PRESENT X=MAN,THE Y=STICK,A Z=CAT,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 16 2 ;link 3 5 2 ;tlink 1 2 4 5 -1 6;} 
11
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 30
t:{word 1.0} 43
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 38
t:{word 1.0} 2
t:{word 1.0} 5
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a kite was hit -par by the cat . . }
#mess:   A=HIT X=CAT,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
t:{word 1.0} 2
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 5
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a brother is carry -ing the ball . . }
#mess:   A=CARRY X=BROTHER,A Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
t:{word 1.0} 2
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the father was sleep -ing . . }
#mess:   A=SLEEP Y=FATHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 9 1 ;tlink 1 3 5;} 
7
t:{word 1.0} 1
t:{word 1.0} 9
t:{word 1.0} 34
t:{word 1.0} 19
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a toy is push -par by a dog . . }
#mess:   A=PUSH X=DOG,A Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 2 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
10
t:{word 1.0} 2
t:{word 1.0} 17
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 6
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the cat was walk -ing . . }
#mess:   A=WALK Y=CAT,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 1 ;tlink 1 3 5;} 
7
t:{word 1.0} 1
t:{word 1.0} 5
t:{word 1.0} 34
t:{word 1.0} 21
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the girl jump -ed . . }
#mess:   A=JUMP Y=GIRL,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 8 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 1
t:{word 1.0} 8
t:{word 1.0} 20
t:{word 1.0} 43
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the woman was run -ing . . }
#mess:   A=RUN Y=WOMAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 4 1 ;tlink 1 3 5;} 
7
t:{word 1.0} 1
t:{word 1.0} 4
t:{word 1.0} 34
t:{word 1.0} 22
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a cat give -s a stick to the man . . }
#mess:   A=GIVE X=CAT,A Y=STICK,A Z=MAN,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 5 2 ;link 2 16 2 ;link 3 3 1 ;tlink 0 2 4 5 -1 6;} 
11
t:{word 1.0} 2
t:{word 1.0} 5
t:{word 1.0} 27
t:{word 1.0} 42
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 38
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a stick is being carry -par by a man . . }
#mess:   A=CARRY X=MAN,A Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
11
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 32
t:{word 1.0} 44
t:{word 1.0} 26
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 3
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a brother hit -ed the kite . . }
#mess:   A=HIT X=BROTHER,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 12 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 2
t:{word 1.0} 12
t:{word 1.0} 24
t:{word 1.0} 43
t:{word 1.0} 1
t:{word 1.0} 18
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a stick was being push -par by the mother . . }
#mess:   A=PUSH X=MOTHER,THE Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 10 1 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
11
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 44
t:{word 1.0} 23
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 10
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a sister was give -ing the nurse a ball . . }
#mess:   A=GIVE X=SISTER,A Y=BALL,A Z=NURSE,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 15 2 ;link 3 13 1 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 2
t:{word 1.0} 11
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 13
t:{word 1.0} 2
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the father was present -ing the boy a ball . . }
#mess:   A=PRESENT X=FATHER,THE Y=BALL,A Z=BOY,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 9 1 ;link 2 15 2 ;link 3 7 1 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 1
t:{word 1.0} 9
t:{word 1.0} 34
t:{word 1.0} 30
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 7
t:{word 1.0} 2
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a man present -s a cat a ball . . }
#mess:   A=PRESENT X=MAN,A Y=BALL,A Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 3 2 ;link 2 15 2 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
10
t:{word 1.0} 2
t:{word 1.0} 3
t:{word 1.0} 30
t:{word 1.0} 42
t:{word 1.0} 2
t:{word 1.0} 5
t:{word 1.0} 2
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the sister was kick -ing the kite . . }
#mess:   A=KICK X=SISTER,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 11 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 1
t:{word 1.0} 11
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 18
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the ball is being hit -par by the brother . . }
#mess:   A=HIT X=BROTHER,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 32
t:{word 1.0} 44
t:{word 1.0} 24
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 12
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a cat throw -s the toy to the father . . }
#mess:   A=THROW X=CAT,A Y=TOY,THE Z=FATHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 5 2 ;link 2 17 1 ;link 3 9 1 ;tlink 0 2 4 5 -1 6;} 
11
t:{word 1.0} 2
t:{word 1.0} 5
t:{word 1.0} 28
t:{word 1.0} 42
t:{word 1.0} 1
t:{word 1.0} 17
t:{word 1.0} 38
t:{word 1.0} 1
t:{word 1.0} 9
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a stick was hit -par by the woman . . }
#mess:   A=HIT X=WOMAN,THE Y=STICK,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 16 2 ;tlink 1 2 5 -1 4;} 
10
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 4
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the man run -ed . . }
#mess:   A=RUN Y=MAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 3 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 22
t:{word 1.0} 43
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the dog jump -ed . . }
#mess:   A=JUMP Y=DOG,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 6 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 1
t:{word 1.0} 6
t:{word 1.0} 20
t:{word 1.0} 43
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a girl was present -ing the girl a kite . . }
#mess:   A=PRESENT X=GIRL,A Y=KITE,A Z=GIRL,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 8 2 ;link 2 18 2 ;link 3 8 1 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 2
t:{word 1.0} 8
t:{word 1.0} 34
t:{word 1.0} 30
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 8
t:{word 1.0} 2
t:{word 1.0} 18
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the woman walk -s . . }
#mess:   A=WALK Y=WOMAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 4 1 ;tlink 0 2 5;} 
6
t:{word 1.0} 1
t:{word 1.0} 4
t:{word 1.0} 21
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a kite was hit -par by a sister . . }
#mess:   A=HIT X=SISTER,A Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
t:{word 1.0} 2
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 11
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a ball is being carry -par by a girl . . }
#mess:   A=CARRY X=GIRL,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
t:{word 1.0} 2
t:{word 1.0} 15
t:{word 1.0} 32
t:{word 1.0} 44
t:{word 1.0} 26
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 8
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a dog present -s the stick to the teacher . . }
#mess:   A=PRESENT X=DOG,A Y=STICK,THE Z=TEACHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 16 1 ;link 3 14 1 ;tlink 0 2 4 5 -1 6;} 
11
t:{word 1.0} 2
t:{word 1.0} 6
t:{word 1.0} 30
t:{word 1.0} 42
t:{word 1.0} 1
t:{word 1.0} 16
t:{word 1.0} 38
t:{word 1.0} 1
t:{word 1.0} 14
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the man walk -s . . }
#mess:   A=WALK Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 3 1 ;tlink 0 2 5;} 
6
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 21
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a sister was give -ing a toy to a girl . . }
#mess:   A=GIVE X=SISTER,A Y=TOY,A Z=GIRL,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 17 2 ;link 3 8 2 ;tlink 1 3 4 5 -1 6;} 
12
t:{word 1.0} 2
t:{word 1.0} 11
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 41
t:{word 1.0} 2
t:{word 1.0} 17
t:{word 1.0} 38
t:{word 1.0} 2
t:{word 1.0} 8
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the kite is kick -par by the brother . . }
#mess:   A=KICK X=BROTHER,THE Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 12 1 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
10
t:{word 1.0} 1
t:{word 1.0} 18
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 12
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the father is walk -ing . . }
#mess:   A=WALK Y=FATHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 9 1 ;tlink 0 3 5;} 
7
t:{word 1.0} 1
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the woman is kick -ing a stick . . }
#mess:   A=KICK X=WOMAN,THE Y=STICK,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 4 1 ;link 2 16 2 ;tlink 0 3 4 5;} 
9
t:{word 1.0} 1
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 41
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a dog carry -s the stick . . }
#mess:   A=CARRY X=DOG,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
8
t:{word 1.0} 2
t:{word 1.0} 6
t:{word 1.0} 26
t:{word 1.0} 42
t:{word 1.0} 1
t:{word 1.0} 16
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a teacher throw -s a sister a stick . . }
#mess:   A=THROW X=TEACHER,A Y=STICK,A Z=SISTER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 16 2 ;link 3 11 2 ;tlink 0 2 4 6 5;} 
10
t:{word 1.0} 2
t:{word 1.0} 14
t:{word 1.0} 28
t:{word 1.0} 42
t:{word 1.0} 2
t:{word 1.0} 11
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the kite is being carry -par by a brother . . }
#mess:   A=CARRY X=BROTHER,A Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
11
t:{word 1.0} 1
t:{word 1.0} 18
t:{word 1.0} 32
t:{word 1.0} 44
t:{word 1.0} 26
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 12
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the dog carry -ed a toy . . }
#mess:   A=CARRY X=DOG,THE Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 1
t:{word 1.0} 6
t:{word 1.0} 26
t:{word 1.0} 43
t:{word 1.0} 2
t:{word 1.0} 17
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the brother sleep -s . . }
#mess:   A=SLEEP Y=BROTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 12 1 ;tlink 0 2 5;} 
6
t:{word 1.0} 1
t:{word 1.0} 12
t:{word 1.0} 19
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the girl give -s the ball to a boy . . }
#mess:   A=GIVE X=GIRL,THE Y=BALL,THE Z=BOY,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 15 1 ;link 3 7 2 ;tlink 0 2 4 5 -1 6;} 
11
t:{word 1.0} 1
t:{word 1.0} 8
t:{word 1.0} 27
t:{word 1.0} 42
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 38
t:{word 1.0} 2
t:{word 1.0} 7
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the man carry -s the ball . . }
#mess:   A=CARRY X=MAN,THE Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 3 1 ;link 2 15 1 ;tlink 0 2 4 5;} 
8
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 26
t:{word 1.0} 42
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a woman sleep -ed . . }
#mess:   A=SLEEP Y=WOMAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 4 2 ;tlink 1 2 5;} 
6
t:{word 1.0} 2
t:{word 1.0} 4
t:{word 1.0} 19
t:{word 1.0} 43
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the woman is carry -ing a ball . . }
#mess:   A=CARRY X=WOMAN,THE Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 4 1 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
t:{word 1.0} 1
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 41
t:{word 1.0} 2
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the man was walk -ing . . }
#mess:   A=WALK Y=MAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 3 1 ;tlink 1 3 5;} 
7
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 34
t:{word 1.0} 21
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the mother is run -ing . . }
#mess:   A=RUN Y=MOTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 10 1 ;tlink 0 3 5;} 
7
t:{word 1.0} 1
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a father throw -s a kite to the man . . }
#mess:   A=THROW X=FATHER,A Y=KITE,A Z=MAN,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 2 ;link 2 18 2 ;link 3 3 1 ;tlink 0 2 4 5 -1 6;} 
11
t:{word 1.0} 2
t:{word 1.0} 9
t:{word 1.0} 28
t:{word 1.0} 42
t:{word 1.0} 2
t:{word 1.0} 18
t:{word 1.0} 38
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the kite is carry -par by a woman . . }
#mess:   A=CARRY X=WOMAN,A Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
10
t:{word 1.0} 1
t:{word 1.0} 18
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 4
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a man run -s . . }
#mess:   A=RUN Y=MAN,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 3 2 ;tlink 0 2 5;} 
6
t:{word 1.0} 2
t:{word 1.0} 3
t:{word 1.0} 22
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was sleep -ing . . }
#mess:   A=SLEEP Y=NURSE,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 13 2 ;tlink 1 3 5;} 
7
t:{word 1.0} 2
t:{word 1.0} 13
t:{word 1.0} 34
t:{word 1.0} 19
t:{word 1.0} 41
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the stick was being carry -par by the man . . }
#mess:   A=CARRY X=MAN,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
t:{word 1.0} 1
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 44
t:{word 1.0} 26
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the brother was kick -ing a stick . . }
#mess:   A=KICK X=BROTHER,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 1
t:{word 1.0} 12
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 41
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the girl was hit -ing the kite . . }
#mess:   A=HIT X=GIRL,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 1
t:{word 1.0} 8
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 18
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the brother show -ed the ball to the cat . . }
#mess:   A=SHOW X=BROTHER,THE Y=BALL,THE Z=CAT,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 15 1 ;link 3 5 1 ;tlink 1 2 4 5 -1 6;} 
11
t:{word 1.0} 1
t:{word 1.0} 12
t:{word 1.0} 29
t:{word 1.0} 43
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 38
t:{word 1.0} 1
t:{word 1.0} 5
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the kite is carry -par by the mother . . }
#mess:   A=CARRY X=MOTHER,THE Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 10 1 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
10
t:{word 1.0} 1
t:{word 1.0} 18
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 10
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the toy was being hit -par by a cat . . }
#mess:   A=HIT X=CAT,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
11
t:{word 1.0} 1
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 44
t:{word 1.0} 24
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 5
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a man jump -s . . }
#mess:   A=JUMP Y=MAN,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 3 2 ;tlink 0 2 5;} 
6
t:{word 1.0} 2
t:{word 1.0} 3
t:{word 1.0} 20
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a father give -s a kite to the teacher . . }
#mess:   A=GIVE X=FATHER,A Y=KITE,A Z=TEACHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 18 2 ;link 3 14 1 ;tlink 0 2 4 5 -1 6;} 
11
t:{word 1.0} 2
t:{word 1.0} 9
t:{word 1.0} 27
t:{word 1.0} 42
t:{word 1.0} 2
t:{word 1.0} 18
t:{word 1.0} 38
t:{word 1.0} 1
t:{word 1.0} 14
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a cat sleep -s . . }
#mess:   A=SLEEP Y=CAT,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 5 2 ;tlink 0 2 5;} 
6
t:{word 1.0} 2
t:{word 1.0} 5
t:{word 1.0} 19
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the sister hit -ed the ball . . }
#mess:   A=HIT X=SISTER,THE Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 1
t:{word 1.0} 11
t:{word 1.0} 24
t:{word 1.0} 43
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the dog was present -ing a man a stick . . }
#mess:   A=PRESENT X=DOG,THE Y=STICK,A Z=MAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 6 1 ;link 2 16 2 ;link 3 3 2 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 1
t:{word 1.0} 6
t:{word 1.0} 34
t:{word 1.0} 30
t:{word 1.0} 41
t:{word 1.0} 2
t:{word 1.0} 3
t:{word 1.0} 2
t:{word 1.0} 16
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a nurse present -s a ball to a father . . }
#mess:   A=PRESENT X=NURSE,A Y=BALL,A Z=FATHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 13 2 ;link 2 15 2 ;link 3 9 2 ;tlink 0 2 4 5 -1 6;} 
11
t:{word 1.0} 2
t:{word 1.0} 13
t:{word 1.0} 30
t:{word 1.0} 42
t:{word 1.0} 2
t:{word 1.0} 15
t:{word 1.0} 38
t:{word 1.0} 2
t:{word 1.0} 9
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the man is give -ing the toy to the nurse . . }
#mess:   A=GIVE X=MAN,THE Y=TOY,THE Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 3 1 ;link 2 17 1 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
12
t:{word 1.0} 1
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 27
t:{word 1.0} 41
t:{word 1.0} 1
t:{word 1.0} 17
t:{word 1.0} 38
t:{word 1.0} 1
t:{word 1.0} 13
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a girl carry -ed the ball . . }
#mess:   A=CARRY X=GIRL,A Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 2
t:{word 1.0} 8
t:{word 1.0} 26
t:{word 1.0} 43
t:{word 1.0} 1
t:{word 1.0} 15
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a brother run -s . . }
#mess:   A=RUN Y=BROTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 12 2 ;tlink 0 2 5;} 
6
t:{word 1.0} 2
t:{word 1.0} 12
t:{word 1.0} 22
t:{word 1.0} 42
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the father give -s a brother the stick . . }
#mess:   A=GIVE X=FATHER,THE Y=STICK,THE Z=BROTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 16 1 ;link 3 12 2 ;tlink 0 2 4 6 5;} 
10
t:{word 1.0} 1
t:{word 1.0} 9
t:{word 1.0} 27
t:{word 1.0} 42
t:{word 1.0} 2
t:{word 1.0} 12
t:{word 1.0} 1
t:{word 1.0} 16
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ the kite was being carry -par by a man . . }
#mess:   A=CARRY X=MAN,A Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
11
t:{word 1.0} 1
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 44
t:{word 1.0} 26
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 2
t:{word 1.0} 3
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ a ball is kick -par by the father . . }
#mess:   A=KICK X=FATHER,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
10
t:{word 1.0} 2
t:{word 1.0} 15
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 40
t:{word 1.0} 36
t:{word 1.0} 1
t:{word 1.0} 9
t:{word 1.0} 39
t:{word 1.0} 39;
