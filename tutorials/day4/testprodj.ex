
#roles: A X Y Z B C
#semantics: :DET THE A :NOUN MAN WOMAN CAT DOG BOY GIRL FATHER MOTHER SISTER BROTHER NURSE TEACHER BALL STICK TOY KITE :VERB SLEEP JUMP WALK RUN PUSH HIT KICK CARRY GIVE THROW SHOW PRESENT GLORP :GA GA :NI NI :WO WO :TA TA :TE TE :ITA ITA :IRU IRU :PER .
#lexicon: :det the a :noun man woman cat dog boy girl father mother sister brother nurse teacher ball stick toy kite :verb sleep jump walk run push hit kick carry give throw show present glorp :ga ga :ni ni :wo wo :ta ta :te te :ita ita :iru iru :per .
#eventsemantics: PRES PAST SIMP PROG XX YY ZZ CC DD
name:{ brother ga ball wo kick te ita . . }
#mess:   A=KICK X=BROTHER,A Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 2 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo sister ga hit te ita . . }
#mess:   A=HIT X=SISTER,THE Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 24
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga stick wo father ni throw ta . . }
#mess:   A=THROW X=BROTHER,A Y=STICK,THE Z=FATHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 16 1 ;link 3 9 1 ;tlink 1 2 4 5 -1 6;} 
10
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga run . . }
#mess:   A=RUN Y=MOTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 10 1 ;tlink 0 2 5;} 
5
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ cat ga mother ni toy wo show te ita . . }
#mess:   A=SHOW X=CAT,A Y=TOY,THE Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 17 1 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga stick wo hit te ita . . }
#mess:   A=HIT X=WOMAN,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga stick wo nurse ni present te iru . . }
#mess:   A=PRESENT X=BROTHER,A Y=STICK,A Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 16 2 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
11
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga sleep . . }
#mess:   A=SLEEP Y=MOTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 10 2 ;tlink 0 2 5;} 
5
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo teacher ni throw te ita . . }
#mess:   A=THROW X=GIRL,A Y=KITE,A Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 8 2 ;link 2 18 2 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 14
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo carry ta . . }
#mess:   A=CARRY X=BROTHER,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ cat ga run ta . . }
#mess:   A=RUN Y=CAT,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 5 2 ;tlink 1 2 5;} 
6
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga kite wo mother ni give te iru . . }
#mess:   A=GIVE X=BOY,A Y=KITE,THE Z=MOTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 2 ;link 2 18 1 ;link 3 10 2 ;tlink 0 3 4 5 -1 6;} 
11
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga kite wo mother ni give . . }
#mess:   A=GIVE X=SISTER,THE Y=KITE,THE Z=MOTHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 18 1 ;link 3 10 1 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga toy wo man ni present ta . . }
#mess:   A=PRESENT X=MOTHER,A Y=TOY,THE Z=MAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 2 ;link 2 17 1 ;link 3 3 2 ;tlink 1 2 4 5 -1 6;} 
10
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 3
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga toy wo kick ta . . }
#mess:   A=KICK X=MOTHER,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 10 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ man ga walk ta . . }
#mess:   A=WALK Y=MAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 3 2 ;tlink 1 2 5;} 
6
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ kite wo girl ga push te ita . . }
#mess:   A=PUSH X=GIRL,A Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 8 2 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
9
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga sleep ta . . }
#mess:   A=SLEEP Y=WOMAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 4 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ man ga kite wo kick . . }
#mess:   A=KICK X=MAN,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
7
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga nurse ni stick wo show te iru . . }
#mess:   A=SHOW X=BROTHER,THE Y=STICK,THE Z=NURSE,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 16 1 ;link 3 13 1 ;tlink 0 3 4 6 5;} 
11
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo girl ni throw te iru . . }
#mess:   A=THROW X=DOG,THE Y=STICK,A Z=GIRL,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 6 1 ;link 2 16 2 ;link 3 8 2 ;tlink 0 3 4 5 -1 6;} 
11
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 8
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga toy wo nurse ni throw . . }
#mess:   A=THROW X=BROTHER,THE Y=TOY,A Z=NURSE,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 17 2 ;link 3 13 1 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga boy ni kite wo give . . }
#mess:   A=GIVE X=FATHER,THE Y=KITE,THE Z=BOY,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 18 1 ;link 3 7 2 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 7
t:{word 1.0} 33
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga stick wo nurse ni present . . }
#mess:   A=PRESENT X=FATHER,THE Y=STICK,A Z=NURSE,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 9 1 ;link 2 16 2 ;link 3 13 1 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga run ta . . }
#mess:   A=RUN Y=BROTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 12 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga stick wo push te ita . . }
#mess:   A=PUSH X=BROTHER,A Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 12 2 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga stick wo kick te ita . . }
#mess:   A=KICK X=TEACHER,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo mother ni show te ita . . }
#mess:   A=SHOW X=SISTER,A Y=BALL,A Z=MOTHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 15 2 ;link 3 10 2 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga ball wo cat ni present . . }
#mess:   A=PRESENT X=DOG,A Y=BALL,A Z=CAT,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 15 2 ;link 3 5 1 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 5
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga ball wo push te iru . . }
#mess:   A=PUSH X=DOG,THE Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga walk ta . . }
#mess:   A=WALK Y=FATHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 9 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga run ta . . }
#mess:   A=RUN Y=TEACHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 14 2 ;tlink 1 2 5;} 
6
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga father ni kite wo throw te iru . . }
#mess:   A=THROW X=NURSE,THE Y=KITE,THE Z=FATHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 13 1 ;link 2 18 1 ;link 3 9 2 ;tlink 0 3 4 6 5;} 
11
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 28
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ stick wo nurse ga push te iru . . }
#mess:   A=PUSH X=NURSE,THE Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 13 1 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
9
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga kite wo kick ta . . }
#mess:   A=KICK X=BOY,THE Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 7 1 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga girl ni toy wo show . . }
#mess:   A=SHOW X=WOMAN,THE Y=TOY,THE Z=GIRL,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 1 ;link 2 17 1 ;link 3 8 1 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 8
t:{word 1.0} 33
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo push te ita . . }
#mess:   A=PUSH X=SISTER,THE Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 1 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga toy wo man ni give te iru . . }
#mess:   A=GIVE X=BOY,THE Y=TOY,THE Z=MAN,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 17 1 ;link 3 3 1 ;tlink 0 3 4 5 -1 6;} 
11
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 3
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga kite wo man ni present . . }
#mess:   A=PRESENT X=WOMAN,A Y=KITE,THE Z=MAN,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 4 2 ;link 2 18 1 ;link 3 3 1 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 3
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga sleep ta . . }
#mess:   A=SLEEP Y=NURSE,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 13 2 ;tlink 1 2 5;} 
6
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ cat ga mother ni stick wo show te iru . . }
#mess:   A=SHOW X=CAT,A Y=STICK,A Z=MOTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 16 2 ;link 3 10 2 ;tlink 0 3 4 6 5;} 
11
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ stick wo nurse ga carry . . }
#mess:   A=CARRY X=NURSE,THE Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 13 1 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ stick wo brother ga carry te iru . . }
#mess:   A=CARRY X=BROTHER,A Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
9
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga run ta . . }
#mess:   A=RUN Y=BOY,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 7 2 ;tlink 1 2 5;} 
6
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ kite wo brother ga carry te iru . . }
#mess:   A=CARRY X=BROTHER,THE Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 12 1 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
9
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo woman ga kick ta . . }
#mess:   A=KICK X=WOMAN,A Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 4 2 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga ball wo boy ni present ta . . }
#mess:   A=PRESENT X=NURSE,THE Y=BALL,A Z=BOY,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 13 1 ;link 2 15 2 ;link 3 7 1 ;tlink 1 2 4 5 -1 6;} 
10
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 7
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo carry ta . . }
#mess:   A=CARRY X=GIRL,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga woman ni ball wo throw te iru . . }
#mess:   A=THROW X=WOMAN,A Y=BALL,THE Z=WOMAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 4 2 ;link 2 15 1 ;link 3 4 1 ;tlink 0 3 4 6 5;} 
11
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 4
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 28
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga toy wo father ni throw te ita . . }
#mess:   A=THROW X=BROTHER,A Y=TOY,THE Z=FATHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 17 1 ;link 3 9 2 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga walk ta . . }
#mess:   A=WALK Y=GIRL,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 8 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ kite wo sister ga kick te iru . . }
#mess:   A=KICK X=SISTER,A Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 11 2 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
9
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga teacher ni stick wo show te iru . . }
#mess:   A=SHOW X=MOTHER,A Y=STICK,THE Z=TEACHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 2 ;link 2 16 1 ;link 3 14 1 ;tlink 0 3 4 6 5;} 
11
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 14
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo sister ni give ta . . }
#mess:   A=GIVE X=SISTER,A Y=BALL,THE Z=SISTER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 15 1 ;link 3 11 1 ;tlink 1 2 4 5 -1 6;} 
10
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 11
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga walk . . }
#mess:   A=WALK Y=BROTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 12 1 ;tlink 0 2 5;} 
5
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo father ni throw te ita . . }
#mess:   A=THROW X=FATHER,THE Y=BALL,A Z=FATHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 1 ;link 2 15 2 ;link 3 9 1 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga ball wo boy ni present . . }
#mess:   A=PRESENT X=MOTHER,THE Y=BALL,THE Z=BOY,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 1 ;link 2 15 1 ;link 3 7 1 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 7
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo carry . . }
#mess:   A=CARRY X=DOG,THE Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga mother ni kite wo give te ita . . }
#mess:   A=GIVE X=BROTHER,THE Y=KITE,A Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 1 ;link 2 18 2 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga stick wo teacher ni throw . . }
#mess:   A=THROW X=WOMAN,A Y=STICK,THE Z=TEACHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 2 ;link 2 16 1 ;link 3 14 2 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 14
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga ball wo push . . }
#mess:   A=PUSH X=WOMAN,A Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 4 2 ;link 2 15 1 ;tlink 0 2 4 5;} 
7
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga toy wo carry te iru . . }
#mess:   A=CARRY X=DOG,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga woman ni stick wo present ta . . }
#mess:   A=PRESENT X=WOMAN,A Y=STICK,A Z=WOMAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 4 2 ;link 2 16 2 ;link 3 4 2 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 4
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 30
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga toy wo carry te ita . . }
#mess:   A=CARRY X=FATHER,THE Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 1 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga jump ta . . }
#mess:   A=JUMP Y=WOMAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 4 2 ;tlink 1 2 5;} 
6
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 20
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo dog ga kick ta . . }
#mess:   A=KICK X=DOG,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 6 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
8
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga mother ni stick wo show te ita . . }
#mess:   A=SHOW X=SISTER,THE Y=STICK,THE Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 1 ;link 2 16 1 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo push te ita . . }
#mess:   A=PUSH X=SISTER,A Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 2 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ stick wo dog ga push te iru . . }
#mess:   A=PUSH X=DOG,THE Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
9
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga toy wo kick . . }
#mess:   A=KICK X=BROTHER,A Y=TOY,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 2 ;link 2 17 2 ;tlink 0 2 4 5;} 
7
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga walk . . }
#mess:   A=WALK Y=BOY,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 7 2 ;tlink 0 2 5;} 
5
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ ball wo sister ga kick . . }
#mess:   A=KICK X=SISTER,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 11 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga mother ni kite wo give . . }
#mess:   A=GIVE X=WOMAN,A Y=KITE,A Z=MOTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 18 2 ;link 3 10 2 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga ball wo nurse ni give te ita . . }
#mess:   A=GIVE X=NURSE,THE Y=BALL,A Z=NURSE,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 13 1 ;link 2 15 2 ;link 3 13 1 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga sleep . . }
#mess:   A=SLEEP Y=GIRL,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 8 2 ;tlink 0 2 5;} 
5
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga walk . . }
#mess:   A=WALK Y=FATHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 9 2 ;tlink 0 2 5;} 
5
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga toy wo sister ni show te ita . . }
#mess:   A=SHOW X=NURSE,A Y=TOY,THE Z=SISTER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 17 1 ;link 3 11 2 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 11
t:{word 1.0} 33
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga walk te ita . . }
#mess:   A=WALK Y=TEACHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 14 1 ;tlink 1 3 5;} 
7
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga father ni ball wo present te iru . . }
#mess:   A=PRESENT X=SISTER,A Y=BALL,THE Z=FATHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 11 2 ;link 2 15 1 ;link 3 9 2 ;tlink 0 3 4 6 5;} 
11
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 30
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo father ga kick te iru . . }
#mess:   A=KICK X=FATHER,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
9
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga walk ta . . }
#mess:   A=WALK Y=NURSE,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 13 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga sleep te iru . . }
#mess:   A=SLEEP Y=NURSE,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 13 1 ;tlink 0 3 5;} 
7
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ ball wo woman ga carry ta . . }
#mess:   A=CARRY X=WOMAN,THE Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 1 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
8
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga cat ni ball wo give . . }
#mess:   A=GIVE X=FATHER,THE Y=BALL,A Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 15 2 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 5
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo nurse ga hit . . }
#mess:   A=HIT X=NURSE,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 13 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 24
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo hit ta . . }
#mess:   A=HIT X=SISTER,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga toy wo hit te iru . . }
#mess:   A=HIT X=BROTHER,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 12 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ ball wo man ga carry . . }
#mess:   A=CARRY X=MAN,A Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo push . . }
#mess:   A=PUSH X=GIRL,A Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 8 2 ;link 2 15 2 ;tlink 0 2 4 5;} 
7
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ man ga brother ni stick wo give ta . . }
#mess:   A=GIVE X=MAN,A Y=STICK,A Z=BROTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 3 2 ;link 2 16 2 ;link 3 12 1 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 12
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump te ita . . }
#mess:   A=JUMP Y=FATHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 9 2 ;tlink 1 3 5;} 
7
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 20
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ ball wo nurse ga kick te iru . . }
#mess:   A=KICK X=NURSE,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga cat ni kite wo throw te iru . . }
#mess:   A=THROW X=NURSE,THE Y=KITE,A Z=CAT,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 13 1 ;link 2 18 2 ;link 3 5 1 ;tlink 0 3 4 6 5;} 
11
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 5
t:{word 1.0} 33
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 28
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ cat ga mother ni toy wo present te ita . . }
#mess:   A=PRESENT X=CAT,THE Y=TOY,A Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 17 2 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 30
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga toy wo girl ni give te iru . . }
#mess:   A=GIVE X=TEACHER,THE Y=TOY,A Z=GIRL,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 17 2 ;link 3 8 2 ;tlink 0 3 4 5 -1 6;} 
11
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 8
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo boy ni give . . }
#mess:   A=GIVE X=TEACHER,A Y=KITE,THE Z=BOY,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 18 1 ;link 3 7 1 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 7
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ ball wo father ga push . . }
#mess:   A=PUSH X=FATHER,THE Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 9 1 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga sister ni toy wo show te ita . . }
#mess:   A=SHOW X=SISTER,A Y=TOY,THE Z=SISTER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 17 1 ;link 3 11 2 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 11
t:{word 1.0} 33
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sleep . . }
#mess:   A=SLEEP Y=BROTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 12 1 ;tlink 0 2 5;} 
5
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga mother ni kite wo give te ita . . }
#mess:   A=GIVE X=TEACHER,A Y=KITE,A Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 18 2 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga ball wo woman ni throw . . }
#mess:   A=THROW X=TEACHER,THE Y=BALL,THE Z=WOMAN,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 15 1 ;link 3 4 2 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 4
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sleep te ita . . }
#mess:   A=SLEEP Y=TEACHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 14 1 ;tlink 1 3 5;} 
7
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga toy wo nurse ni present . . }
#mess:   A=PRESENT X=MOTHER,A Y=TOY,THE Z=NURSE,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 2 ;link 2 17 1 ;link 3 13 2 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga walk ta . . }
#mess:   A=WALK Y=WOMAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 4 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo push te iru . . }
#mess:   A=PUSH X=DOG,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga toy wo teacher ni give ta . . }
#mess:   A=GIVE X=WOMAN,THE Y=TOY,A Z=TEACHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 1 ;link 2 17 2 ;link 3 14 2 ;tlink 1 2 4 5 -1 6;} 
10
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 14
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga toy wo father ni present ta . . }
#mess:   A=PRESENT X=BROTHER,A Y=TOY,THE Z=FATHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 17 1 ;link 3 9 1 ;tlink 1 2 4 5 -1 6;} 
10
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga brother ni stick wo show ta . . }
#mess:   A=SHOW X=SISTER,A Y=STICK,THE Z=BROTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 16 1 ;link 3 12 1 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 12
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo hit . . }
#mess:   A=HIT X=SISTER,THE Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 15 2 ;tlink 0 2 4 5;} 
7
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ stick wo boy ga push . . }
#mess:   A=PUSH X=BOY,THE Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 7 1 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga run . . }
#mess:   A=RUN Y=SISTER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 11 1 ;tlink 0 2 5;} 
5
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga kite wo woman ni present te iru . . }
#mess:   A=PRESENT X=MOTHER,THE Y=KITE,THE Z=WOMAN,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 1 ;link 2 18 1 ;link 3 4 1 ;tlink 0 3 4 5 -1 6;} 
11
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 4
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga teacher ni ball wo give . . }
#mess:   A=GIVE X=DOG,A Y=BALL,THE Z=TEACHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 15 1 ;link 3 14 2 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 14
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga toy wo kick te ita . . }
#mess:   A=KICK X=FATHER,A Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ cat ga dog ni ball wo present ta . . }
#mess:   A=PRESENT X=CAT,THE Y=BALL,THE Z=DOG,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 15 1 ;link 3 6 2 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 6
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 30
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga jump te ita . . }
#mess:   A=JUMP Y=BROTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 12 1 ;tlink 1 3 5;} 
7
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 20
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ cat ga dog ni ball wo show te ita . . }
#mess:   A=SHOW X=CAT,THE Y=BALL,A Z=DOG,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 15 2 ;link 3 6 1 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 6
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga man ni stick wo give te iru . . }
#mess:   A=GIVE X=BOY,THE Y=STICK,THE Z=MAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 16 1 ;link 3 3 1 ;tlink 0 3 4 6 5;} 
11
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 3
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga stick wo push ta . . }
#mess:   A=PUSH X=GIRL,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 8 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ man ga nurse ni ball wo give . . }
#mess:   A=GIVE X=MAN,A Y=BALL,THE Z=NURSE,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 3 2 ;link 2 15 1 ;link 3 13 1 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga sleep te ita . . }
#mess:   A=SLEEP Y=GIRL,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 8 2 ;tlink 1 3 5;} 
7
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga stick wo push . . }
#mess:   A=PUSH X=MOTHER,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 10 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga stick wo boy ni show . . }
#mess:   A=SHOW X=WOMAN,A Y=STICK,THE Z=BOY,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 16 1 ;link 3 7 2 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 7
t:{word 1.0} 33
t:{word 1.0} 29
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ kite wo cat ga hit . . }
#mess:   A=HIT X=CAT,A Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 2 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 24
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo man ga push ta . . }
#mess:   A=PUSH X=MAN,A Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
8
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga sleep . . }
#mess:   A=SLEEP Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 6 2 ;tlink 0 2 5;} 
5
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo nurse ni give te ita . . }
#mess:   A=GIVE X=BROTHER,THE Y=BALL,THE Z=NURSE,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 12 1 ;link 2 15 1 ;link 3 13 2 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga dog ni ball wo throw ta . . }
#mess:   A=THROW X=GIRL,THE Y=BALL,A Z=DOG,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 1 ;link 2 15 2 ;link 3 6 2 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 6
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 28
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ ball wo cat ga kick . . }
#mess:   A=KICK X=CAT,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 5 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo teacher ga carry te iru . . }
#mess:   A=CARRY X=TEACHER,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 14 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
9
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga boy ni stick wo show te ita . . }
#mess:   A=SHOW X=GIRL,A Y=STICK,THE Z=BOY,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 16 1 ;link 3 7 2 ;tlink 1 3 4 6 5;} 
11
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 7
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo cat ni throw te ita . . }
#mess:   A=THROW X=GIRL,A Y=KITE,A Z=CAT,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 8 2 ;link 2 18 2 ;link 3 5 2 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 5
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga toy wo boy ni present ta . . }
#mess:   A=PRESENT X=MOTHER,THE Y=TOY,THE Z=BOY,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 1 ;link 2 17 1 ;link 3 7 1 ;tlink 1 2 4 5 -1 6;} 
10
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 7
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo sister ga carry te ita . . }
#mess:   A=CARRY X=SISTER,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 11 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
9
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga walk . . }
#mess:   A=WALK Y=GIRL,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 8 1 ;tlink 0 2 5;} 
5
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga kite wo brother ni present ta . . }
#mess:   A=PRESENT X=WOMAN,A Y=KITE,A Z=BROTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 4 2 ;link 2 18 2 ;link 3 12 2 ;tlink 1 2 4 5 -1 6;} 
10
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 12
t:{word 1.0} 33
t:{word 1.0} 30
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo nurse ni throw te ita . . }
#mess:   A=THROW X=NURSE,A Y=STICK,A Z=NURSE,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 16 2 ;link 3 13 2 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga walk ta . . }
#mess:   A=WALK Y=WOMAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 4 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 21
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga run te ita . . }
#mess:   A=RUN Y=SISTER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 11 1 ;tlink 1 3 5;} 
7
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ cat ga run . . }
#mess:   A=RUN Y=CAT,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 5 2 ;tlink 0 2 5;} 
5
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga brother ni stick wo give . . }
#mess:   A=GIVE X=GIRL,A Y=STICK,THE Z=BROTHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 8 2 ;link 2 16 1 ;link 3 12 1 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 12
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga toy wo dog ni give te ita . . }
#mess:   A=GIVE X=FATHER,THE Y=TOY,THE Z=DOG,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 17 1 ;link 3 6 1 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 6
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo carry te ita . . }
#mess:   A=CARRY X=NURSE,A Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 13 2 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 26
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga girl ni toy wo throw ta . . }
#mess:   A=THROW X=DOG,A Y=TOY,THE Z=GIRL,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 6 2 ;link 2 17 1 ;link 3 8 1 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 8
t:{word 1.0} 33
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 28
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo father ni give ta . . }
#mess:   A=GIVE X=SISTER,A Y=STICK,A Z=FATHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 16 2 ;link 3 9 1 ;tlink 1 2 4 5 -1 6;} 
10
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga run ta . . }
#mess:   A=RUN Y=NURSE,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 13 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ man ga father ni kite wo show ta . . }
#mess:   A=SHOW X=MAN,THE Y=KITE,THE Z=FATHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 18 1 ;link 3 9 1 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ ball wo woman ga hit ta . . }
#mess:   A=HIT X=WOMAN,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
8
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 24
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo man ga kick te iru . . }
#mess:   A=KICK X=MAN,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
9
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo brother ni give te ita . . }
#mess:   A=GIVE X=FATHER,A Y=KITE,THE Z=BROTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 18 1 ;link 3 12 1 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 12
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga run te ita . . }
#mess:   A=RUN Y=DOG,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 6 2 ;tlink 1 3 5;} 
7
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga toy wo kick ta . . }
#mess:   A=KICK X=NURSE,THE Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump ta . . }
#mess:   A=JUMP Y=FATHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 9 2 ;tlink 1 2 5;} 
6
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 20
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ woman ga toy wo mother ni give te ita . . }
#mess:   A=GIVE X=WOMAN,THE Y=TOY,THE Z=MOTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 1 ;link 2 17 1 ;link 3 10 1 ;tlink 1 3 4 5 -1 6;} 
11
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga run te iru . . }
#mess:   A=RUN Y=MOTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 10 1 ;tlink 0 3 5;} 
7
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga man ni ball wo show te iru . . }
#mess:   A=SHOW X=FATHER,THE Y=BALL,A Z=MAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 15 2 ;link 3 3 1 ;tlink 0 3 4 6 5;} 
11
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 3
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ man ga run te ita . . }
#mess:   A=RUN Y=MAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 3 2 ;tlink 1 3 5;} 
7
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga ball wo kick te iru . . }
#mess:   A=KICK X=NURSE,THE Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga jump ta . . }
#mess:   A=JUMP Y=BOY,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 7 1 ;tlink 1 2 5;} 
6
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 20
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga brother ni kite wo throw ta . . }
#mess:   A=THROW X=TEACHER,THE Y=KITE,THE Z=BROTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 18 1 ;link 3 12 2 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 12
t:{word 1.0} 33
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 28
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ ball wo brother ga kick te ita . . }
#mess:   A=KICK X=BROTHER,A Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 12 2 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
9
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ kite wo teacher ga carry te ita . . }
#mess:   A=CARRY X=TEACHER,THE Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 14 1 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
9
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo hit ta . . }
#mess:   A=HIT X=GIRL,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 8 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo girl ga kick ta . . }
#mess:   A=KICK X=GIRL,THE Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 8 1 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 25
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga sleep te iru . . }
#mess:   A=SLEEP Y=GIRL,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 8 2 ;tlink 0 3 5;} 
7
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga stick wo dog ni give . . }
#mess:   A=GIVE X=GIRL,THE Y=STICK,THE Z=DOG,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 16 1 ;link 3 6 1 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 6
t:{word 1.0} 33
t:{word 1.0} 27
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo girl ga push ta . . }
#mess:   A=PUSH X=GIRL,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 8 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
8
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga stick wo hit ta . . }
#mess:   A=HIT X=TEACHER,THE Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga mother ni toy wo present ta . . }
#mess:   A=PRESENT X=TEACHER,THE Y=TOY,A Z=MOTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 14 1 ;link 2 17 2 ;link 3 10 2 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 30
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga stick wo nurse ni show . . }
#mess:   A=SHOW X=GIRL,THE Y=STICK,THE Z=NURSE,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 16 1 ;link 3 13 1 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 29
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga father ni toy wo show . . }
#mess:   A=SHOW X=BOY,A Y=TOY,A Z=FATHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 2 ;link 2 17 2 ;link 3 9 1 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga father ni ball wo show ta . . }
#mess:   A=SHOW X=FATHER,THE Y=BALL,THE Z=FATHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 15 1 ;link 3 9 1 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga girl ni kite wo show ta . . }
#mess:   A=SHOW X=TEACHER,A Y=KITE,THE Z=GIRL,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 14 2 ;link 2 18 1 ;link 3 8 2 ;tlink 1 2 4 6 5;} 
10
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 8
t:{word 1.0} 33
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga mother ni toy wo show . . }
#mess:   A=SHOW X=BOY,THE Y=TOY,THE Z=MOTHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 1 ;link 2 17 1 ;link 3 10 1 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 10
t:{word 1.0} 33
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 29
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo teacher ga push . . }
#mess:   A=PUSH X=TEACHER,THE Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 14 1 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 14
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga toy wo kick te iru . . }
#mess:   A=KICK X=DOG,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 25
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ stick wo man ga carry . . }
#mess:   A=CARRY X=MAN,A Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo nurse ni show te iru . . }
#mess:   A=SHOW X=FATHER,THE Y=BALL,A Z=NURSE,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 15 2 ;link 3 13 2 ;tlink 0 3 4 5 -1 6;} 
11
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ ball wo cat ga push . . }
#mess:   A=PUSH X=CAT,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ ball wo dog ga hit . . }
#mess:   A=HIT X=DOG,A Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 24
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ brother ga brother ni ball wo present . . }
#mess:   A=PRESENT X=BROTHER,A Y=BALL,THE Z=BROTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 15 1 ;link 3 12 2 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 12
t:{word 1.0} 32
t:{word 1.0} 12
t:{word 1.0} 33
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 30
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ stick wo nurse ga carry te ita . . }
#mess:   A=CARRY X=NURSE,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 13 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
9
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga boy ni stick wo present . . }
#mess:   A=PRESENT X=BOY,A Y=STICK,THE Z=BOY,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 7 2 ;link 2 16 1 ;link 3 7 1 ;tlink 0 2 4 6 5;} 
9
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 7
t:{word 1.0} 33
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 30
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ kite wo dog ga push . . }
#mess:   A=PUSH X=DOG,THE Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ mother ga sleep te iru . . }
#mess:   A=SLEEP Y=MOTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 10 1 ;tlink 0 3 5;} 
7
t:{word 1.0} 10
t:{word 1.0} 32
t:{word 1.0} 19
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ stick wo woman ga hit te iru . . }
#mess:   A=HIT X=WOMAN,THE Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
9
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 24
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga stick wo brother ni show te iru . . }
#mess:   A=SHOW X=BOY,THE Y=STICK,A Z=BROTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 7 1 ;link 2 16 2 ;link 3 12 2 ;tlink 0 3 4 5 -1 6;} 
11
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 12
t:{word 1.0} 33
t:{word 1.0} 29
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo father ni throw . . }
#mess:   A=THROW X=GIRL,THE Y=BALL,A Z=FATHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 8 1 ;link 2 15 2 ;link 3 9 1 ;tlink 0 2 4 5 -1 6;} 
9
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 9
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ cat ga ball wo push te ita . . }
#mess:   A=PUSH X=CAT,A Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 15
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo man ga push . . }
#mess:   A=PUSH X=MAN,A Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
7
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 23
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo boy ga carry ta . . }
#mess:   A=CARRY X=BOY,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 7 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
8
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo man ga hit te ita . . }
#mess:   A=HIT X=MAN,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 3 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
9
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 3
t:{word 1.0} 32
t:{word 1.0} 24
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga toy wo nurse ni throw ta . . }
#mess:   A=THROW X=DOG,A Y=TOY,A Z=NURSE,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 6 2 ;link 2 17 2 ;link 3 13 2 ;tlink 1 2 4 5 -1 6;} 
10
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 13
t:{word 1.0} 33
t:{word 1.0} 28
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ sister ga cat ni kite wo give te iru . . }
#mess:   A=GIVE X=SISTER,THE Y=KITE,THE Z=CAT,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 18 1 ;link 3 5 1 ;tlink 0 3 4 6 5;} 
11
t:{word 1.0} 11
t:{word 1.0} 32
t:{word 1.0} 5
t:{word 1.0} 33
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 27
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo woman ga carry te ita . . }
#mess:   A=CARRY X=WOMAN,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 4
t:{word 1.0} 32
t:{word 1.0} 26
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ cat ga jump te iru . . }
#mess:   A=JUMP Y=CAT,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 5 1 ;tlink 0 3 5;} 
7
t:{word 1.0} 5
t:{word 1.0} 32
t:{word 1.0} 20
t:{word 1.0} 36
t:{word 1.0} 38
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ girl ga stick wo push te ita . . }
#mess:   A=PUSH X=GIRL,A Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 8 2 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
t:{word 1.0} 8
t:{word 1.0} 32
t:{word 1.0} 16
t:{word 1.0} 34
t:{word 1.0} 23
t:{word 1.0} 36
t:{word 1.0} 37
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ boy ga run . . }
#mess:   A=RUN Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 7 1 ;tlink 0 2 5;} 
5
t:{word 1.0} 7
t:{word 1.0} 32
t:{word 1.0} 22
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ toy wo father ga hit ta . . }
#mess:   A=HIT X=FATHER,THE Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 9 1 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
t:{word 1.0} 17
t:{word 1.0} 34
t:{word 1.0} 9
t:{word 1.0} 32
t:{word 1.0} 24
t:{word 1.0} 35
t:{word 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo hit . . }
#mess:   A=HIT X=DOG,THE Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 18 2 ;tlink 0 2 4 5;} 
7
t:{word 1.0} 6
t:{word 1.0} 32
t:{word 1.0} 18
t:{word 1.0} 34
t:{word 1.0} 24
t:{word 1.0} 39
t:{word 1.0} 39;
