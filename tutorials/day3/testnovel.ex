
#roles: A X Y Z B C
#semantics: :DET THE A :NOUN MAN WOMAN CAT DOG BOY GIRL FATHER MOTHER SISTER BROTHER NURSE TEACHER BALL STICK TOY KITE :VERB SLEEP JUMP WALK RUN PUSH HIT KICK CARRY GIVE THROW SHOW PRESENT GLORP :AUX IS ARE WAS WERE :BY BY :THAT THAT :TO TO :PER . :PAR -PAR :ING -ING :SS -S :ED -ED :BEING BEING
#lexicon: :det the a :noun man woman cat dog boy girl father mother sister brother nurse teacher ball stick toy kite :verb sleep jump walk run push hit kick carry give throw show present glorp :aux is are was were :by by :that that :to to :per . :par -par :ing -ing :ss -s :ed -ed :being being
#eventsemantics: PRES PAST SIMP PROG XX YY ZZ CC DD
name:{ a cat was glorp -ing the stick to the woman . . }
#mess:   A=GLORP X=CAT,A Y=STICK,THE Z=WOMAN,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 5 2 ;link 2 16 1 ;link 3 4 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was glorp -ing . . }
#mess:   A=GLORP Y=TEACHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 14 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother is glorp -ing the toy . . }
#mess:   A=GLORP X=MOTHER,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the stick is being glorp -par by a sister . . }
#mess:   A=GLORP X=SISTER,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the woman glorp -s the ball . . }
#mess:   A=GLORP X=WOMAN,THE Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 15 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the woman was glorp -ing a nurse the ball . . }
#mess:   A=GLORP X=WOMAN,THE Y=BALL,THE Z=NURSE,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 15 1 ;link 3 13 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
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
name:{ a father was glorp -ing a boy a ball . . }
#mess:   A=GLORP X=FATHER,A Y=BALL,A Z=BOY,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 15 2 ;link 3 7 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ a dog is glorp -ing . . }
#mess:   A=GLORP Y=DOG,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 6 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother glorp -ed . . }
#mess:   A=GLORP Y=BROTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 12 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother was glorp -ing the kite . . }
#mess:   A=GLORP X=BROTHER,A Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father glorp -s . . }
#mess:   A=GLORP Y=FATHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 9 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is glorp -ing . . }
#mess:   A=GLORP Y=BOY,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 7 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman was glorp -ing the brother a kite . . }
#mess:   A=GLORP X=WOMAN,A Y=KITE,A Z=BROTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 4 2 ;link 2 18 2 ;link 3 12 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse was glorp -ing a girl the toy . . }
#mess:   A=GLORP X=NURSE,THE Y=TOY,THE Z=GIRL,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 17 1 ;link 3 8 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister is glorp -ing . . }
#mess:   A=GLORP Y=SISTER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 11 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy glorp -ed the toy to a man . . }
#mess:   A=GLORP X=BOY,THE Y=TOY,THE Z=MAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 7 1 ;link 2 17 1 ;link 3 3 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the mother glorp -ed a cat the stick . . }
#mess:   A=GLORP X=MOTHER,THE Y=STICK,THE Z=CAT,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 16 1 ;link 3 5 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
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
name:{ the stick is being glorp -par by a man . . }
#mess:   A=GLORP X=MAN,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a kite was glorp -par by the mother . . }
#mess:   A=GLORP X=MOTHER,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the cat is glorp -ing a ball to the father . . }
#mess:   A=GLORP X=CAT,THE Y=BALL,A Z=FATHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 5 1 ;link 2 15 2 ;link 3 9 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is being glorp -par by a mother . . }
#mess:   A=GLORP X=MOTHER,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a teacher is glorp -ing the kite . . }
#mess:   A=GLORP X=TEACHER,A Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father was glorp -ing the ball . . }
#mess:   A=GLORP X=FATHER,THE Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the sister glorp -s the toy . . }
#mess:   A=GLORP X=SISTER,THE Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 17 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the boy glorp -s . . }
#mess:   A=GLORP Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 7 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was being glorp -par by a sister . . }
#mess:   A=GLORP X=SISTER,A Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the dog was glorp -ing . . }
#mess:   A=GLORP Y=DOG,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 6 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog glorp -s a toy . . }
#mess:   A=GLORP X=DOG,A Y=TOY,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 6 2 ;link 2 17 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a teacher glorp -s . . }
#mess:   A=GLORP Y=TEACHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 14 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was glorp -par by the woman . . }
#mess:   A=GLORP X=WOMAN,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the dog was glorp -ing a stick to the sister . . }
#mess:   A=GLORP X=DOG,THE Y=STICK,A Z=SISTER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 16 2 ;link 3 11 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a dog was glorp -ing . . }
#mess:   A=GLORP Y=DOG,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 6 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick was glorp -par by a woman . . }
#mess:   A=GLORP X=WOMAN,A Y=STICK,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 4 2 ;link 2 16 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the woman was glorp -ing the kite to the sister . . }
#mess:   A=GLORP X=WOMAN,THE Y=KITE,THE Z=SISTER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 18 1 ;link 3 11 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the man glorp -ed the toy to a sister . . }
#mess:   A=GLORP X=MAN,THE Y=TOY,THE Z=SISTER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 17 1 ;link 3 11 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher is glorp -ing a teacher a kite . . }
#mess:   A=GLORP X=TEACHER,THE Y=KITE,A Z=TEACHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 18 2 ;link 3 14 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
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
name:{ a man glorp -s a ball . . }
#mess:   A=GLORP X=MAN,A Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 15 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a father is glorp -ing a kite to a sister . . }
#mess:   A=GLORP X=FATHER,A Y=KITE,A Z=SISTER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 18 2 ;link 3 11 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is glorp -ing a kite . . }
#mess:   A=GLORP X=FATHER,A Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a nurse glorp -s a dog a stick . . }
#mess:   A=GLORP X=NURSE,A Y=STICK,A Z=DOG,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 16 2 ;link 3 6 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the brother was glorp -ing . . }
#mess:   A=GLORP Y=BROTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 12 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse glorp -ed the ball . . }
#mess:   A=GLORP X=NURSE,THE Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father glorp -ed the ball to a cat . . }
#mess:   A=GLORP X=FATHER,THE Y=BALL,THE Z=CAT,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 15 1 ;link 3 5 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat glorp -ed a ball . . }
#mess:   A=GLORP X=CAT,THE Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 5 1 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a mother glorp -s a stick . . }
#mess:   A=GLORP X=MOTHER,A Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 16 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a mother is glorp -ing the kite . . }
#mess:   A=GLORP X=MOTHER,A Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the sister was glorp -ing a boy the toy . . }
#mess:   A=GLORP X=SISTER,THE Y=TOY,THE Z=BOY,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 17 1 ;link 3 7 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a sister is glorp -ing the brother the ball . . }
#mess:   A=GLORP X=SISTER,A Y=BALL,THE Z=BROTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 15 1 ;link 3 12 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father is glorp -ing . . }
#mess:   A=GLORP Y=FATHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 9 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher glorp -s . . }
#mess:   A=GLORP Y=TEACHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 14 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is glorp -ing . . }
#mess:   A=GLORP Y=BOY,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 7 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse glorp -s . . }
#mess:   A=GLORP Y=NURSE,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 13 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman was glorp -ing a ball to a cat . . }
#mess:   A=GLORP X=WOMAN,THE Y=BALL,A Z=CAT,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 15 2 ;link 3 5 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the toy was glorp -par by a boy . . }
#mess:   A=GLORP X=BOY,A Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a kite is glorp -par by the mother . . }
#mess:   A=GLORP X=MOTHER,THE Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a sister glorp -ed a girl the toy . . }
#mess:   A=GLORP X=SISTER,A Y=TOY,THE Z=GIRL,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 17 1 ;link 3 8 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat glorp -s the kite . . }
#mess:   A=GLORP X=CAT,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 5 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the stick was glorp -par by a nurse . . }
#mess:   A=GLORP X=NURSE,A Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a girl glorp -s the ball to a girl . . }
#mess:   A=GLORP X=GIRL,A Y=BALL,THE Z=GIRL,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 15 1 ;link 3 8 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister glorp -ed a stick . . }
#mess:   A=GLORP X=SISTER,THE Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a teacher is glorp -ing a woman the ball . . }
#mess:   A=GLORP X=TEACHER,A Y=BALL,THE Z=WOMAN,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 15 1 ;link 3 4 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the boy was glorp -ing a toy to a teacher . . }
#mess:   A=GLORP X=BOY,THE Y=TOY,A Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 7 1 ;link 2 17 2 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man glorp -s . . }
#mess:   A=GLORP Y=MAN,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 3 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman glorp -ed a ball to the boy . . }
#mess:   A=GLORP X=WOMAN,THE Y=BALL,A Z=BOY,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 15 2 ;link 3 7 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father was glorp -ing the stick . . }
#mess:   A=GLORP X=FATHER,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the girl glorp -s a kite to a woman . . }
#mess:   A=GLORP X=GIRL,THE Y=KITE,A Z=WOMAN,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 18 2 ;link 3 4 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother was glorp -ing the ball to the cat . . }
#mess:   A=GLORP X=BROTHER,A Y=BALL,THE Z=CAT,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 15 1 ;link 3 5 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a girl glorp -ed the ball to the man . . }
#mess:   A=GLORP X=GIRL,A Y=BALL,THE Z=MAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 15 1 ;link 3 3 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is glorp -par by the father . . }
#mess:   A=GLORP X=FATHER,THE Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a man glorp -s the kite to the man . . }
#mess:   A=GLORP X=MAN,A Y=KITE,THE Z=MAN,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 18 1 ;link 3 3 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was glorp -ing the toy . . }
#mess:   A=GLORP X=BOY,A Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a boy was glorp -ing a stick . . }
#mess:   A=GLORP X=BOY,A Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the mother glorp -ed a stick to the mother . . }
#mess:   A=GLORP X=MOTHER,THE Y=STICK,A Z=MOTHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 16 2 ;link 3 10 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
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
name:{ a mother is glorp -ing the kite . . }
#mess:   A=GLORP X=MOTHER,A Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a teacher was glorp -ing . . }
#mess:   A=GLORP Y=TEACHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 14 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is glorp -ing the stick . . }
#mess:   A=GLORP X=MOTHER,A Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the brother is glorp -ing . . }
#mess:   A=GLORP Y=BROTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 12 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother glorp -ed the stick . . }
#mess:   A=GLORP X=BROTHER,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 12 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the teacher was glorp -ing the boy the kite . . }
#mess:   A=GLORP X=TEACHER,THE Y=KITE,THE Z=BOY,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 18 1 ;link 3 7 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ the nurse is glorp -ing a man a kite . . }
#mess:   A=GLORP X=NURSE,THE Y=KITE,A Z=MAN,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 18 2 ;link 3 3 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a girl is glorp -ing . . }
#mess:   A=GLORP Y=GIRL,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 8 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father is glorp -ing . . }
#mess:   A=GLORP Y=FATHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 9 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog glorp -ed . . }
#mess:   A=GLORP Y=DOG,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 6 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was glorp -par by a mother . . }
#mess:   A=GLORP X=MOTHER,A Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the cat glorp -ed a toy to a cat . . }
#mess:   A=GLORP X=CAT,THE Y=TOY,A Z=CAT,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 5 1 ;link 2 17 2 ;link 3 5 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is glorp -ing the teacher a stick . . }
#mess:   A=GLORP X=GIRL,THE Y=STICK,A Z=TEACHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 16 2 ;link 3 14 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ the stick was being glorp -par by a man . . }
#mess:   A=GLORP X=MAN,A Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the stick is glorp -par by a father . . }
#mess:   A=GLORP X=FATHER,A Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the teacher is glorp -ing the kite . . }
#mess:   A=GLORP X=TEACHER,THE Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father is glorp -ing the toy . . }
#mess:   A=GLORP X=FATHER,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a father glorp -s the toy . . }
#mess:   A=GLORP X=FATHER,A Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 17 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father was glorp -ing a kite . . }
#mess:   A=GLORP X=FATHER,THE Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the brother was glorp -ing a kite to a teacher . . }
#mess:   A=GLORP X=BROTHER,THE Y=KITE,A Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 12 1 ;link 2 18 2 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a mother glorp -s . . }
#mess:   A=GLORP Y=MOTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 10 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother is glorp -ing . . }
#mess:   A=GLORP Y=BROTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 12 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl was glorp -ing the stick to a father . . }
#mess:   A=GLORP X=GIRL,THE Y=STICK,THE Z=FATHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 16 1 ;link 3 9 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a mother is glorp -ing . . }
#mess:   A=GLORP Y=MOTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 10 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite was being glorp -par by a boy . . }
#mess:   A=GLORP X=BOY,A Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a man glorp -s the girl the kite . . }
#mess:   A=GLORP X=MAN,A Y=KITE,THE Z=GIRL,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 18 1 ;link 3 8 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
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
name:{ a boy is glorp -ing the teacher the kite . . }
#mess:   A=GLORP X=BOY,A Y=KITE,THE Z=TEACHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 18 1 ;link 3 14 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the toy is glorp -par by the man . . }
#mess:   A=GLORP X=MAN,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the nurse glorp -s the sister a ball . . }
#mess:   A=GLORP X=NURSE,THE Y=BALL,A Z=SISTER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 15 2 ;link 3 11 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
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
name:{ a teacher is glorp -ing the stick to the dog . . }
#mess:   A=GLORP X=TEACHER,A Y=STICK,THE Z=DOG,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 16 1 ;link 3 6 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the woman glorp -s the kite to the mother . . }
#mess:   A=GLORP X=WOMAN,THE Y=KITE,THE Z=MOTHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 18 1 ;link 3 10 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the nurse glorp -s . . }
#mess:   A=GLORP Y=NURSE,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 13 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse is glorp -ing a stick to a boy . . }
#mess:   A=GLORP X=NURSE,THE Y=STICK,A Z=BOY,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 16 2 ;link 3 7 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog glorp -s the ball . . }
#mess:   A=GLORP X=DOG,A Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 6 2 ;link 2 15 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the girl glorp -ed a teacher a toy . . }
#mess:   A=GLORP X=GIRL,THE Y=TOY,A Z=TEACHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 17 2 ;link 3 14 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the girl was glorp -ing the kite . . }
#mess:   A=GLORP X=GIRL,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a teacher is glorp -ing . . }
#mess:   A=GLORP Y=TEACHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 14 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog was glorp -ing the toy to the brother . . }
#mess:   A=GLORP X=DOG,A Y=TOY,THE Z=BROTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 6 2 ;link 2 17 1 ;link 3 12 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a man was glorp -ing . . }
#mess:   A=GLORP Y=MAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 3 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is being glorp -par by the father . . }
#mess:   A=GLORP X=FATHER,THE Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a woman was glorp -ing a ball to the nurse . . }
#mess:   A=GLORP X=WOMAN,A Y=BALL,A Z=NURSE,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 4 2 ;link 2 15 2 ;link 3 13 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the toy is glorp -par by a cat . . }
#mess:   A=GLORP X=CAT,A Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 5 2 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a toy was glorp -par by the father . . }
#mess:   A=GLORP X=FATHER,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the stick is glorp -par by a teacher . . }
#mess:   A=GLORP X=TEACHER,A Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the stick was being glorp -par by a father . . }
#mess:   A=GLORP X=FATHER,A Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a kite was being glorp -par by the nurse . . }
#mess:   A=GLORP X=NURSE,THE Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the sister was glorp -ing the teacher the ball . . }
#mess:   A=GLORP X=SISTER,THE Y=BALL,THE Z=TEACHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 15 1 ;link 3 14 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ a teacher was glorp -ing a ball to a teacher . . }
#mess:   A=GLORP X=TEACHER,A Y=BALL,A Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 15 2 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was being glorp -par by the nurse . . }
#mess:   A=GLORP X=NURSE,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother glorp -ed a cat the stick . . }
#mess:   A=GLORP X=BROTHER,A Y=STICK,THE Z=CAT,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 16 1 ;link 3 5 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
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
name:{ the dog glorp -s the sister the kite . . }
#mess:   A=GLORP X=DOG,THE Y=KITE,THE Z=SISTER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 18 1 ;link 3 11 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ a stick is being glorp -par by the father . . }
#mess:   A=GLORP X=FATHER,THE Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a mother was glorp -ing the toy . . }
#mess:   A=GLORP X=MOTHER,A Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the stick was glorp -par by a mother . . }
#mess:   A=GLORP X=MOTHER,A Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the mother is glorp -ing the ball . . }
#mess:   A=GLORP X=MOTHER,THE Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the kite is being glorp -par by the teacher . . }
#mess:   A=GLORP X=TEACHER,THE Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the toy is being glorp -par by a cat . . }
#mess:   A=GLORP X=CAT,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 5 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the teacher was glorp -ing a brother a toy . . }
#mess:   A=GLORP X=TEACHER,THE Y=TOY,A Z=BROTHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 17 2 ;link 3 12 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ a ball is glorp -par by a boy . . }
#mess:   A=GLORP X=BOY,A Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a sister glorp -s . . }
#mess:   A=GLORP Y=SISTER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 11 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was glorp -ing . . }
#mess:   A=GLORP Y=CAT,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 5 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was glorp -ing the mother the stick . . }
#mess:   A=GLORP X=DOG,THE Y=STICK,THE Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 16 1 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ the toy is glorp -par by the brother . . }
#mess:   A=GLORP X=BROTHER,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 12 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the boy glorp -s a kite . . }
#mess:   A=GLORP X=BOY,THE Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 7 1 ;link 2 18 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a woman was glorp -ing the kite to a boy . . }
#mess:   A=GLORP X=WOMAN,A Y=KITE,THE Z=BOY,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 4 2 ;link 2 18 1 ;link 3 7 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the mother was glorp -ing . . }
#mess:   A=GLORP Y=MOTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 10 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is glorp -par by the woman . . }
#mess:   A=GLORP X=WOMAN,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a sister was glorp -ing a toy . . }
#mess:   A=GLORP X=SISTER,A Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the teacher glorp -ed a toy to a dog . . }
#mess:   A=GLORP X=TEACHER,THE Y=TOY,A Z=DOG,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 17 2 ;link 3 6 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher glorp -ed . . }
#mess:   A=GLORP Y=TEACHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 14 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is glorp -par by the nurse . . }
#mess:   A=GLORP X=NURSE,THE Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the ball is glorp -par by the brother . . }
#mess:   A=GLORP X=BROTHER,THE Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 12 1 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the brother was glorp -ing the ball to a nurse . . }
#mess:   A=GLORP X=BROTHER,THE Y=BALL,THE Z=NURSE,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 12 1 ;link 2 15 1 ;link 3 13 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl glorp -s the kite . . }
#mess:   A=GLORP X=GIRL,THE Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother glorp -ed a kite . . }
#mess:   A=GLORP X=BROTHER,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the woman glorp -ed a stick . . }
#mess:   A=GLORP X=WOMAN,THE Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father is glorp -ing the ball to the dog . . }
#mess:   A=GLORP X=FATHER,THE Y=BALL,THE Z=DOG,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 15 1 ;link 3 6 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse was glorp -ing a father the toy . . }
#mess:   A=GLORP X=NURSE,THE Y=TOY,THE Z=FATHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 17 1 ;link 3 9 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
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
name:{ the boy glorp -ed a mother a kite . . }
#mess:   A=GLORP X=BOY,THE Y=KITE,A Z=MOTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 7 1 ;link 2 18 2 ;link 3 10 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
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
name:{ the mother glorp -ed the kite to the dog . . }
#mess:   A=GLORP X=MOTHER,THE Y=KITE,THE Z=DOG,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 18 1 ;link 3 6 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a girl was glorp -ing a toy to a woman . . }
#mess:   A=GLORP X=GIRL,A Y=TOY,A Z=WOMAN,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 17 2 ;link 3 4 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother was glorp -ing . . }
#mess:   A=GLORP Y=BROTHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 12 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was glorp -ing a cat a ball . . }
#mess:   A=GLORP X=CAT,A Y=BALL,A Z=CAT,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 5 2 ;link 2 15 2 ;link 3 5 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ the nurse is glorp -ing . . }
#mess:   A=GLORP Y=NURSE,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 13 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite was being glorp -par by a girl . . }
#mess:   A=GLORP X=GIRL,A Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the mother is glorp -ing . . }
#mess:   A=GLORP Y=MOTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 10 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse glorp -ed . . }
#mess:   A=GLORP Y=NURSE,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 13 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was glorp -par by a woman . . }
#mess:   A=GLORP X=WOMAN,A Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 4 2 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother is glorp -ing the cat the kite . . }
#mess:   A=GLORP X=BROTHER,A Y=KITE,THE Z=CAT,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 18 1 ;link 3 5 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ a mother glorp -s a stick to the man . . }
#mess:   A=GLORP X=MOTHER,A Y=STICK,A Z=MAN,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 16 2 ;link 3 3 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the cat is glorp -ing a ball to a woman . . }
#mess:   A=GLORP X=CAT,THE Y=BALL,A Z=WOMAN,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 5 1 ;link 2 15 2 ;link 3 4 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man glorp -ed . . }
#mess:   A=GLORP Y=MAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 3 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man glorp -ed the dog the toy . . }
#mess:   A=GLORP X=MAN,A Y=TOY,THE Z=DOG,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 17 1 ;link 3 6 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a kite is being glorp -par by a father . . }
#mess:   A=GLORP X=FATHER,A Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a toy was being glorp -par by a girl . . }
#mess:   A=GLORP X=GIRL,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a dog glorp -s a stick to the teacher . . }
#mess:   A=GLORP X=DOG,A Y=STICK,A Z=TEACHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 6 2 ;link 2 16 2 ;link 3 14 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a sister glorp -s a toy to a dog . . }
#mess:   A=GLORP X=SISTER,A Y=TOY,A Z=DOG,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 17 2 ;link 3 6 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father was glorp -ing a boy the kite . . }
#mess:   A=GLORP X=FATHER,THE Y=KITE,THE Z=BOY,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 18 1 ;link 3 7 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ the stick is being glorp -par by the cat . . }
#mess:   A=GLORP X=CAT,THE Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 5 1 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the brother is glorp -ing . . }
#mess:   A=GLORP Y=BROTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 12 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man glorp -s a stick . . }
#mess:   A=GLORP X=MAN,A Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 16 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the boy is glorp -ing the toy . . }
#mess:   A=GLORP X=BOY,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 7 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the dog is glorp -ing the toy to the nurse . . }
#mess:   A=GLORP X=DOG,THE Y=TOY,THE Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 17 1 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was being glorp -par by a man . . }
#mess:   A=GLORP X=MAN,A Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the nurse is glorp -ing the mother a ball . . }
#mess:   A=GLORP X=NURSE,THE Y=BALL,A Z=MOTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 15 2 ;link 3 10 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the woman is glorp -ing the brother the kite . . }
#mess:   A=GLORP X=WOMAN,THE Y=KITE,THE Z=BROTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 18 1 ;link 3 12 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ the teacher glorp -s a ball to a woman . . }
#mess:   A=GLORP X=TEACHER,THE Y=BALL,A Z=WOMAN,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 15 2 ;link 3 4 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man glorp -ed the kite . . }
#mess:   A=GLORP X=MAN,THE Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a stick is being glorp -par by the cat . . }
#mess:   A=GLORP X=CAT,THE Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 5 1 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the teacher is glorp -ing a toy . . }
#mess:   A=GLORP X=TEACHER,THE Y=TOY,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 17 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the teacher glorp -s the stick to the cat . . }
#mess:   A=GLORP X=TEACHER,THE Y=STICK,THE Z=CAT,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 16 1 ;link 3 5 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother glorp -ed . . }
#mess:   A=GLORP Y=MOTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 10 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the ball was glorp -par by a nurse . . }
#mess:   A=GLORP X=NURSE,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the woman glorp -ed the dog a kite . . }
#mess:   A=GLORP X=WOMAN,THE Y=KITE,A Z=DOG,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 18 2 ;link 3 6 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
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
name:{ a boy glorp -ed the girl a toy . . }
#mess:   A=GLORP X=BOY,A Y=TOY,A Z=GIRL,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 17 2 ;link 3 8 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the man was glorp -ing the toy . . }
#mess:   A=GLORP X=MAN,THE Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a father glorp -s . . }
#mess:   A=GLORP Y=FATHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 9 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the kite is being glorp -par by a woman . . }
#mess:   A=GLORP X=WOMAN,A Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 4 2 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a mother glorp -s the ball . . }
#mess:   A=GLORP X=MOTHER,A Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 15 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a father glorp -s a brother the stick . . }
#mess:   A=GLORP X=FATHER,A Y=STICK,THE Z=BROTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 16 1 ;link 3 12 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a cat is glorp -ing the ball to a dog . . }
#mess:   A=GLORP X=CAT,A Y=BALL,THE Z=DOG,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 5 2 ;link 2 15 1 ;link 3 6 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the sister glorp -s the kite to the brother . . }
#mess:   A=GLORP X=SISTER,THE Y=KITE,THE Z=BROTHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 18 1 ;link 3 12 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother glorp -ed a toy to the girl . . }
#mess:   A=GLORP X=BROTHER,THE Y=TOY,A Z=GIRL,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 12 1 ;link 2 17 2 ;link 3 8 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the girl glorp -ed a kite to a man . . }
#mess:   A=GLORP X=GIRL,THE Y=KITE,A Z=MAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 18 2 ;link 3 3 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father glorp -s the boy a stick . . }
#mess:   A=GLORP X=FATHER,A Y=STICK,A Z=BOY,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 16 2 ;link 3 7 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ the woman glorp -ed the kite to the nurse . . }
#mess:   A=GLORP X=WOMAN,THE Y=KITE,THE Z=NURSE,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 18 1 ;link 3 13 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball was glorp -par by the nurse . . }
#mess:   A=GLORP X=NURSE,THE Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a nurse glorp -s the ball to a teacher . . }
#mess:   A=GLORP X=NURSE,A Y=BALL,THE Z=TEACHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 15 1 ;link 3 14 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher is glorp -ing the stick to a girl . . }
#mess:   A=GLORP X=TEACHER,A Y=STICK,THE Z=GIRL,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 16 1 ;link 3 8 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is glorp -par by a teacher . . }
#mess:   A=GLORP X=TEACHER,A Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the girl is glorp -ing . . }
#mess:   A=GLORP Y=GIRL,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 8 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher is glorp -ing the man a kite . . }
#mess:   A=GLORP X=TEACHER,A Y=KITE,A Z=MAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 18 2 ;link 3 3 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother glorp -s . . }
#mess:   A=GLORP Y=BROTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 12 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father glorp -s . . }
#mess:   A=GLORP Y=FATHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 9 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is glorp -ing the stick . . }
#mess:   A=GLORP X=GIRL,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the teacher is glorp -ing the toy to a girl . . }
#mess:   A=GLORP X=TEACHER,THE Y=TOY,THE Z=GIRL,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 17 1 ;link 3 8 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the nurse is glorp -ing the sister the toy . . }
#mess:   A=GLORP X=NURSE,THE Y=TOY,THE Z=SISTER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 17 1 ;link 3 11 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ the man glorp -s . . }
#mess:   A=GLORP Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 3 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father was glorp -ing . . }
#mess:   A=GLORP Y=FATHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 9 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy was glorp -ing the man a stick . . }
#mess:   A=GLORP X=BOY,A Y=STICK,A Z=MAN,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 16 2 ;link 3 3 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man glorp -ed . . }
#mess:   A=GLORP Y=MAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 3 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is being glorp -par by the cat . . }
#mess:   A=GLORP X=CAT,THE Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 5 1 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a father glorp -s a ball . . }
#mess:   A=GLORP X=FATHER,A Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 15 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the girl is glorp -ing . . }
#mess:   A=GLORP Y=GIRL,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 8 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog glorp -s the ball to a sister . . }
#mess:   A=GLORP X=DOG,A Y=BALL,THE Z=SISTER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 6 2 ;link 2 15 1 ;link 3 11 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the mother was glorp -ing the toy . . }
#mess:   A=GLORP X=MOTHER,THE Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a ball is glorp -par by the cat . . }
#mess:   A=GLORP X=CAT,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 5 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the nurse is glorp -ing a mother a stick . . }
#mess:   A=GLORP X=NURSE,THE Y=STICK,A Z=MOTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 16 2 ;link 3 10 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a father glorp -s a stick . . }
#mess:   A=GLORP X=FATHER,A Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 16 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a mother glorp -s the kite . . }
#mess:   A=GLORP X=MOTHER,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the man was glorp -ing the stick . . }
#mess:   A=GLORP X=MAN,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the toy is glorp -par by a father . . }
#mess:   A=GLORP X=FATHER,A Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father is glorp -ing a toy to a brother . . }
#mess:   A=GLORP X=FATHER,THE Y=TOY,A Z=BROTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 17 2 ;link 3 12 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy was glorp -par by a brother . . }
#mess:   A=GLORP X=BROTHER,A Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a nurse glorp -s the ball . . }
#mess:   A=GLORP X=NURSE,A Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 15 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the sister was glorp -ing a stick . . }
#mess:   A=GLORP X=SISTER,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a man is glorp -ing a girl the ball . . }
#mess:   A=GLORP X=MAN,A Y=BALL,THE Z=GIRL,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 15 1 ;link 3 8 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the sister is glorp -ing a sister the kite . . }
#mess:   A=GLORP X=SISTER,THE Y=KITE,THE Z=SISTER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 18 1 ;link 3 11 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the ball was glorp -par by the dog . . }
#mess:   A=GLORP X=DOG,THE Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a cat glorp -s the cat the kite . . }
#mess:   A=GLORP X=CAT,A Y=KITE,THE Z=CAT,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 5 2 ;link 2 18 1 ;link 3 5 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the mother was glorp -ing a kite . . }
#mess:   A=GLORP X=MOTHER,THE Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the dog was glorp -ing . . }
#mess:   A=GLORP Y=DOG,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 6 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was glorp -ing a brother the kite . . }
#mess:   A=GLORP X=SISTER,THE Y=KITE,THE Z=BROTHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 18 1 ;link 3 12 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ a sister glorp -ed a toy to a woman . . }
#mess:   A=GLORP X=SISTER,A Y=TOY,A Z=WOMAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 17 2 ;link 3 4 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was glorp -ing the toy to the sister . . }
#mess:   A=GLORP X=TEACHER,A Y=TOY,THE Z=SISTER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 17 1 ;link 3 11 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a nurse glorp -ed a toy to a boy . . }
#mess:   A=GLORP X=NURSE,A Y=TOY,A Z=BOY,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 17 2 ;link 3 7 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a kite is being glorp -par by a man . . }
#mess:   A=GLORP X=MAN,A Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a toy was being glorp -par by a nurse . . }
#mess:   A=GLORP X=NURSE,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a boy glorp -s the ball to the girl . . }
#mess:   A=GLORP X=BOY,A Y=BALL,THE Z=GIRL,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 15 1 ;link 3 8 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a ball is being glorp -par by the boy . . }
#mess:   A=GLORP X=BOY,THE Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 7 1 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the brother was glorp -ing the stick . . }
#mess:   A=GLORP X=BROTHER,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 12 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the stick was glorp -par by the dog . . }
#mess:   A=GLORP X=DOG,THE Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a girl glorp -ed a stick to the girl . . }
#mess:   A=GLORP X=GIRL,A Y=STICK,A Z=GIRL,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 16 2 ;link 3 8 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
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
name:{ the woman glorp -ed a woman a stick . . }
#mess:   A=GLORP X=WOMAN,THE Y=STICK,A Z=WOMAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 16 2 ;link 3 4 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother glorp -s a stick . . }
#mess:   A=GLORP X=BROTHER,A Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 16 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a woman was glorp -ing . . }
#mess:   A=GLORP Y=WOMAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 4 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy glorp -s the kite to a girl . . }
#mess:   A=GLORP X=BOY,A Y=KITE,THE Z=GIRL,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 18 1 ;link 3 8 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a stick is being glorp -par by a sister . . }
#mess:   A=GLORP X=SISTER,A Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the man glorp -s a brother the kite . . }
#mess:   A=GLORP X=MAN,THE Y=KITE,THE Z=BROTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 18 1 ;link 3 12 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother glorp -s the toy . . }
#mess:   A=GLORP X=BROTHER,A Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 17 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a mother glorp -ed the ball to the brother . . }
#mess:   A=GLORP X=MOTHER,A Y=BALL,THE Z=BROTHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 15 1 ;link 3 12 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man glorp -s the girl the ball . . }
#mess:   A=GLORP X=MAN,THE Y=BALL,THE Z=GIRL,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 15 1 ;link 3 8 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ the ball was being glorp -par by a brother . . }
#mess:   A=GLORP X=BROTHER,A Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the boy glorp -ed the brother a toy . . }
#mess:   A=GLORP X=BOY,THE Y=TOY,A Z=BROTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 7 1 ;link 2 17 2 ;link 3 12 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ a dog was glorp -ing the teacher the ball . . }
#mess:   A=GLORP X=DOG,A Y=BALL,THE Z=TEACHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 6 2 ;link 2 15 1 ;link 3 14 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ a boy was glorp -ing . . }
#mess:   A=GLORP Y=BOY,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 7 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father glorp -s the kite . . }
#mess:   A=GLORP X=FATHER,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the ball was glorp -par by a boy . . }
#mess:   A=GLORP X=BOY,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the brother glorp -s the nurse a kite . . }
#mess:   A=GLORP X=BROTHER,THE Y=KITE,A Z=NURSE,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 12 1 ;link 2 18 2 ;link 3 13 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a brother is glorp -ing . . }
#mess:   A=GLORP Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog glorp -ed a boy the toy . . }
#mess:   A=GLORP X=DOG,THE Y=TOY,THE Z=BOY,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 17 1 ;link 3 7 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
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
name:{ a girl glorp -ed a stick . . }
#mess:   A=GLORP X=GIRL,A Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the girl glorp -ed a kite . . }
#mess:   A=GLORP X=GIRL,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a teacher glorp -s a kite to the mother . . }
#mess:   A=GLORP X=TEACHER,A Y=KITE,A Z=MOTHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 18 2 ;link 3 10 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister was glorp -ing . . }
#mess:   A=GLORP Y=SISTER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 11 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a father was glorp -ing a kite . . }
#mess:   A=GLORP X=FATHER,A Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a nurse is glorp -ing a stick . . }
#mess:   A=GLORP X=NURSE,A Y=STICK,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 16 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a sister is glorp -ing the ball . . }
#mess:   A=GLORP X=SISTER,A Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the teacher is glorp -ing the woman a toy . . }
#mess:   A=GLORP X=TEACHER,THE Y=TOY,A Z=WOMAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 17 2 ;link 3 4 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ a man glorp -s a ball to the boy . . }
#mess:   A=GLORP X=MAN,A Y=BALL,A Z=BOY,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 15 2 ;link 3 7 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball was being glorp -par by a dog . . }
#mess:   A=GLORP X=DOG,A Y=BALL,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 6 2 ;link 2 15 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a man was glorp -ing a kite . . }
#mess:   A=GLORP X=MAN,A Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the sister was glorp -ing a ball to the boy . . }
#mess:   A=GLORP X=SISTER,THE Y=BALL,A Z=BOY,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 15 2 ;link 3 7 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a woman glorp -ed . . }
#mess:   A=GLORP Y=WOMAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 4 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a kite is being glorp -par by the girl . . }
#mess:   A=GLORP X=GIRL,THE Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the ball was glorp -par by a woman . . }
#mess:   A=GLORP X=WOMAN,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 4 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the ball is being glorp -par by the girl . . }
#mess:   A=GLORP X=GIRL,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a girl glorp -ed . . }
#mess:   A=GLORP Y=GIRL,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 8 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother was glorp -ing the kite . . }
#mess:   A=GLORP X=MOTHER,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a man was glorp -ing a ball . . }
#mess:   A=GLORP X=MAN,A Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the cat is glorp -ing . . }
#mess:   A=GLORP Y=CAT,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 5 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the girl is glorp -ing a kite . . }
#mess:   A=GLORP X=GIRL,THE Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a girl glorp -ed the nurse a ball . . }
#mess:   A=GLORP X=GIRL,A Y=BALL,A Z=NURSE,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 15 2 ;link 3 13 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
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
name:{ a nurse is glorp -ing a brother a stick . . }
#mess:   A=GLORP X=NURSE,A Y=STICK,A Z=BROTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 16 2 ;link 3 12 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
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
name:{ the stick is glorp -par by a mother . . }
#mess:   A=GLORP X=MOTHER,A Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a girl glorp -s the toy to the man . . }
#mess:   A=GLORP X=GIRL,A Y=TOY,THE Z=MAN,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 17 1 ;link 3 3 1 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher is glorp -ing the stick to a brother . . }
#mess:   A=GLORP X=TEACHER,A Y=STICK,THE Z=BROTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 16 1 ;link 3 12 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy glorp -ed . . }
#mess:   A=GLORP Y=BOY,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 7 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother glorp -ed the man the toy . . }
#mess:   A=GLORP X=BROTHER,THE Y=TOY,THE Z=MAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 12 1 ;link 2 17 1 ;link 3 3 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ a father was glorp -ing the ball to the boy . . }
#mess:   A=GLORP X=FATHER,A Y=BALL,THE Z=BOY,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 15 1 ;link 3 7 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is glorp -ing the brother the stick . . }
#mess:   A=GLORP X=MAN,THE Y=STICK,THE Z=BROTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 16 1 ;link 3 12 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ a toy is being glorp -par by a brother . . }
#mess:   A=GLORP X=BROTHER,A Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the ball is glorp -par by a nurse . . }
#mess:   A=GLORP X=NURSE,A Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a sister glorp -s a kite . . }
#mess:   A=GLORP X=SISTER,A Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 18 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a kite is glorp -par by the girl . . }
#mess:   A=GLORP X=GIRL,THE Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a girl was glorp -ing a toy to a sister . . }
#mess:   A=GLORP X=GIRL,A Y=TOY,A Z=SISTER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 17 2 ;link 3 11 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was being glorp -par by the cat . . }
#mess:   A=GLORP X=CAT,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 5 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the dog glorp -s . . }
#mess:   A=GLORP Y=DOG,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 6 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister glorp -s . . }
#mess:   A=GLORP Y=SISTER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 11 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is glorp -par by the nurse . . }
#mess:   A=GLORP X=NURSE,THE Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a man glorp -s the cat a ball . . }
#mess:   A=GLORP X=MAN,A Y=BALL,A Z=CAT,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 15 2 ;link 3 5 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ a woman glorp -s a stick . . }
#mess:   A=GLORP X=WOMAN,A Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 4 2 ;link 2 16 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father glorp -ed the kite to the boy . . }
#mess:   A=GLORP X=FATHER,THE Y=KITE,THE Z=BOY,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 18 1 ;link 3 7 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a ball is glorp -par by the father . . }
#mess:   A=GLORP X=FATHER,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the woman is glorp -ing a man a toy . . }
#mess:   A=GLORP X=WOMAN,THE Y=TOY,A Z=MAN,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 17 2 ;link 3 3 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the nurse was glorp -ing the kite to the mother . . }
#mess:   A=GLORP X=NURSE,THE Y=KITE,THE Z=MOTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 18 1 ;link 3 10 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher glorp -s a toy to a nurse . . }
#mess:   A=GLORP X=TEACHER,THE Y=TOY,A Z=NURSE,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 17 2 ;link 3 13 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the man is glorp -ing the ball . . }
#mess:   A=GLORP X=MAN,THE Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father is glorp -ing a toy . . }
#mess:   A=GLORP X=FATHER,THE Y=TOY,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 17 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a mother glorp -ed a brother a kite . . }
#mess:   A=GLORP X=MOTHER,A Y=KITE,A Z=BROTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 18 2 ;link 3 12 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy glorp -ed a sister a ball . . }
#mess:   A=GLORP X=BOY,A Y=BALL,A Z=SISTER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 15 2 ;link 3 11 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
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
name:{ a cat glorp -ed a kite . . }
#mess:   A=GLORP X=CAT,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 5 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the ball was glorp -par by the mother . . }
#mess:   A=GLORP X=MOTHER,THE Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a cat was glorp -ing a woman a toy . . }
#mess:   A=GLORP X=CAT,A Y=TOY,A Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 5 2 ;link 2 17 2 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a ball was glorp -par by a boy . . }
#mess:   A=GLORP X=BOY,A Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a girl glorp -s a nurse a stick . . }
#mess:   A=GLORP X=GIRL,A Y=STICK,A Z=NURSE,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 16 2 ;link 3 13 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a nurse was glorp -ing a cat the stick . . }
#mess:   A=GLORP X=NURSE,A Y=STICK,THE Z=CAT,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 16 1 ;link 3 5 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ a mother is glorp -ing the ball to a boy . . }
#mess:   A=GLORP X=MOTHER,A Y=BALL,THE Z=BOY,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 15 1 ;link 3 7 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister is glorp -ing . . }
#mess:   A=GLORP Y=SISTER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 11 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher glorp -ed the ball . . }
#mess:   A=GLORP X=TEACHER,A Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the woman is glorp -ing the toy . . }
#mess:   A=GLORP X=WOMAN,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother is glorp -ing . . }
#mess:   A=GLORP Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is glorp -ing the ball to a dog . . }
#mess:   A=GLORP X=MOTHER,A Y=BALL,THE Z=DOG,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 15 1 ;link 3 6 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the toy is being glorp -par by a sister . . }
#mess:   A=GLORP X=SISTER,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the boy glorp -ed a kite . . }
#mess:   A=GLORP X=BOY,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 7 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the nurse glorp -ed a kite to the brother . . }
#mess:   A=GLORP X=NURSE,THE Y=KITE,A Z=BROTHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 13 1 ;link 2 18 2 ;link 3 12 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a woman was glorp -ing a cat the stick . . }
#mess:   A=GLORP X=WOMAN,A Y=STICK,THE Z=CAT,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 4 2 ;link 2 16 1 ;link 3 5 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ the nurse is glorp -ing . . }
#mess:   A=GLORP Y=NURSE,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 13 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is being glorp -par by the sister . . }
#mess:   A=GLORP X=SISTER,THE Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the cat glorp -ed a cat a stick . . }
#mess:   A=GLORP X=CAT,THE Y=STICK,A Z=CAT,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 5 1 ;link 2 16 2 ;link 3 5 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a boy glorp -ed a stick to the man . . }
#mess:   A=GLORP X=BOY,A Y=STICK,A Z=MAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 16 2 ;link 3 3 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
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
name:{ a dog was glorp -ing a woman a ball . . }
#mess:   A=GLORP X=DOG,A Y=BALL,A Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 6 2 ;link 2 15 2 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 2
t:{word 1.0} 2
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
name:{ the dog was glorp -ing a kite to the girl . . }
#mess:   A=GLORP X=DOG,THE Y=KITE,A Z=GIRL,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 18 2 ;link 3 8 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a nurse was glorp -ing a kite to a boy . . }
#mess:   A=GLORP X=NURSE,A Y=KITE,A Z=BOY,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 18 2 ;link 3 7 2 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the teacher glorp -ed a teacher a kite . . }
#mess:   A=GLORP X=TEACHER,THE Y=KITE,A Z=TEACHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 14 1 ;link 2 18 2 ;link 3 14 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 2
t:{word 1.0} 2
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
name:{ the kite is being glorp -par by a girl . . }
#mess:   A=GLORP X=GIRL,A Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 8 2 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a kite was being glorp -par by the man . . }
#mess:   A=GLORP X=MAN,THE Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a nurse was glorp -ing . . }
#mess:   A=GLORP Y=NURSE,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 13 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister glorp -s a cat a kite . . }
#mess:   A=GLORP X=SISTER,THE Y=KITE,A Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 18 2 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 2
t:{word 1.0} 2
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
name:{ a woman was glorp -ing . . }
#mess:   A=GLORP Y=WOMAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 4 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the mother glorp -ed the toy to a brother . . }
#mess:   A=GLORP X=MOTHER,THE Y=TOY,THE Z=BROTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 10 1 ;link 2 17 1 ;link 3 12 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy was glorp -par by a teacher . . }
#mess:   A=GLORP X=TEACHER,A Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the nurse glorp -ed . . }
#mess:   A=GLORP Y=NURSE,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 13 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a man is glorp -ing . . }
#mess:   A=GLORP Y=MAN,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 3 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog was glorp -ing the brother a toy . . }
#mess:   A=GLORP X=DOG,THE Y=TOY,A Z=BROTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 17 2 ;link 3 12 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ a nurse is glorp -ing a stick . . }
#mess:   A=GLORP X=NURSE,A Y=STICK,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 16 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the dog was glorp -ing the stick to the brother . . }
#mess:   A=GLORP X=DOG,THE Y=STICK,THE Z=BROTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 16 1 ;link 3 12 1 ;tlink 1 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a kite is glorp -par by the father . . }
#mess:   A=GLORP X=FATHER,THE Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a mother glorp -ed . . }
#mess:   A=GLORP Y=MOTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 10 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher was glorp -ing the sister a stick . . }
#mess:   A=GLORP X=TEACHER,A Y=STICK,A Z=SISTER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 16 2 ;link 3 11 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ a mother was glorp -ing . . }
#mess:   A=GLORP Y=MOTHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 10 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick was being glorp -par by the woman . . }
#mess:   A=GLORP X=WOMAN,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 44
t:{word 1.0} 44
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the father glorp -ed the brother a toy . . }
#mess:   A=GLORP X=FATHER,THE Y=TOY,A Z=BROTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 17 2 ;link 3 12 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ a sister glorp -ed a ball . . }
#mess:   A=GLORP X=SISTER,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the brother is glorp -ing a stick to a boy . . }
#mess:   A=GLORP X=BROTHER,THE Y=STICK,A Z=BOY,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 12 1 ;link 2 16 2 ;link 3 7 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the father glorp -ed a toy to a teacher . . }
#mess:   A=GLORP X=FATHER,THE Y=TOY,A Z=TEACHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 9 1 ;link 2 17 2 ;link 3 14 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a teacher is glorp -ing the kite to a teacher . . }
#mess:   A=GLORP X=TEACHER,A Y=KITE,THE Z=TEACHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 18 1 ;link 3 14 2 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the dog glorp -ed the ball to a father . . }
#mess:   A=GLORP X=DOG,THE Y=BALL,THE Z=FATHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 15 1 ;link 3 9 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the brother was glorp -ing . . }
#mess:   A=GLORP Y=BROTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 12 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman glorp -s . . }
#mess:   A=GLORP Y=WOMAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 4 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog glorp -ed the boy the ball . . }
#mess:   A=GLORP X=DOG,THE Y=BALL,THE Z=BOY,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 15 1 ;link 3 7 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 43
t:{word 1.0} 43
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
name:{ the mother was glorp -ing . . }
#mess:   A=GLORP Y=MOTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 10 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a boy is glorp -ing the teacher the stick . . }
#mess:   A=GLORP X=BOY,A Y=STICK,THE Z=TEACHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 16 1 ;link 3 14 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a father was glorp -ing a kite . . }
#mess:   A=GLORP X=FATHER,A Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 9 2 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the stick was glorp -par by the boy . . }
#mess:   A=GLORP X=BOY,THE Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 7 1 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the man glorp -ed the ball . . }
#mess:   A=GLORP X=MAN,THE Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a man was glorp -ing a toy . . }
#mess:   A=GLORP X=MAN,A Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 2 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother is glorp -ing . . }
#mess:   A=GLORP Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the stick is glorp -par by a sister . . }
#mess:   A=GLORP X=SISTER,A Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the girl glorp -s the ball to a nurse . . }
#mess:   A=GLORP X=GIRL,THE Y=BALL,THE Z=NURSE,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 8 1 ;link 2 15 1 ;link 3 13 2 ;tlink 0 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a dog was glorp -ing a stick . . }
#mess:   A=GLORP X=DOG,A Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 6 2 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the man glorp -ed a kite . . }
#mess:   A=GLORP X=MAN,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 3 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a sister glorp -s a kite . . }
#mess:   A=GLORP X=SISTER,A Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 18 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a woman glorp -ed a kite to a boy . . }
#mess:   A=GLORP X=WOMAN,A Y=KITE,A Z=BOY,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 4 2 ;link 2 18 2 ;link 3 7 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a cat was glorp -ing . . }
#mess:   A=GLORP Y=CAT,A E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 5 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother is glorp -ing the toy to the cat . . }
#mess:   A=GLORP X=MOTHER,A Y=TOY,THE Z=CAT,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 17 1 ;link 3 5 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the brother glorp -s . . }
#mess:   A=GLORP Y=BROTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 12 1 ;tlink 0 2 5;} 
6
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the sister glorp -ed the toy . . }
#mess:   A=GLORP X=SISTER,THE Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 11 1 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a sister is glorp -ing a ball . . }
#mess:   A=GLORP X=SISTER,A Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 11 2 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother glorp -ed the toy to a sister . . }
#mess:   A=GLORP X=BROTHER,A Y=TOY,THE Z=SISTER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 17 1 ;link 3 11 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the woman glorp -ed a stick . . }
#mess:   A=GLORP X=WOMAN,THE Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a brother glorp -ed a toy . . }
#mess:   A=GLORP X=BROTHER,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the dog was glorp -ing . . }
#mess:   A=GLORP Y=DOG,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 6 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog is glorp -ing . . }
#mess:   A=GLORP Y=DOG,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 6 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the toy is glorp -par by a nurse . . }
#mess:   A=GLORP X=NURSE,A Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a teacher glorp -ed a kite to a mother . . }
#mess:   A=GLORP X=TEACHER,A Y=KITE,A Z=MOTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 14 2 ;link 2 18 2 ;link 3 10 2 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the boy glorp -s the boy the kite . . }
#mess:   A=GLORP X=BOY,THE Y=KITE,THE Z=BOY,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 7 1 ;link 2 18 1 ;link 3 7 1 ;tlink 0 2 4 6 5;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 1
t:{word 1.0} 1
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
name:{ a nurse is glorp -ing a ball to the girl . . }
#mess:   A=GLORP X=NURSE,A Y=BALL,A Z=GIRL,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 13 2 ;link 2 15 2 ;link 3 8 1 ;tlink 0 3 4 5 -1 6;} 
12
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a mother glorp -s a kite . . }
#mess:   A=GLORP X=MOTHER,A Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 10 2 ;link 2 18 2 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a nurse is glorp -ing . . }
#mess:   A=GLORP Y=NURSE,A E=PRES,PROG,YY  
proc:{ clear ;link 0 31 ;link 2 13 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ the dog glorp -ed the stick to the teacher . . }
#mess:   A=GLORP X=DOG,THE Y=STICK,THE Z=TEACHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 16 1 ;link 3 14 1 ;tlink 1 2 4 5 -1 6;} 
11
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a dog was glorp -ing the cat the kite . . }
#mess:   A=GLORP X=DOG,A Y=KITE,THE Z=CAT,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 31 ;link 1 6 2 ;link 2 18 1 ;link 3 5 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 41
t:{word 1.0} 41
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
name:{ a nurse glorp -s . . }
#mess:   A=GLORP Y=NURSE,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 31 ;link 2 13 2 ;tlink 0 2 5;} 
6
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 31
t:{word 1.0} 31
i:{targ 1.0} 42
t:{word 1.0} 42
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ a toy is glorp -par by the woman . . }
#mess:   A=GLORP X=WOMAN,THE Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 4 1 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
10
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the stick was glorp -par by a brother . . }
#mess:   A=GLORP X=BROTHER,A Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 31 ;link 1 12 2 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
10
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ a boy was glorp -ing the stick . . }
#mess:   A=GLORP X=BOY,A Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 31 ;link 1 7 2 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 2
t:{word 1.0} 2
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 31
t:{word 1.0} 31
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
name:{ the dog glorp -s the stick . . }
#mess:   A=GLORP X=DOG,THE Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 31 ;link 1 6 1 ;link 2 16 1 ;tlink 0 2 4 5;} 
8
i:{targ 1.0} 1
t:{word 1.0} 1
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 31
t:{word 1.0} 31
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