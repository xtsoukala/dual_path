
#roles: A X Y Z B C
#semantics: :DET THE A :NOUN MAN WOMAN CAT DOG BOY GIRL FATHER MOTHER SISTER BROTHER NURSE TEACHER BALL STICK TOY KITE :VERB SLEEP JUMP WALK RUN PUSH HIT KICK CARRY GIVE THROW SHOW PRESENT GLORP :GA GA :NI NI :WO WO :TA TA :TE TE :ITA ITA :IRU IRU :PER .
#lexicon: :det the a :noun man woman cat dog boy girl father mother sister brother nurse teacher ball stick toy kite :verb sleep jump walk run push hit kick carry give throw show present glorp :ga ga :ni ni :wo wo :ta ta :te te :ita ita :iru iru :per .
#eventsemantics: PRES PAST SIMP PROG XX YY ZZ CC DD
name:{ father ga woman ni kite wo throw te iru . . }
#mess:   A=THROW X=FATHER,THE Y=KITE,A Z=WOMAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 9 1 ;link 2 18 2 ;link 3 4 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga stick wo carry te ita . . }
#mess:   A=CARRY X=FATHER,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga walk te ita . . }
#mess:   A=WALK Y=CAT,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga cat ni kite wo give . . }
#mess:   A=GIVE X=BROTHER,A Y=KITE,THE Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 18 1 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga run ta . . }
#mess:   A=RUN Y=CAT,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 5 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo boy ni show . . }
#mess:   A=SHOW X=NURSE,A Y=STICK,THE Z=BOY,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 16 1 ;link 3 7 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga ball wo brother ni give te iru . . }
#mess:   A=GIVE X=BOY,A Y=BALL,THE Z=BROTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 2 ;link 2 15 1 ;link 3 12 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga walk . . }
#mess:   A=WALK Y=MAN,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 3 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga run . . }
#mess:   A=RUN Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 7 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo hit . . }
#mess:   A=HIT X=FATHER,A Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 9 2 ;link 2 18 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga ball wo hit te ita . . }
#mess:   A=HIT X=MAN,A Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 2 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga stick wo carry . . }
#mess:   A=CARRY X=GIRL,A Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 16 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga stick wo nurse ni show . . }
#mess:   A=SHOW X=MAN,THE Y=STICK,A Z=NURSE,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 16 2 ;link 3 13 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga toy wo teacher ni give te iru . . }
#mess:   A=GIVE X=BOY,THE Y=TOY,THE Z=TEACHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 17 1 ;link 3 14 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga kite wo push te iru . . }
#mess:   A=PUSH X=MOTHER,A Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 10 2 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga father ni kite wo show . . }
#mess:   A=SHOW X=GIRL,THE Y=KITE,THE Z=FATHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 18 1 ;link 3 9 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga toy wo woman ni present . . }
#mess:   A=PRESENT X=DOG,THE Y=TOY,THE Z=WOMAN,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 6 1 ;link 2 17 1 ;link 3 4 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga woman ni stick wo give te ita . . }
#mess:   A=GIVE X=TEACHER,A Y=STICK,A Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 16 2 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo cat ga kick te ita . . }
#mess:   A=KICK X=CAT,THE Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 5 1 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo man ga kick ta . . }
#mess:   A=KICK X=MAN,THE Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 3 1 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga ball wo hit . . }
#mess:   A=HIT X=WOMAN,A Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 15 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga stick wo push . . }
#mess:   A=PUSH X=BOY,THE Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 7 1 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga toy wo nurse ni present te ita . . }
#mess:   A=PRESENT X=BROTHER,A Y=TOY,A Z=NURSE,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 17 2 ;link 3 13 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga toy wo kick ta . . }
#mess:   A=KICK X=MAN,THE Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 3 1 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga walk te ita . . }
#mess:   A=WALK Y=FATHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 9 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga stick wo man ni give te ita . . }
#mess:   A=GIVE X=MOTHER,THE Y=STICK,THE Z=MAN,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 10 1 ;link 2 16 1 ;link 3 3 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga kite wo brother ni show te iru . . }
#mess:   A=SHOW X=SISTER,A Y=KITE,A Z=BROTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 18 2 ;link 3 12 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo hit te iru . . }
#mess:   A=HIT X=GIRL,THE Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga jump te iru . . }
#mess:   A=JUMP Y=CAT,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 5 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo brother ni throw . . }
#mess:   A=THROW X=BROTHER,A Y=BALL,THE Z=BROTHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 15 1 ;link 3 12 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sleep te ita . . }
#mess:   A=SLEEP Y=TEACHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 14 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga jump te ita . . }
#mess:   A=JUMP Y=NURSE,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 13 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga kite wo carry . . }
#mess:   A=CARRY X=WOMAN,A Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 18 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga toy wo push . . }
#mess:   A=PUSH X=CAT,A Y=TOY,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 17 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga ball wo hit ta . . }
#mess:   A=HIT X=NURSE,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 13 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga toy wo carry ta . . }
#mess:   A=CARRY X=TEACHER,A Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 14 2 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga sleep te iru . . }
#mess:   A=SLEEP Y=CAT,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 5 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump te iru . . }
#mess:   A=JUMP Y=FATHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 9 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga dog ni kite wo throw te ita . . }
#mess:   A=THROW X=TEACHER,A Y=KITE,THE Z=DOG,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 18 1 ;link 3 6 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga jump te ita . . }
#mess:   A=JUMP Y=TEACHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 14 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga jump te ita . . }
#mess:   A=JUMP Y=TEACHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 14 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga man ni ball wo throw . . }
#mess:   A=THROW X=TEACHER,THE Y=BALL,THE Z=MAN,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 15 1 ;link 3 3 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo woman ga kick te iru . . }
#mess:   A=KICK X=WOMAN,THE Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 4 1 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo carry te ita . . }
#mess:   A=CARRY X=TEACHER,THE Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 14 1 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga sleep . . }
#mess:   A=SLEEP Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 6 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga cat ni toy wo throw te iru . . }
#mess:   A=THROW X=CAT,THE Y=TOY,THE Z=CAT,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 5 1 ;link 2 17 1 ;link 3 5 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga ball wo mother ni show ta . . }
#mess:   A=SHOW X=WOMAN,A Y=BALL,THE Z=MOTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 15 1 ;link 3 10 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo carry te iru . . }
#mess:   A=CARRY X=NURSE,THE Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 13 1 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga hit ta . . }
#mess:   A=HIT X=MOTHER,A Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 2 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo push . . }
#mess:   A=PUSH X=FATHER,THE Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 9 1 ;link 2 15 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo dog ga carry . . }
#mess:   A=CARRY X=DOG,THE Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo girl ga hit te ita . . }
#mess:   A=HIT X=GIRL,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo father ni throw ta . . }
#mess:   A=THROW X=BROTHER,THE Y=BALL,THE Z=FATHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 15 1 ;link 3 9 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga mother ni kite wo present te ita . . }
#mess:   A=PRESENT X=DOG,THE Y=KITE,THE Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 6 1 ;link 2 18 1 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga toy wo carry te iru . . }
#mess:   A=CARRY X=MOTHER,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga run ta . . }
#mess:   A=RUN Y=FATHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 9 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga sister ni stick wo give te iru . . }
#mess:   A=GIVE X=MOTHER,THE Y=STICK,THE Z=SISTER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 10 1 ;link 2 16 1 ;link 3 11 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga mother ni ball wo present te ita . . }
#mess:   A=PRESENT X=WOMAN,A Y=BALL,THE Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 4 2 ;link 2 15 1 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo hit . . }
#mess:   A=HIT X=FATHER,A Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 9 2 ;link 2 15 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo dog ga kick te iru . . }
#mess:   A=KICK X=DOG,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 6 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga mother ni kite wo give te ita . . }
#mess:   A=GIVE X=TEACHER,A Y=KITE,THE Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 18 1 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga dog ni kite wo show . . }
#mess:   A=SHOW X=NURSE,A Y=KITE,THE Z=DOG,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 18 1 ;link 3 6 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga girl ni stick wo throw ta . . }
#mess:   A=THROW X=BROTHER,THE Y=STICK,THE Z=GIRL,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 16 1 ;link 3 8 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo cat ga hit te ita . . }
#mess:   A=HIT X=CAT,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga kite wo hit te iru . . }
#mess:   A=HIT X=MAN,A Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 2 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo man ga push te iru . . }
#mess:   A=PUSH X=MAN,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga ball wo carry . . }
#mess:   A=CARRY X=CAT,THE Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 1 ;link 2 15 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo dog ga push te iru . . }
#mess:   A=PUSH X=DOG,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sleep te iru . . }
#mess:   A=SLEEP Y=TEACHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 14 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga jump te iru . . }
#mess:   A=JUMP Y=GIRL,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 8 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga mother ni kite wo present te ita . . }
#mess:   A=PRESENT X=GIRL,A Y=KITE,A Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 8 2 ;link 2 18 2 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo sister ni give te iru . . }
#mess:   A=GIVE X=GIRL,A Y=KITE,A Z=SISTER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 2 ;link 2 18 2 ;link 3 11 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga toy wo kick . . }
#mess:   A=KICK X=FATHER,A Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 17 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga jump ta . . }
#mess:   A=JUMP Y=MAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 3 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga kite wo nurse ni give te iru . . }
#mess:   A=GIVE X=SISTER,THE Y=KITE,THE Z=NURSE,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 18 1 ;link 3 13 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga cat ni ball wo give . . }
#mess:   A=GIVE X=SISTER,A Y=BALL,THE Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 15 1 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga toy wo cat ni show ta . . }
#mess:   A=SHOW X=BROTHER,A Y=TOY,THE Z=CAT,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 12 2 ;link 2 17 1 ;link 3 5 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga walk ta . . }
#mess:   A=WALK Y=GIRL,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 8 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga run te ita . . }
#mess:   A=RUN Y=MOTHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 10 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga nurse ni ball wo present te ita . . }
#mess:   A=PRESENT X=MAN,A Y=BALL,THE Z=NURSE,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 3 2 ;link 2 15 1 ;link 3 13 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga man ni ball wo show ta . . }
#mess:   A=SHOW X=MAN,THE Y=BALL,A Z=MAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 15 2 ;link 3 3 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo sister ni give ta . . }
#mess:   A=GIVE X=BROTHER,A Y=KITE,A Z=SISTER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 18 2 ;link 3 11 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga brother ni kite wo give te iru . . }
#mess:   A=GIVE X=SISTER,A Y=KITE,THE Z=BROTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 18 1 ;link 3 12 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga jump te ita . . }
#mess:   A=JUMP Y=MAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 3 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga sleep te iru . . }
#mess:   A=SLEEP Y=CAT,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 5 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo sister ga hit ta . . }
#mess:   A=HIT X=SISTER,THE Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo man ga push ta . . }
#mess:   A=PUSH X=MAN,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga toy wo hit te iru . . }
#mess:   A=HIT X=WOMAN,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga ball wo boy ni show te ita . . }
#mess:   A=SHOW X=MAN,THE Y=BALL,THE Z=BOY,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 15 1 ;link 3 7 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga run . . }
#mess:   A=RUN Y=MAN,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 3 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga dog ni stick wo show . . }
#mess:   A=SHOW X=WOMAN,A Y=STICK,THE Z=DOG,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 16 1 ;link 3 6 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga ball wo push te ita . . }
#mess:   A=PUSH X=MAN,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga dog ni ball wo show ta . . }
#mess:   A=SHOW X=BROTHER,THE Y=BALL,A Z=DOG,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 15 2 ;link 3 6 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga walk te ita . . }
#mess:   A=WALK Y=DOG,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 6 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo sister ga carry te iru . . }
#mess:   A=CARRY X=SISTER,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 11 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo father ga kick te ita . . }
#mess:   A=KICK X=FATHER,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo cat ga push ta . . }
#mess:   A=PUSH X=CAT,A Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga nurse ni toy wo give . . }
#mess:   A=GIVE X=CAT,THE Y=TOY,THE Z=NURSE,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 1 ;link 2 17 1 ;link 3 13 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga dog ni toy wo give . . }
#mess:   A=GIVE X=MAN,THE Y=TOY,A Z=DOG,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 3 1 ;link 2 17 2 ;link 3 6 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo woman ni present . . }
#mess:   A=PRESENT X=GIRL,THE Y=TOY,THE Z=WOMAN,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 8 1 ;link 2 17 1 ;link 3 4 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga stick wo brother ni present ta . . }
#mess:   A=PRESENT X=BOY,A Y=STICK,A Z=BROTHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 7 2 ;link 2 16 2 ;link 3 12 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga brother ni ball wo present te iru . . }
#mess:   A=PRESENT X=GIRL,THE Y=BALL,A Z=BROTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 8 1 ;link 2 15 2 ;link 3 12 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump ta . . }
#mess:   A=JUMP Y=FATHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 9 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga kite wo girl ni show . . }
#mess:   A=SHOW X=WOMAN,A Y=KITE,THE Z=GIRL,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 18 1 ;link 3 8 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga jump te iru . . }
#mess:   A=JUMP Y=DOG,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 6 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo boy ga kick te ita . . }
#mess:   A=KICK X=BOY,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 7 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo push te iru . . }
#mess:   A=PUSH X=SISTER,THE Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 1 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo brother ga hit . . }
#mess:   A=HIT X=BROTHER,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga ball wo kick ta . . }
#mess:   A=KICK X=NURSE,THE Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga walk te ita . . }
#mess:   A=WALK Y=SISTER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 11 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga man ni toy wo throw . . }
#mess:   A=THROW X=BROTHER,A Y=TOY,THE Z=MAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 17 1 ;link 3 3 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo cat ni show te ita . . }
#mess:   A=SHOW X=DOG,THE Y=STICK,THE Z=CAT,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 16 1 ;link 3 5 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo teacher ga kick . . }
#mess:   A=KICK X=TEACHER,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo dog ga push ta . . }
#mess:   A=PUSH X=DOG,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo girl ni give . . }
#mess:   A=GIVE X=GIRL,THE Y=TOY,THE Z=GIRL,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 17 1 ;link 3 8 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo woman ni present te iru . . }
#mess:   A=PRESENT X=FATHER,A Y=KITE,THE Z=WOMAN,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 9 2 ;link 2 18 1 ;link 3 4 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump . . }
#mess:   A=JUMP Y=FATHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 9 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga walk te iru . . }
#mess:   A=WALK Y=SISTER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 11 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga girl ni ball wo give te iru . . }
#mess:   A=GIVE X=TEACHER,THE Y=BALL,THE Z=GIRL,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 15 1 ;link 3 8 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga kite wo father ni give te iru . . }
#mess:   A=GIVE X=MOTHER,THE Y=KITE,A Z=FATHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 10 1 ;link 2 18 2 ;link 3 9 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga run ta . . }
#mess:   A=RUN Y=MAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 3 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga stick wo kick te iru . . }
#mess:   A=KICK X=TEACHER,A Y=STICK,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 2 ;link 2 16 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga run . . }
#mess:   A=RUN Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 6 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo sister ga carry . . }
#mess:   A=CARRY X=SISTER,THE Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 11 1 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga stick wo woman ni throw te iru . . }
#mess:   A=THROW X=MOTHER,A Y=STICK,A Z=WOMAN,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 10 2 ;link 2 16 2 ;link 3 4 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga nurse ni ball wo give te ita . . }
#mess:   A=GIVE X=MAN,A Y=BALL,A Z=NURSE,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 3 2 ;link 2 15 2 ;link 3 13 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga run te iru . . }
#mess:   A=RUN Y=GIRL,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 8 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga ball wo boy ni show te iru . . }
#mess:   A=SHOW X=BOY,THE Y=BALL,A Z=BOY,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 7 1 ;link 2 15 2 ;link 3 7 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga jump te iru . . }
#mess:   A=JUMP Y=MAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 3 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga walk ta . . }
#mess:   A=WALK Y=FATHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 9 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo girl ni throw te iru . . }
#mess:   A=THROW X=DOG,A Y=STICK,THE Z=GIRL,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 6 2 ;link 2 16 1 ;link 3 8 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo nurse ni present . . }
#mess:   A=PRESENT X=DOG,A Y=KITE,A Z=NURSE,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 18 2 ;link 3 13 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga walk te iru . . }
#mess:   A=WALK Y=TEACHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 14 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga stick wo teacher ni give te iru . . }
#mess:   A=GIVE X=WOMAN,A Y=STICK,A Z=TEACHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 16 2 ;link 3 14 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga brother ni kite wo throw te ita . . }
#mess:   A=THROW X=NURSE,THE Y=KITE,THE Z=BROTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 13 1 ;link 2 18 1 ;link 3 12 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga sleep ta . . }
#mess:   A=SLEEP Y=SISTER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 11 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga kite wo woman ni show ta . . }
#mess:   A=SHOW X=SISTER,THE Y=KITE,THE Z=WOMAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 1 ;link 2 18 1 ;link 3 4 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo father ni give te ita . . }
#mess:   A=GIVE X=BROTHER,A Y=KITE,A Z=FATHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 18 2 ;link 3 9 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga toy wo hit ta . . }
#mess:   A=HIT X=CAT,THE Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga mother ni stick wo show te iru . . }
#mess:   A=SHOW X=MAN,THE Y=STICK,THE Z=MOTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 16 1 ;link 3 10 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo boy ga hit te ita . . }
#mess:   A=HIT X=BOY,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 7 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga toy wo carry te iru . . }
#mess:   A=CARRY X=TEACHER,A Y=TOY,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 14 2 ;link 2 17 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo dog ni show te iru . . }
#mess:   A=SHOW X=GIRL,THE Y=TOY,THE Z=DOG,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 17 1 ;link 3 6 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo teacher ga kick . . }
#mess:   A=KICK X=TEACHER,THE Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo sister ga push te ita . . }
#mess:   A=PUSH X=SISTER,THE Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 11 1 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sleep te ita . . }
#mess:   A=SLEEP Y=TEACHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 14 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga kite wo hit te ita . . }
#mess:   A=HIT X=BOY,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 7 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo father ni throw te iru . . }
#mess:   A=THROW X=BROTHER,THE Y=KITE,THE Z=FATHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 18 1 ;link 3 9 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo man ni give . . }
#mess:   A=GIVE X=NURSE,A Y=STICK,THE Z=MAN,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 16 1 ;link 3 3 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga stick wo hit te ita . . }
#mess:   A=HIT X=FATHER,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 9 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga ball wo teacher ni give te ita . . }
#mess:   A=GIVE X=DOG,THE Y=BALL,A Z=TEACHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 1 ;link 2 15 2 ;link 3 14 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga woman ni toy wo throw . . }
#mess:   A=THROW X=SISTER,THE Y=TOY,THE Z=WOMAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 1 ;link 2 17 1 ;link 3 4 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga kite wo hit ta . . }
#mess:   A=HIT X=WOMAN,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga cat ni toy wo present ta . . }
#mess:   A=PRESENT X=TEACHER,A Y=TOY,A Z=CAT,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 14 2 ;link 2 17 2 ;link 3 5 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga teacher ni ball wo give te ita . . }
#mess:   A=GIVE X=CAT,A Y=BALL,A Z=TEACHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 2 ;link 2 15 2 ;link 3 14 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo father ni throw te ita . . }
#mess:   A=THROW X=SISTER,A Y=TOY,THE Z=FATHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 17 1 ;link 3 9 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo cat ga kick ta . . }
#mess:   A=KICK X=CAT,A Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 5 2 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga run ta . . }
#mess:   A=RUN Y=WOMAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 4 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga teacher ni ball wo throw te ita . . }
#mess:   A=THROW X=BOY,A Y=BALL,A Z=TEACHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 15 2 ;link 3 14 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga walk ta . . }
#mess:   A=WALK Y=BOY,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 7 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga kite wo push te iru . . }
#mess:   A=PUSH X=CAT,A Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga brother ni ball wo throw . . }
#mess:   A=THROW X=FATHER,A Y=BALL,A Z=BROTHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 9 2 ;link 2 15 2 ;link 3 12 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sleep te ita . . }
#mess:   A=SLEEP Y=TEACHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 14 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga woman ni stick wo show ta . . }
#mess:   A=SHOW X=DOG,A Y=STICK,A Z=WOMAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 6 2 ;link 2 16 2 ;link 3 4 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga mother ni ball wo show te ita . . }
#mess:   A=SHOW X=SISTER,THE Y=BALL,A Z=MOTHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 1 ;link 2 15 2 ;link 3 10 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga push te ita . . }
#mess:   A=PUSH X=MOTHER,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 10 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo brother ga push te iru . . }
#mess:   A=PUSH X=BROTHER,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga brother ni kite wo give . . }
#mess:   A=GIVE X=BROTHER,A Y=KITE,THE Z=BROTHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 18 1 ;link 3 12 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo cat ga hit te ita . . }
#mess:   A=HIT X=CAT,THE Y=BALL,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 15 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo woman ni show te iru . . }
#mess:   A=SHOW X=SISTER,A Y=BALL,A Z=WOMAN,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 15 2 ;link 3 4 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga brother ni kite wo show . . }
#mess:   A=SHOW X=FATHER,A Y=KITE,THE Z=BROTHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 9 2 ;link 2 18 1 ;link 3 12 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga brother ni kite wo show te ita . . }
#mess:   A=SHOW X=SISTER,THE Y=KITE,A Z=BROTHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 1 ;link 2 18 2 ;link 3 12 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo kick . . }
#mess:   A=KICK X=FATHER,THE Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 15 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga ball wo woman ni give te iru . . }
#mess:   A=GIVE X=CAT,A Y=BALL,A Z=WOMAN,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 5 2 ;link 2 15 2 ;link 3 4 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga girl ni kite wo show te ita . . }
#mess:   A=SHOW X=BROTHER,THE Y=KITE,THE Z=GIRL,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 18 1 ;link 3 8 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga jump te iru . . }
#mess:   A=JUMP Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga ball wo woman ni show ta . . }
#mess:   A=SHOW X=BOY,A Y=BALL,A Z=WOMAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 7 2 ;link 2 15 2 ;link 3 4 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga cat ni toy wo present ta . . }
#mess:   A=PRESENT X=NURSE,A Y=TOY,A Z=CAT,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 2 ;link 2 17 2 ;link 3 5 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga brother ni toy wo show ta . . }
#mess:   A=SHOW X=SISTER,A Y=TOY,THE Z=BROTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 17 1 ;link 3 12 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga walk ta . . }
#mess:   A=WALK Y=MAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 3 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo woman ga hit ta . . }
#mess:   A=HIT X=WOMAN,THE Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga sleep te ita . . }
#mess:   A=SLEEP Y=BOY,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 7 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo sister ga push . . }
#mess:   A=PUSH X=SISTER,A Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 11 2 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo dog ga hit ta . . }
#mess:   A=HIT X=DOG,A Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo cat ni give ta . . }
#mess:   A=GIVE X=SISTER,THE Y=BALL,A Z=CAT,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 15 2 ;link 3 5 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga jump te iru . . }
#mess:   A=JUMP Y=CAT,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 5 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga toy wo carry ta . . }
#mess:   A=CARRY X=CAT,A Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 2 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga girl ni stick wo show ta . . }
#mess:   A=SHOW X=BOY,THE Y=STICK,THE Z=GIRL,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 1 ;link 2 16 1 ;link 3 8 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga stick wo kick ta . . }
#mess:   A=KICK X=TEACHER,A Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 2 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo girl ga carry ta . . }
#mess:   A=CARRY X=GIRL,A Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga teacher ni kite wo present . . }
#mess:   A=PRESENT X=GIRL,A Y=KITE,THE Z=TEACHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 8 2 ;link 2 18 1 ;link 3 14 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo kick te iru . . }
#mess:   A=KICK X=GIRL,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sleep ta . . }
#mess:   A=SLEEP Y=BROTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 12 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga toy wo woman ni throw te iru . . }
#mess:   A=THROW X=NURSE,A Y=TOY,THE Z=WOMAN,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 17 1 ;link 3 4 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga walk te ita . . }
#mess:   A=WALK Y=BROTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 12 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo push ta . . }
#mess:   A=PUSH X=FATHER,THE Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 9 1 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga run te ita . . }
#mess:   A=RUN Y=DOG,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 6 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga father ni ball wo give . . }
#mess:   A=GIVE X=FATHER,A Y=BALL,A Z=FATHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 15 2 ;link 3 9 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo nurse ga carry ta . . }
#mess:   A=CARRY X=NURSE,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 13 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo nurse ga carry te ita . . }
#mess:   A=CARRY X=NURSE,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 13 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga ball wo carry te iru . . }
#mess:   A=CARRY X=MOTHER,A Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 2 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga walk te iru . . }
#mess:   A=WALK Y=CAT,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo brother ga push te ita . . }
#mess:   A=PUSH X=BROTHER,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga run te iru . . }
#mess:   A=RUN Y=SISTER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 11 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo cat ga kick . . }
#mess:   A=KICK X=CAT,THE Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 5 1 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo girl ga push . . }
#mess:   A=PUSH X=GIRL,THE Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 8 1 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga teacher ni ball wo throw te iru . . }
#mess:   A=THROW X=BROTHER,A Y=BALL,A Z=TEACHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 15 2 ;link 3 14 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga father ni kite wo throw te iru . . }
#mess:   A=THROW X=TEACHER,A Y=KITE,THE Z=FATHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 18 1 ;link 3 9 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga sister ni toy wo give te ita . . }
#mess:   A=GIVE X=DOG,THE Y=TOY,A Z=SISTER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 6 1 ;link 2 17 2 ;link 3 11 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo kick te iru . . }
#mess:   A=KICK X=NURSE,THE Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga dog ni kite wo show te iru . . }
#mess:   A=SHOW X=NURSE,A Y=KITE,THE Z=DOG,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 18 1 ;link 3 6 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo father ni show te iru . . }
#mess:   A=SHOW X=DOG,THE Y=STICK,THE Z=FATHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 16 1 ;link 3 9 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga walk te ita . . }
#mess:   A=WALK Y=MAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 3 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo nurse ga carry te iru . . }
#mess:   A=CARRY X=NURSE,THE Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 13 1 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo kick . . }
#mess:   A=KICK X=NURSE,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga teacher ni toy wo give te iru . . }
#mess:   A=GIVE X=TEACHER,THE Y=TOY,A Z=TEACHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 17 2 ;link 3 14 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga boy ni toy wo give ta . . }
#mess:   A=GIVE X=FATHER,A Y=TOY,THE Z=BOY,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 17 1 ;link 3 7 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga teacher ni stick wo show . . }
#mess:   A=SHOW X=BROTHER,THE Y=STICK,A Z=TEACHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 16 2 ;link 3 14 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga run te iru . . }
#mess:   A=RUN Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga walk ta . . }
#mess:   A=WALK Y=BROTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 12 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo cat ni throw ta . . }
#mess:   A=THROW X=TEACHER,THE Y=KITE,THE Z=CAT,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 18 1 ;link 3 5 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo woman ga hit . . }
#mess:   A=HIT X=WOMAN,A Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga run te ita . . }
#mess:   A=RUN Y=NURSE,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 13 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sleep . . }
#mess:   A=SLEEP Y=BROTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 12 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga walk . . }
#mess:   A=WALK Y=BOY,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 7 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo dog ni give te ita . . }
#mess:   A=GIVE X=GIRL,THE Y=BALL,THE Z=DOG,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 15 1 ;link 3 6 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga jump ta . . }
#mess:   A=JUMP Y=GIRL,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 8 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo dog ga hit . . }
#mess:   A=HIT X=DOG,A Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo sister ga kick . . }
#mess:   A=KICK X=SISTER,THE Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 11 1 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga father ni toy wo show te iru . . }
#mess:   A=SHOW X=CAT,A Y=TOY,A Z=FATHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 17 2 ;link 3 9 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga walk te ita . . }
#mess:   A=WALK Y=FATHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 9 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sleep . . }
#mess:   A=SLEEP Y=TEACHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 14 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga toy wo father ni throw ta . . }
#mess:   A=THROW X=MOTHER,A Y=TOY,A Z=FATHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 10 2 ;link 2 17 2 ;link 3 9 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga jump te ita . . }
#mess:   A=JUMP Y=BOY,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 7 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo woman ga carry te iru . . }
#mess:   A=CARRY X=WOMAN,A Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga stick wo kick ta . . }
#mess:   A=KICK X=BROTHER,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo father ga hit te iru . . }
#mess:   A=HIT X=FATHER,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 9 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo mother ni give te iru . . }
#mess:   A=GIVE X=DOG,A Y=STICK,A Z=MOTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 16 2 ;link 3 10 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo dog ga hit te iru . . }
#mess:   A=HIT X=DOG,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga brother ni kite wo show te ita . . }
#mess:   A=SHOW X=CAT,A Y=KITE,A Z=BROTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 18 2 ;link 3 12 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga jump te ita . . }
#mess:   A=JUMP Y=SISTER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 11 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo brother ga hit . . }
#mess:   A=HIT X=BROTHER,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo mother ga hit ta . . }
#mess:   A=HIT X=MOTHER,THE Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo woman ga carry te ita . . }
#mess:   A=CARRY X=WOMAN,THE Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 1 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo woman ga hit ta . . }
#mess:   A=HIT X=WOMAN,A Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga nurse ni ball wo throw ta . . }
#mess:   A=THROW X=CAT,A Y=BALL,A Z=NURSE,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 5 2 ;link 2 15 2 ;link 3 13 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga kite wo hit ta . . }
#mess:   A=HIT X=BOY,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 7 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo sister ga kick te ita . . }
#mess:   A=KICK X=SISTER,A Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 11 2 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo boy ga hit ta . . }
#mess:   A=HIT X=BOY,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 7 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga sleep ta . . }
#mess:   A=SLEEP Y=MAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 3 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sleep te iru . . }
#mess:   A=SLEEP Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo woman ga push te ita . . }
#mess:   A=PUSH X=WOMAN,THE Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 4 1 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump . . }
#mess:   A=JUMP Y=FATHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 9 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga kite wo girl ni show te ita . . }
#mess:   A=SHOW X=SISTER,A Y=KITE,THE Z=GIRL,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 18 1 ;link 3 8 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga nurse ni toy wo throw te ita . . }
#mess:   A=THROW X=GIRL,THE Y=TOY,THE Z=NURSE,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 1 ;link 2 17 1 ;link 3 13 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga nurse ni kite wo throw . . }
#mess:   A=THROW X=BOY,THE Y=KITE,THE Z=NURSE,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 1 ;link 2 18 1 ;link 3 13 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga dog ni kite wo throw te ita . . }
#mess:   A=THROW X=MOTHER,THE Y=KITE,A Z=DOG,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 10 1 ;link 2 18 2 ;link 3 6 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga sleep ta . . }
#mess:   A=SLEEP Y=GIRL,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 8 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga walk te ita . . }
#mess:   A=WALK Y=DOG,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 6 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo dog ga kick . . }
#mess:   A=KICK X=DOG,A Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 6 2 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga ball wo teacher ni give te ita . . }
#mess:   A=GIVE X=MAN,THE Y=BALL,A Z=TEACHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 3 1 ;link 2 15 2 ;link 3 14 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga walk te ita . . }
#mess:   A=WALK Y=MOTHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 10 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga toy wo teacher ni throw . . }
#mess:   A=THROW X=CAT,A Y=TOY,THE Z=TEACHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 5 2 ;link 2 17 1 ;link 3 14 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo hit ta . . }
#mess:   A=HIT X=BROTHER,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga toy wo push . . }
#mess:   A=PUSH X=DOG,THE Y=TOY,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 17 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo kick . . }
#mess:   A=KICK X=NURSE,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga sister ni stick wo present te iru . . }
#mess:   A=PRESENT X=CAT,THE Y=STICK,THE Z=SISTER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 16 1 ;link 3 11 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga hit te ita . . }
#mess:   A=HIT X=MOTHER,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga toy wo kick ta . . }
#mess:   A=KICK X=DOG,THE Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 1 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga sleep ta . . }
#mess:   A=SLEEP Y=BOY,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 7 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo teacher ni show . . }
#mess:   A=SHOW X=SISTER,THE Y=TOY,A Z=TEACHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 1 ;link 2 17 2 ;link 3 14 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga jump . . }
#mess:   A=JUMP Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 3 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga toy wo girl ni throw te ita . . }
#mess:   A=THROW X=MAN,A Y=TOY,A Z=GIRL,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 3 2 ;link 2 17 2 ;link 3 8 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga mother ni toy wo present ta . . }
#mess:   A=PRESENT X=DOG,A Y=TOY,THE Z=MOTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 17 1 ;link 3 10 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga girl ni toy wo present te ita . . }
#mess:   A=PRESENT X=TEACHER,THE Y=TOY,A Z=GIRL,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 14 1 ;link 2 17 2 ;link 3 8 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga jump te ita . . }
#mess:   A=JUMP Y=BOY,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 7 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo carry ta . . }
#mess:   A=CARRY X=DOG,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga sleep . . }
#mess:   A=SLEEP Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 7 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sister ni ball wo show te iru . . }
#mess:   A=SHOW X=TEACHER,THE Y=BALL,A Z=SISTER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 14 1 ;link 2 15 2 ;link 3 11 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo cat ga hit te iru . . }
#mess:   A=HIT X=CAT,THE Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo girl ga hit te ita . . }
#mess:   A=HIT X=GIRL,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo sister ni show te iru . . }
#mess:   A=SHOW X=GIRL,THE Y=TOY,THE Z=SISTER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 17 1 ;link 3 11 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga kite wo push . . }
#mess:   A=PUSH X=SISTER,THE Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 1 ;link 2 18 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo carry . . }
#mess:   A=CARRY X=FATHER,THE Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 1 ;link 2 15 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga walk ta . . }
#mess:   A=WALK Y=TEACHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 14 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga run ta . . }
#mess:   A=RUN Y=BOY,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 7 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo girl ga hit te iru . . }
#mess:   A=HIT X=GIRL,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga walk . . }
#mess:   A=WALK Y=TEACHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 14 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo carry ta . . }
#mess:   A=CARRY X=TEACHER,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 14 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo woman ga hit te ita . . }
#mess:   A=HIT X=WOMAN,THE Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga father ni kite wo give ta . . }
#mess:   A=GIVE X=TEACHER,THE Y=KITE,A Z=FATHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 18 2 ;link 3 9 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga father ni ball wo show . . }
#mess:   A=SHOW X=CAT,THE Y=BALL,A Z=FATHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 15 2 ;link 3 9 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga man ni toy wo show te iru . . }
#mess:   A=SHOW X=MOTHER,A Y=TOY,A Z=MAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 2 ;link 2 17 2 ;link 3 3 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga jump ta . . }
#mess:   A=JUMP Y=NURSE,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 13 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo man ni present ta . . }
#mess:   A=PRESENT X=FATHER,THE Y=BALL,A Z=MAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 9 1 ;link 2 15 2 ;link 3 3 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga stick wo kick ta . . }
#mess:   A=KICK X=CAT,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 5 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga toy wo carry te ita . . }
#mess:   A=CARRY X=WOMAN,A Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga ball wo push te ita . . }
#mess:   A=PUSH X=MAN,THE Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga run te ita . . }
#mess:   A=RUN Y=DOG,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 6 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga jump te ita . . }
#mess:   A=JUMP Y=SISTER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 11 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo carry te ita . . }
#mess:   A=CARRY X=SISTER,THE Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 11 1 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga stick wo teacher ni present te ita . . }
#mess:   A=PRESENT X=BROTHER,THE Y=STICK,THE Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 1 ;link 2 16 1 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo nurse ga push te iru . . }
#mess:   A=PUSH X=NURSE,A Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 13 2 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo carry te iru . . }
#mess:   A=CARRY X=NURSE,THE Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 13 1 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga boy ni stick wo throw te iru . . }
#mess:   A=THROW X=TEACHER,A Y=STICK,A Z=BOY,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 16 2 ;link 3 7 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga father ni stick wo throw ta . . }
#mess:   A=THROW X=WOMAN,THE Y=STICK,A Z=FATHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 4 1 ;link 2 16 2 ;link 3 9 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo push te ita . . }
#mess:   A=PUSH X=FATHER,A Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 9 2 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga dog ni kite wo give te iru . . }
#mess:   A=GIVE X=SISTER,A Y=KITE,A Z=DOG,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 18 2 ;link 3 6 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo nurse ga push . . }
#mess:   A=PUSH X=NURSE,THE Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 13 1 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga mother ni kite wo show ta . . }
#mess:   A=SHOW X=FATHER,THE Y=KITE,A Z=MOTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 18 2 ;link 3 10 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga ball wo kick te iru . . }
#mess:   A=KICK X=TEACHER,A Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 2 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo kick te ita . . }
#mess:   A=KICK X=BROTHER,A Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 2 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga kite wo carry . . }
#mess:   A=CARRY X=MAN,THE Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 3 1 ;link 2 18 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga stick wo sister ni throw te ita . . }
#mess:   A=THROW X=MAN,THE Y=STICK,THE Z=SISTER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 3 1 ;link 2 16 1 ;link 3 11 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga kite wo nurse ni throw ta . . }
#mess:   A=THROW X=WOMAN,A Y=KITE,THE Z=NURSE,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 4 2 ;link 2 18 1 ;link 3 13 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo kick ta . . }
#mess:   A=KICK X=DOG,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga father ni toy wo give ta . . }
#mess:   A=GIVE X=FATHER,A Y=TOY,THE Z=FATHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 17 1 ;link 3 9 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga walk ta . . }
#mess:   A=WALK Y=BOY,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 7 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga cat ni toy wo show ta . . }
#mess:   A=SHOW X=BROTHER,THE Y=TOY,A Z=CAT,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 17 2 ;link 3 5 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo man ga hit ta . . }
#mess:   A=HIT X=MAN,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 3 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo brother ni show te ita . . }
#mess:   A=SHOW X=GIRL,A Y=KITE,A Z=BROTHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 18 2 ;link 3 12 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo hit te ita . . }
#mess:   A=HIT X=NURSE,A Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 13 2 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga dog ni stick wo present te ita . . }
#mess:   A=PRESENT X=GIRL,THE Y=STICK,A Z=DOG,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 8 1 ;link 2 16 2 ;link 3 6 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo man ga kick . . }
#mess:   A=KICK X=MAN,A Y=KITE,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 18 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga nurse ni kite wo give te ita . . }
#mess:   A=GIVE X=BOY,A Y=KITE,THE Z=NURSE,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 7 2 ;link 2 18 1 ;link 3 13 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga sleep ta . . }
#mess:   A=SLEEP Y=GIRL,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 8 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga stick wo dog ni give te ita . . }
#mess:   A=GIVE X=TEACHER,A Y=STICK,A Z=DOG,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 16 2 ;link 3 6 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga mother ni kite wo throw ta . . }
#mess:   A=THROW X=TEACHER,A Y=KITE,A Z=MOTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 18 2 ;link 3 10 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga stick wo boy ni throw . . }
#mess:   A=THROW X=GIRL,THE Y=STICK,THE Z=BOY,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 8 1 ;link 2 16 1 ;link 3 7 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga man ni ball wo throw ta . . }
#mess:   A=THROW X=CAT,A Y=BALL,THE Z=MAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 5 2 ;link 2 15 1 ;link 3 3 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo brother ga kick te ita . . }
#mess:   A=KICK X=BROTHER,THE Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 12 1 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo boy ni present ta . . }
#mess:   A=PRESENT X=BROTHER,A Y=BALL,THE Z=BOY,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 15 1 ;link 3 7 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga sleep te ita . . }
#mess:   A=SLEEP Y=BOY,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 7 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga stick wo girl ni present te ita . . }
#mess:   A=PRESENT X=BROTHER,A Y=STICK,A Z=GIRL,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 16 2 ;link 3 8 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga brother ni ball wo present te ita . . }
#mess:   A=PRESENT X=DOG,A Y=BALL,THE Z=BROTHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 15 1 ;link 3 12 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga jump ta . . }
#mess:   A=JUMP Y=NURSE,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 13 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga cat ni toy wo throw . . }
#mess:   A=THROW X=TEACHER,A Y=TOY,A Z=CAT,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 17 2 ;link 3 5 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo brother ga hit . . }
#mess:   A=HIT X=BROTHER,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 12 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo girl ga hit . . }
#mess:   A=HIT X=GIRL,A Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 2 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga jump te ita . . }
#mess:   A=JUMP Y=GIRL,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 8 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga jump te ita . . }
#mess:   A=JUMP Y=NURSE,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 13 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga kite wo push ta . . }
#mess:   A=PUSH X=BOY,THE Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 7 1 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga cat ni kite wo throw te iru . . }
#mess:   A=THROW X=MAN,THE Y=KITE,THE Z=CAT,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 3 1 ;link 2 18 1 ;link 3 5 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo dog ga carry ta . . }
#mess:   A=CARRY X=DOG,THE Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo girl ga kick ta . . }
#mess:   A=KICK X=GIRL,A Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga jump ta . . }
#mess:   A=JUMP Y=GIRL,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 8 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga boy ni toy wo throw te iru . . }
#mess:   A=THROW X=GIRL,THE Y=TOY,A Z=BOY,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 1 ;link 2 17 2 ;link 3 7 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo nurse ni give te ita . . }
#mess:   A=GIVE X=SISTER,THE Y=TOY,A Z=NURSE,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 17 2 ;link 3 13 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga brother ni kite wo show te ita . . }
#mess:   A=SHOW X=MOTHER,A Y=KITE,THE Z=BROTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 2 ;link 2 18 1 ;link 3 12 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo dog ni present . . }
#mess:   A=PRESENT X=DOG,A Y=STICK,THE Z=DOG,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 16 1 ;link 3 6 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga woman ni toy wo show . . }
#mess:   A=SHOW X=BROTHER,A Y=TOY,A Z=WOMAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 2 ;link 2 17 2 ;link 3 4 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga toy wo girl ni give . . }
#mess:   A=GIVE X=WOMAN,A Y=TOY,THE Z=GIRL,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 17 1 ;link 3 8 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo sister ga hit te iru . . }
#mess:   A=HIT X=SISTER,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump . . }
#mess:   A=JUMP Y=FATHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 9 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo dog ga carry . . }
#mess:   A=CARRY X=DOG,THE Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo brother ga push te ita . . }
#mess:   A=PUSH X=BROTHER,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo nurse ga carry ta . . }
#mess:   A=CARRY X=NURSE,A Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 13 2 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo carry te iru . . }
#mess:   A=CARRY X=BROTHER,THE Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 12 1 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo girl ga hit . . }
#mess:   A=HIT X=GIRL,THE Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga stick wo kick ta . . }
#mess:   A=KICK X=TEACHER,THE Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga jump te ita . . }
#mess:   A=JUMP Y=MAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 3 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo cat ga carry te iru . . }
#mess:   A=CARRY X=CAT,THE Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 5 1 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga boy ni toy wo present . . }
#mess:   A=PRESENT X=SISTER,THE Y=TOY,A Z=BOY,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 11 1 ;link 2 17 2 ;link 3 7 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo cat ni throw te ita . . }
#mess:   A=THROW X=BROTHER,A Y=BALL,A Z=CAT,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 15 2 ;link 3 5 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo kick . . }
#mess:   A=KICK X=GIRL,A Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 17 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo hit te iru . . }
#mess:   A=HIT X=SISTER,A Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga jump ta . . }
#mess:   A=JUMP Y=DOG,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 6 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga walk te iru . . }
#mess:   A=WALK Y=CAT,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga kite wo kick . . }
#mess:   A=KICK X=MAN,A Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 18 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga walk . . }
#mess:   A=WALK Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 3 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga jump te ita . . }
#mess:   A=JUMP Y=MAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 3 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo boy ga hit ta . . }
#mess:   A=HIT X=BOY,THE Y=STICK,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 7 1 ;link 2 16 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sleep te ita . . }
#mess:   A=SLEEP Y=TEACHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 14 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga ball wo kick te ita . . }
#mess:   A=KICK X=DOG,THE Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 1 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga dog ni kite wo throw te iru . . }
#mess:   A=THROW X=SISTER,THE Y=KITE,THE Z=DOG,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 1 ;link 2 18 1 ;link 3 6 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga sleep te iru . . }
#mess:   A=SLEEP Y=WOMAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 4 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga jump ta . . }
#mess:   A=JUMP Y=CAT,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 5 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga jump ta . . }
#mess:   A=JUMP Y=NURSE,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 13 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga stick wo kick te iru . . }
#mess:   A=KICK X=CAT,A Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 5 2 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo man ni give te ita . . }
#mess:   A=GIVE X=FATHER,A Y=KITE,A Z=MAN,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 18 2 ;link 3 3 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga cat ni kite wo present . . }
#mess:   A=PRESENT X=DOG,A Y=KITE,THE Z=CAT,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 18 1 ;link 3 5 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo dog ni show te iru . . }
#mess:   A=SHOW X=GIRL,THE Y=TOY,THE Z=DOG,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 17 1 ;link 3 6 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga kite wo push ta . . }
#mess:   A=PUSH X=CAT,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga nurse ni toy wo throw . . }
#mess:   A=THROW X=BOY,THE Y=TOY,A Z=NURSE,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 1 ;link 2 17 2 ;link 3 13 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga walk te iru . . }
#mess:   A=WALK Y=BOY,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 7 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga stick wo girl ni give ta . . }
#mess:   A=GIVE X=BOY,A Y=STICK,A Z=GIRL,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 2 ;link 2 16 2 ;link 3 8 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga jump te ita . . }
#mess:   A=JUMP Y=WOMAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 4 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo mother ga push ta . . }
#mess:   A=PUSH X=MOTHER,A Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 10 2 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga toy wo nurse ni show ta . . }
#mess:   A=SHOW X=BOY,THE Y=TOY,THE Z=NURSE,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 7 1 ;link 2 17 1 ;link 3 13 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo teacher ga push te iru . . }
#mess:   A=PUSH X=TEACHER,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo cat ni show te ita . . }
#mess:   A=SHOW X=FATHER,THE Y=BALL,A Z=CAT,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 15 2 ;link 3 5 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga jump te iru . . }
#mess:   A=JUMP Y=MAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 3 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga sleep ta . . }
#mess:   A=SLEEP Y=DOG,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 6 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga girl ni ball wo show te ita . . }
#mess:   A=SHOW X=GIRL,A Y=BALL,THE Z=GIRL,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 15 1 ;link 3 8 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga woman ni ball wo give ta . . }
#mess:   A=GIVE X=BROTHER,A Y=BALL,THE Z=WOMAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 15 1 ;link 3 4 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga girl ni stick wo show . . }
#mess:   A=SHOW X=WOMAN,THE Y=STICK,A Z=GIRL,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 1 ;link 2 16 2 ;link 3 8 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga girl ni ball wo present . . }
#mess:   A=PRESENT X=DOG,THE Y=BALL,THE Z=GIRL,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 6 1 ;link 2 15 1 ;link 3 8 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo woman ga kick te iru . . }
#mess:   A=KICK X=WOMAN,A Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 4 2 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga walk te ita . . }
#mess:   A=WALK Y=DOG,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 6 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga stick wo carry te ita . . }
#mess:   A=CARRY X=WOMAN,A Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo mother ni show ta . . }
#mess:   A=SHOW X=NURSE,THE Y=KITE,A Z=MOTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 1 ;link 2 18 2 ;link 3 10 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo dog ni throw te ita . . }
#mess:   A=THROW X=NURSE,A Y=STICK,A Z=DOG,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 16 2 ;link 3 6 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga jump te ita . . }
#mess:   A=JUMP Y=MAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 3 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo teacher ga push ta . . }
#mess:   A=PUSH X=TEACHER,A Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo nurse ni show te iru . . }
#mess:   A=SHOW X=DOG,A Y=STICK,A Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 6 2 ;link 2 16 2 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo carry . . }
#mess:   A=CARRY X=SISTER,THE Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 11 1 ;link 2 17 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga run . . }
#mess:   A=RUN Y=DOG,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 6 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo brother ni give ta . . }
#mess:   A=GIVE X=GIRL,THE Y=BALL,A Z=BROTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 15 2 ;link 3 12 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo father ni throw te ita . . }
#mess:   A=THROW X=SISTER,A Y=TOY,A Z=FATHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 17 2 ;link 3 9 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga stick wo man ni present te ita . . }
#mess:   A=PRESENT X=BOY,A Y=STICK,A Z=MAN,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 7 2 ;link 2 16 2 ;link 3 3 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga run te iru . . }
#mess:   A=RUN Y=BROTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 12 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga ball wo carry ta . . }
#mess:   A=CARRY X=MOTHER,A Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 2 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo woman ga carry te ita . . }
#mess:   A=CARRY X=WOMAN,A Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga sleep ta . . }
#mess:   A=SLEEP Y=MOTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 10 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga ball wo kick te iru . . }
#mess:   A=KICK X=DOG,A Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 2 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga sleep ta . . }
#mess:   A=SLEEP Y=MOTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 10 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga mother ni ball wo give te iru . . }
#mess:   A=GIVE X=CAT,THE Y=BALL,A Z=MOTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 1 ;link 2 15 2 ;link 3 10 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga walk te ita . . }
#mess:   A=WALK Y=FATHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 9 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga woman ni stick wo show te ita . . }
#mess:   A=SHOW X=CAT,A Y=STICK,A Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 16 2 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga cat ni stick wo show te ita . . }
#mess:   A=SHOW X=DOG,A Y=STICK,A Z=CAT,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 6 2 ;link 2 16 2 ;link 3 5 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga walk te iru . . }
#mess:   A=WALK Y=MOTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 10 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga man ni ball wo show ta . . }
#mess:   A=SHOW X=CAT,A Y=BALL,A Z=MAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 15 2 ;link 3 3 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga teacher ni toy wo show te iru . . }
#mess:   A=SHOW X=CAT,A Y=TOY,THE Z=TEACHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 2 ;link 2 17 1 ;link 3 14 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga mother ni toy wo show te iru . . }
#mess:   A=SHOW X=DOG,THE Y=TOY,THE Z=MOTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 17 1 ;link 3 10 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga kite wo boy ni throw te ita . . }
#mess:   A=THROW X=SISTER,THE Y=KITE,THE Z=BOY,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 1 ;link 2 18 1 ;link 3 7 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo sister ga carry ta . . }
#mess:   A=CARRY X=SISTER,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 11 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga brother ni toy wo show te iru . . }
#mess:   A=SHOW X=BOY,THE Y=TOY,A Z=BROTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 1 ;link 2 17 2 ;link 3 12 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo dog ga hit te ita . . }
#mess:   A=HIT X=DOG,A Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga toy wo nurse ni throw ta . . }
#mess:   A=THROW X=FATHER,THE Y=TOY,THE Z=NURSE,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 1 ;link 2 17 1 ;link 3 13 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo brother ga kick ta . . }
#mess:   A=KICK X=BROTHER,THE Y=STICK,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 12 1 ;link 2 16 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga teacher ni toy wo give ta . . }
#mess:   A=GIVE X=MAN,THE Y=TOY,A Z=TEACHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 3 1 ;link 2 17 2 ;link 3 14 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga kite wo carry te ita . . }
#mess:   A=CARRY X=BOY,A Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga toy wo kick . . }
#mess:   A=KICK X=NURSE,A Y=TOY,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 17 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga ball wo nurse ni show te iru . . }
#mess:   A=SHOW X=BOY,A Y=BALL,A Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 7 2 ;link 2 15 2 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga woman ni kite wo give ta . . }
#mess:   A=GIVE X=GIRL,THE Y=KITE,THE Z=WOMAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 18 1 ;link 3 4 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo girl ga carry ta . . }
#mess:   A=CARRY X=GIRL,THE Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga kite wo teacher ni present te ita . . }
#mess:   A=PRESENT X=BOY,THE Y=KITE,A Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 7 1 ;link 2 18 2 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga ball wo nurse ni show te ita . . }
#mess:   A=SHOW X=CAT,THE Y=BALL,THE Z=NURSE,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 15 1 ;link 3 13 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo cat ga kick te ita . . }
#mess:   A=KICK X=CAT,THE Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 5 1 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga kite wo carry te iru . . }
#mess:   A=CARRY X=CAT,A Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 2 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga sleep . . }
#mess:   A=SLEEP Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 3 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo man ga kick te ita . . }
#mess:   A=KICK X=MAN,A Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo kick . . }
#mess:   A=KICK X=SISTER,THE Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 11 1 ;link 2 16 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo kick . . }
#mess:   A=KICK X=BROTHER,THE Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 1 ;link 2 15 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sleep . . }
#mess:   A=SLEEP Y=BROTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 12 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga jump . . }
#mess:   A=JUMP Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 7 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo brother ga kick te iru . . }
#mess:   A=KICK X=BROTHER,THE Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 12 1 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo hit ta . . }
#mess:   A=HIT X=DOG,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo nurse ga push te iru . . }
#mess:   A=PUSH X=NURSE,THE Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 13 1 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga sleep ta . . }
#mess:   A=SLEEP Y=MAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 3 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga mother ni kite wo throw ta . . }
#mess:   A=THROW X=GIRL,A Y=KITE,THE Z=MOTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 2 ;link 2 18 1 ;link 3 10 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo cat ga hit te iru . . }
#mess:   A=HIT X=CAT,A Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 2 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga hit ta . . }
#mess:   A=HIT X=MOTHER,THE Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga jump . . }
#mess:   A=JUMP Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 6 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga woman ni kite wo give te ita . . }
#mess:   A=GIVE X=GIRL,A Y=KITE,THE Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 8 2 ;link 2 18 1 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga kite wo push te ita . . }
#mess:   A=PUSH X=MAN,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga toy wo hit . . }
#mess:   A=HIT X=CAT,A Y=TOY,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 5 2 ;link 2 17 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga ball wo carry te ita . . }
#mess:   A=CARRY X=MOTHER,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga toy wo mother ni present . . }
#mess:   A=PRESENT X=BROTHER,THE Y=TOY,A Z=MOTHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 1 ;link 2 17 2 ;link 3 10 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo hit ta . . }
#mess:   A=HIT X=SISTER,THE Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sleep ta . . }
#mess:   A=SLEEP Y=BROTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 12 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sleep . . }
#mess:   A=SLEEP Y=BROTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 12 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga kite wo push ta . . }
#mess:   A=PUSH X=BOY,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 7 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo father ni present te ita . . }
#mess:   A=PRESENT X=FATHER,THE Y=KITE,A Z=FATHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 9 1 ;link 2 18 2 ;link 3 9 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo father ni give . . }
#mess:   A=GIVE X=FATHER,A Y=BALL,THE Z=FATHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 15 1 ;link 3 9 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga run . . }
#mess:   A=RUN Y=SISTER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 11 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga jump ta . . }
#mess:   A=JUMP Y=WOMAN,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 4 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga ball wo woman ni give . . }
#mess:   A=GIVE X=BOY,THE Y=BALL,A Z=WOMAN,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 15 2 ;link 3 4 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo girl ga carry te ita . . }
#mess:   A=CARRY X=GIRL,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo sister ga push . . }
#mess:   A=PUSH X=SISTER,THE Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 11 1 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga run te iru . . }
#mess:   A=RUN Y=NURSE,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 13 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga ball wo brother ni give ta . . }
#mess:   A=GIVE X=TEACHER,THE Y=BALL,THE Z=BROTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 15 1 ;link 3 12 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga walk te iru . . }
#mess:   A=WALK Y=TEACHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 14 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga sleep . . }
#mess:   A=SLEEP Y=CAT,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 5 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga cat ni toy wo throw te iru . . }
#mess:   A=THROW X=SISTER,A Y=TOY,A Z=CAT,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 17 2 ;link 3 5 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga jump . . }
#mess:   A=JUMP Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 7 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga dog ni ball wo give te iru . . }
#mess:   A=GIVE X=NURSE,A Y=BALL,A Z=DOG,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 15 2 ;link 3 6 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo teacher ga hit ta . . }
#mess:   A=HIT X=TEACHER,THE Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo father ga carry . . }
#mess:   A=CARRY X=FATHER,THE Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 9 1 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga stick wo hit te iru . . }
#mess:   A=HIT X=MAN,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga sleep te ita . . }
#mess:   A=SLEEP Y=MOTHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 10 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo cat ga push . . }
#mess:   A=PUSH X=CAT,A Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga jump te ita . . }
#mess:   A=JUMP Y=NURSE,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 13 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga run . . }
#mess:   A=RUN Y=DOG,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 6 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo hit te iru . . }
#mess:   A=HIT X=GIRL,A Y=TOY,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 8 2 ;link 2 17 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga run ta . . }
#mess:   A=RUN Y=FATHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 9 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo father ga push ta . . }
#mess:   A=PUSH X=FATHER,THE Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 9 1 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo dog ni present te ita . . }
#mess:   A=PRESENT X=NURSE,THE Y=KITE,A Z=DOG,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 13 1 ;link 2 18 2 ;link 3 6 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga cat ni kite wo present . . }
#mess:   A=PRESENT X=BROTHER,A Y=KITE,A Z=CAT,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 18 2 ;link 3 5 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga walk . . }
#mess:   A=WALK Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 3 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga stick wo carry te ita . . }
#mess:   A=CARRY X=GIRL,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga toy wo nurse ni throw te iru . . }
#mess:   A=THROW X=MOTHER,A Y=TOY,A Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 10 2 ;link 2 17 2 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga hit te iru . . }
#mess:   A=HIT X=MOTHER,THE Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo nurse ni give ta . . }
#mess:   A=GIVE X=SISTER,THE Y=TOY,A Z=NURSE,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 17 2 ;link 3 13 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga kite wo cat ni show te iru . . }
#mess:   A=SHOW X=CAT,THE Y=KITE,A Z=CAT,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 18 2 ;link 3 5 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga boy ni stick wo show . . }
#mess:   A=SHOW X=MOTHER,THE Y=STICK,THE Z=BOY,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 1 ;link 2 16 1 ;link 3 7 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga mother ni ball wo give ta . . }
#mess:   A=GIVE X=TEACHER,THE Y=BALL,THE Z=MOTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 15 1 ;link 3 10 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga sleep . . }
#mess:   A=SLEEP Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 7 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga toy wo teacher ni throw te iru . . }
#mess:   A=THROW X=CAT,A Y=TOY,A Z=TEACHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 5 2 ;link 2 17 2 ;link 3 14 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga toy wo hit te iru . . }
#mess:   A=HIT X=NURSE,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 13 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga woman ni ball wo show te ita . . }
#mess:   A=SHOW X=GIRL,THE Y=BALL,A Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 15 2 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga kick ta . . }
#mess:   A=KICK X=MOTHER,THE Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 10 1 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo carry te ita . . }
#mess:   A=CARRY X=BROTHER,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga stick wo sister ni show ta . . }
#mess:   A=SHOW X=MAN,A Y=STICK,THE Z=SISTER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 3 2 ;link 2 16 1 ;link 3 11 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sister ni kite wo throw te iru . . }
#mess:   A=THROW X=TEACHER,A Y=KITE,THE Z=SISTER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 18 1 ;link 3 11 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga kite wo push ta . . }
#mess:   A=PUSH X=MOTHER,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 10 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga sleep te ita . . }
#mess:   A=SLEEP Y=WOMAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 4 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga sleep ta . . }
#mess:   A=SLEEP Y=MAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 3 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga mother ni ball wo give ta . . }
#mess:   A=GIVE X=WOMAN,A Y=BALL,THE Z=MOTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 15 1 ;link 3 10 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga toy wo cat ni throw . . }
#mess:   A=THROW X=MAN,A Y=TOY,A Z=CAT,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 3 2 ;link 2 17 2 ;link 3 5 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga run ta . . }
#mess:   A=RUN Y=MOTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 10 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sleep . . }
#mess:   A=SLEEP Y=TEACHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 14 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga walk te ita . . }
#mess:   A=WALK Y=GIRL,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 8 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga sleep te iru . . }
#mess:   A=SLEEP Y=FATHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 9 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo teacher ni give te iru . . }
#mess:   A=GIVE X=GIRL,A Y=BALL,THE Z=TEACHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 2 ;link 2 15 1 ;link 3 14 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga jump ta . . }
#mess:   A=JUMP Y=MOTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 10 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga sleep te ita . . }
#mess:   A=SLEEP Y=GIRL,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 8 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo push te ita . . }
#mess:   A=PUSH X=NURSE,THE Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 13 1 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga boy ni ball wo give . . }
#mess:   A=GIVE X=BROTHER,THE Y=BALL,A Z=BOY,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 1 ;link 2 15 2 ;link 3 7 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo carry te ita . . }
#mess:   A=CARRY X=GIRL,THE Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo father ga push te iru . . }
#mess:   A=PUSH X=FATHER,THE Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 9 1 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga cat ni ball wo show te iru . . }
#mess:   A=SHOW X=FATHER,A Y=BALL,A Z=CAT,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 9 2 ;link 2 15 2 ;link 3 5 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga dog ni toy wo throw te ita . . }
#mess:   A=THROW X=GIRL,A Y=TOY,A Z=DOG,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 2 ;link 2 17 2 ;link 3 6 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga stick wo push ta . . }
#mess:   A=PUSH X=WOMAN,A Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 4 2 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo push te iru . . }
#mess:   A=PUSH X=TEACHER,A Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 14 2 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga jump ta . . }
#mess:   A=JUMP Y=DOG,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 6 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo woman ga push te iru . . }
#mess:   A=PUSH X=WOMAN,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 4 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga sleep . . }
#mess:   A=SLEEP Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 3 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga walk . . }
#mess:   A=WALK Y=GIRL,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 8 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga sleep . . }
#mess:   A=SLEEP Y=MAN,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 3 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo sister ga push te iru . . }
#mess:   A=PUSH X=SISTER,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 11 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga mother ni stick wo give . . }
#mess:   A=GIVE X=TEACHER,THE Y=STICK,A Z=MOTHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 16 2 ;link 3 10 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo kick . . }
#mess:   A=KICK X=SISTER,A Y=TOY,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 11 2 ;link 2 17 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga nurse ni kite wo give te iru . . }
#mess:   A=GIVE X=MAN,A Y=KITE,A Z=NURSE,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 3 2 ;link 2 18 2 ;link 3 13 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo hit ta . . }
#mess:   A=HIT X=NURSE,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 13 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo teacher ga hit ta . . }
#mess:   A=HIT X=TEACHER,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga sister ni stick wo show te iru . . }
#mess:   A=SHOW X=CAT,THE Y=STICK,A Z=SISTER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 16 2 ;link 3 11 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga mother ni ball wo give te iru . . }
#mess:   A=GIVE X=CAT,THE Y=BALL,A Z=MOTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 1 ;link 2 15 2 ;link 3 10 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga nurse ni stick wo give te ita . . }
#mess:   A=GIVE X=FATHER,A Y=STICK,A Z=NURSE,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 16 2 ;link 3 13 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo nurse ni give ta . . }
#mess:   A=GIVE X=BROTHER,A Y=KITE,A Z=NURSE,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 18 2 ;link 3 13 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo father ga carry ta . . }
#mess:   A=CARRY X=FATHER,THE Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 9 1 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga run te ita . . }
#mess:   A=RUN Y=NURSE,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 13 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga walk . . }
#mess:   A=WALK Y=BROTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 12 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga teacher ni kite wo present . . }
#mess:   A=PRESENT X=CAT,A Y=KITE,A Z=TEACHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 2 ;link 2 18 2 ;link 3 14 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga sleep te ita . . }
#mess:   A=SLEEP Y=GIRL,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 8 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo carry ta . . }
#mess:   A=CARRY X=DOG,THE Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo boy ga push te ita . . }
#mess:   A=PUSH X=BOY,A Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 7 2 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga run te ita . . }
#mess:   A=RUN Y=BOY,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 7 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga ball wo nurse ni give te ita . . }
#mess:   A=GIVE X=BOY,THE Y=BALL,THE Z=NURSE,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 15 1 ;link 3 13 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga run ta . . }
#mess:   A=RUN Y=BOY,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 7 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo hit ta . . }
#mess:   A=HIT X=BROTHER,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 12 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga teacher ni stick wo throw ta . . }
#mess:   A=THROW X=BOY,A Y=STICK,A Z=TEACHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 16 2 ;link 3 14 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo woman ga kick te iru . . }
#mess:   A=KICK X=WOMAN,A Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 4 2 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump te ita . . }
#mess:   A=JUMP Y=FATHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 9 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo cat ga carry . . }
#mess:   A=CARRY X=CAT,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 5 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga stick wo brother ni present te iru . . }
#mess:   A=PRESENT X=BOY,THE Y=STICK,A Z=BROTHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 7 1 ;link 2 16 2 ;link 3 12 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo girl ga kick ta . . }
#mess:   A=KICK X=GIRL,A Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga walk ta . . }
#mess:   A=WALK Y=BOY,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 7 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga run te iru . . }
#mess:   A=RUN Y=SISTER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 11 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga walk . . }
#mess:   A=WALK Y=FATHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 9 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo nurse ni throw ta . . }
#mess:   A=THROW X=GIRL,A Y=KITE,THE Z=NURSE,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 8 2 ;link 2 18 1 ;link 3 13 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sleep te iru . . }
#mess:   A=SLEEP Y=TEACHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 14 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo brother ni present . . }
#mess:   A=PRESENT X=GIRL,A Y=KITE,THE Z=BROTHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 8 2 ;link 2 18 1 ;link 3 12 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga walk . . }
#mess:   A=WALK Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 7 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga run te iru . . }
#mess:   A=RUN Y=BOY,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 7 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga stick wo boy ni throw te ita . . }
#mess:   A=THROW X=BROTHER,THE Y=STICK,A Z=BOY,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 16 2 ;link 3 7 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga jump . . }
#mess:   A=JUMP Y=BOY,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 7 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga toy wo kick te ita . . }
#mess:   A=KICK X=WOMAN,THE Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 4 1 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga boy ni kite wo throw te iru . . }
#mess:   A=THROW X=BOY,A Y=KITE,THE Z=BOY,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 18 1 ;link 3 7 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo cat ga push . . }
#mess:   A=PUSH X=CAT,THE Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo woman ga hit . . }
#mess:   A=HIT X=WOMAN,A Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga walk . . }
#mess:   A=WALK Y=GIRL,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 8 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo kick ta . . }
#mess:   A=KICK X=NURSE,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo man ga push ta . . }
#mess:   A=PUSH X=MAN,A Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sister ni stick wo show ta . . }
#mess:   A=SHOW X=BROTHER,THE Y=STICK,THE Z=SISTER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 16 1 ;link 3 11 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga father ni ball wo show te ita . . }
#mess:   A=SHOW X=BOY,A Y=BALL,THE Z=FATHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 7 2 ;link 2 15 1 ;link 3 9 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga run ta . . }
#mess:   A=RUN Y=MOTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 10 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga stick wo hit te ita . . }
#mess:   A=HIT X=MOTHER,A Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 10 2 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga father ni ball wo give . . }
#mess:   A=GIVE X=MAN,A Y=BALL,THE Z=FATHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 3 2 ;link 2 15 1 ;link 3 9 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo hit . . }
#mess:   A=HIT X=SISTER,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga run . . }
#mess:   A=RUN Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 3 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga teacher ni kite wo give ta . . }
#mess:   A=GIVE X=NURSE,A Y=KITE,A Z=TEACHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 18 2 ;link 3 14 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo father ga carry ta . . }
#mess:   A=CARRY X=FATHER,A Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo nurse ga push te ita . . }
#mess:   A=PUSH X=NURSE,A Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 13 2 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga sleep te ita . . }
#mess:   A=SLEEP Y=MAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 3 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo woman ni present ta . . }
#mess:   A=PRESENT X=SISTER,A Y=BALL,A Z=WOMAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 11 2 ;link 2 15 2 ;link 3 4 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga run . . }
#mess:   A=RUN Y=FATHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 9 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo girl ga kick . . }
#mess:   A=KICK X=GIRL,THE Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 8 1 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo teacher ni throw ta . . }
#mess:   A=THROW X=SISTER,THE Y=STICK,THE Z=TEACHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 1 ;link 2 16 1 ;link 3 14 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo push te iru . . }
#mess:   A=PUSH X=FATHER,THE Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 9 1 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga nurse ni kite wo give ta . . }
#mess:   A=GIVE X=BROTHER,A Y=KITE,A Z=NURSE,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 18 2 ;link 3 13 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga kite wo girl ni present te iru . . }
#mess:   A=PRESENT X=MAN,THE Y=KITE,THE Z=GIRL,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 18 1 ;link 3 8 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga walk te ita . . }
#mess:   A=WALK Y=MOTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 10 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo mother ga push te iru . . }
#mess:   A=PUSH X=MOTHER,THE Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 10 1 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga hit . . }
#mess:   A=HIT X=MOTHER,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga toy wo push te ita . . }
#mess:   A=PUSH X=BOY,A Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 7 2 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga kick ta . . }
#mess:   A=KICK X=MOTHER,A Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 10 2 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo teacher ga carry te ita . . }
#mess:   A=CARRY X=TEACHER,A Y=BALL,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 14 2 ;link 2 15 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo man ni show . . }
#mess:   A=SHOW X=SISTER,A Y=TOY,A Z=MAN,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 17 2 ;link 3 3 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo brother ga push te iru . . }
#mess:   A=PUSH X=BROTHER,A Y=STICK,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 2 ;link 2 16 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo cat ga push te iru . . }
#mess:   A=PUSH X=CAT,THE Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo cat ga push . . }
#mess:   A=PUSH X=CAT,THE Y=STICK,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 16 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga kite wo hit te ita . . }
#mess:   A=HIT X=MOTHER,THE Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo boy ni throw te ita . . }
#mess:   A=THROW X=FATHER,THE Y=KITE,A Z=BOY,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 1 ;link 2 18 2 ;link 3 7 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga ball wo hit te ita . . }
#mess:   A=HIT X=TEACHER,THE Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo push . . }
#mess:   A=PUSH X=GIRL,THE Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 8 1 ;link 2 15 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga woman ni ball wo give te ita . . }
#mess:   A=GIVE X=NURSE,THE Y=BALL,THE Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 13 1 ;link 2 15 1 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo nurse ga kick te iru . . }
#mess:   A=KICK X=NURSE,THE Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo father ga kick te iru . . }
#mess:   A=KICK X=FATHER,THE Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga walk te iru . . }
#mess:   A=WALK Y=MOTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 10 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga sister ni toy wo present ta . . }
#mess:   A=PRESENT X=NURSE,THE Y=TOY,THE Z=SISTER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 1 ;link 2 17 1 ;link 3 11 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga father ni toy wo throw te ita . . }
#mess:   A=THROW X=WOMAN,A Y=TOY,THE Z=FATHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 4 2 ;link 2 17 1 ;link 3 9 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo cat ni present . . }
#mess:   A=PRESENT X=FATHER,THE Y=BALL,THE Z=CAT,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 9 1 ;link 2 15 1 ;link 3 5 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga ball wo brother ni show ta . . }
#mess:   A=SHOW X=MAN,THE Y=BALL,A Z=BROTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 15 2 ;link 3 12 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo sister ni show te ita . . }
#mess:   A=SHOW X=NURSE,THE Y=KITE,THE Z=SISTER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 1 ;link 2 18 1 ;link 3 11 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga sleep . . }
#mess:   A=SLEEP Y=DOG,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 6 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga jump . . }
#mess:   A=JUMP Y=TEACHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 14 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga run . . }
#mess:   A=RUN Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 7 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga ball wo cat ni give . . }
#mess:   A=GIVE X=WOMAN,THE Y=BALL,A Z=CAT,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 1 ;link 2 15 2 ;link 3 5 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga boy ni stick wo present ta . . }
#mess:   A=PRESENT X=FATHER,A Y=STICK,A Z=BOY,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 9 2 ;link 2 16 2 ;link 3 7 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo dog ga hit ta . . }
#mess:   A=HIT X=DOG,THE Y=TOY,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 17 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga man ni toy wo show te ita . . }
#mess:   A=SHOW X=NURSE,A Y=TOY,A Z=MAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 17 2 ;link 3 3 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga stick wo hit . . }
#mess:   A=HIT X=FATHER,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 9 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga teacher ni ball wo show ta . . }
#mess:   A=SHOW X=SISTER,THE Y=BALL,A Z=TEACHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 1 ;link 2 15 2 ;link 3 14 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga man ni stick wo give . . }
#mess:   A=GIVE X=WOMAN,THE Y=STICK,THE Z=MAN,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 4 1 ;link 2 16 1 ;link 3 3 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga toy wo kick te ita . . }
#mess:   A=KICK X=MAN,A Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 3 2 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga kite wo push te iru . . }
#mess:   A=PUSH X=MAN,A Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga sister ni kite wo throw te ita . . }
#mess:   A=THROW X=SISTER,A Y=KITE,THE Z=SISTER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 18 1 ;link 3 11 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo kick . . }
#mess:   A=KICK X=DOG,THE Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 1 ;link 2 18 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo girl ga hit ta . . }
#mess:   A=HIT X=GIRL,THE Y=STICK,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 8 1 ;link 2 16 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo push . . }
#mess:   A=PUSH X=DOG,THE Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 16 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo woman ni throw te ita . . }
#mess:   A=THROW X=BROTHER,THE Y=BALL,THE Z=WOMAN,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 15 1 ;link 3 4 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga walk ta . . }
#mess:   A=WALK Y=BROTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 12 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga run . . }
#mess:   A=RUN Y=SISTER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 11 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga man ni stick wo present te ita . . }
#mess:   A=PRESENT X=NURSE,THE Y=STICK,A Z=MAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 1 ;link 2 16 2 ;link 3 3 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo hit te ita . . }
#mess:   A=HIT X=DOG,A Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo kick te iru . . }
#mess:   A=KICK X=DOG,A Y=STICK,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 6 2 ;link 2 16 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo nurse ga kick te iru . . }
#mess:   A=KICK X=NURSE,THE Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga run te ita . . }
#mess:   A=RUN Y=TEACHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 14 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga ball wo push ta . . }
#mess:   A=PUSH X=CAT,THE Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga stick wo woman ni throw te ita . . }
#mess:   A=THROW X=FATHER,THE Y=STICK,A Z=WOMAN,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 1 ;link 2 16 2 ;link 3 4 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo teacher ga push te ita . . }
#mess:   A=PUSH X=TEACHER,THE Y=KITE,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 14 1 ;link 2 18 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga sleep te ita . . }
#mess:   A=SLEEP Y=WOMAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 4 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga girl ni toy wo throw te iru . . }
#mess:   A=THROW X=NURSE,A Y=TOY,A Z=GIRL,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 17 2 ;link 3 8 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga run te iru . . }
#mess:   A=RUN Y=DOG,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 6 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga ball wo cat ni throw te ita . . }
#mess:   A=THROW X=NURSE,A Y=BALL,THE Z=CAT,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 15 1 ;link 3 5 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga stick wo father ni present te iru . . }
#mess:   A=PRESENT X=WOMAN,A Y=STICK,THE Z=FATHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 4 2 ;link 2 16 1 ;link 3 9 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo push . . }
#mess:   A=PUSH X=BROTHER,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 12 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga boy ni toy wo give . . }
#mess:   A=GIVE X=CAT,A Y=TOY,THE Z=BOY,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 2 ;link 2 17 1 ;link 3 7 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo teacher ni give ta . . }
#mess:   A=GIVE X=SISTER,THE Y=STICK,THE Z=TEACHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 16 1 ;link 3 14 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo man ga push te iru . . }
#mess:   A=PUSH X=MAN,A Y=TOY,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 2 ;link 2 17 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo woman ga hit te iru . . }
#mess:   A=HIT X=WOMAN,THE Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo teacher ga carry . . }
#mess:   A=CARRY X=TEACHER,THE Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 14 1 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga man ni stick wo throw ta . . }
#mess:   A=THROW X=CAT,A Y=STICK,THE Z=MAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 5 2 ;link 2 16 1 ;link 3 3 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga hit . . }
#mess:   A=HIT X=MOTHER,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga ball wo man ni throw te iru . . }
#mess:   A=THROW X=BOY,A Y=BALL,THE Z=MAN,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 15 1 ;link 3 3 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga sister ni stick wo throw . . }
#mess:   A=THROW X=MAN,A Y=STICK,THE Z=SISTER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 3 2 ;link 2 16 1 ;link 3 11 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo sister ni show te iru . . }
#mess:   A=SHOW X=BROTHER,THE Y=KITE,THE Z=SISTER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 12 1 ;link 2 18 1 ;link 3 11 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo mother ni show te ita . . }
#mess:   A=SHOW X=FATHER,THE Y=BALL,A Z=MOTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 15 2 ;link 3 10 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga ball wo woman ni present te ita . . }
#mess:   A=PRESENT X=NURSE,A Y=BALL,THE Z=WOMAN,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 13 2 ;link 2 15 1 ;link 3 4 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo father ga push . . }
#mess:   A=PUSH X=FATHER,A Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 9 2 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo cat ni show te iru . . }
#mess:   A=SHOW X=SISTER,A Y=STICK,THE Z=CAT,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 16 1 ;link 3 5 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga toy wo cat ni present . . }
#mess:   A=PRESENT X=TEACHER,THE Y=TOY,A Z=CAT,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 14 1 ;link 2 17 2 ;link 3 5 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo girl ga carry . . }
#mess:   A=CARRY X=GIRL,THE Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga run ta . . }
#mess:   A=RUN Y=MAN,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 3 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga run te iru . . }
#mess:   A=RUN Y=CAT,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 5 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo sister ga carry te ita . . }
#mess:   A=CARRY X=SISTER,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 11 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga mother ni toy wo present te iru . . }
#mess:   A=PRESENT X=TEACHER,THE Y=TOY,THE Z=MOTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 14 1 ;link 2 17 1 ;link 3 10 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo teacher ni show . . }
#mess:   A=SHOW X=GIRL,THE Y=KITE,THE Z=TEACHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 18 1 ;link 3 14 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga stick wo carry . . }
#mess:   A=CARRY X=FATHER,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga ball wo mother ni give te iru . . }
#mess:   A=GIVE X=DOG,THE Y=BALL,THE Z=MOTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 1 ;link 2 15 1 ;link 3 10 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga stick wo carry . . }
#mess:   A=CARRY X=FATHER,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga stick wo brother ni give ta . . }
#mess:   A=GIVE X=MAN,THE Y=STICK,A Z=BROTHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 3 1 ;link 2 16 2 ;link 3 12 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga toy wo sister ni throw te iru . . }
#mess:   A=THROW X=TEACHER,A Y=TOY,THE Z=SISTER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 17 1 ;link 3 11 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo girl ga kick ta . . }
#mess:   A=KICK X=GIRL,THE Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 8 1 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga run ta . . }
#mess:   A=RUN Y=CAT,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 5 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo man ni show te ita . . }
#mess:   A=SHOW X=NURSE,A Y=STICK,A Z=MAN,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 16 2 ;link 3 3 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga sister ni stick wo give te iru . . }
#mess:   A=GIVE X=DOG,A Y=STICK,THE Z=SISTER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 16 1 ;link 3 11 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga walk . . }
#mess:   A=WALK Y=WOMAN,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 4 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga mother ni stick wo show te iru . . }
#mess:   A=SHOW X=BROTHER,A Y=STICK,A Z=MOTHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 2 ;link 2 16 2 ;link 3 10 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo boy ni present . . }
#mess:   A=PRESENT X=SISTER,A Y=STICK,A Z=BOY,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 11 2 ;link 2 16 2 ;link 3 7 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga girl ni ball wo present ta . . }
#mess:   A=PRESENT X=CAT,THE Y=BALL,THE Z=GIRL,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 15 1 ;link 3 8 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga walk te ita . . }
#mess:   A=WALK Y=NURSE,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 13 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga sleep . . }
#mess:   A=SLEEP Y=SISTER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 11 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga stick wo carry ta . . }
#mess:   A=CARRY X=MAN,A Y=STICK,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 16 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo mother ga hit te ita . . }
#mess:   A=HIT X=MOTHER,THE Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo cat ni give te iru . . }
#mess:   A=GIVE X=NURSE,A Y=KITE,A Z=CAT,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 18 2 ;link 3 5 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo kick te ita . . }
#mess:   A=KICK X=TEACHER,A Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 2 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo cat ga hit te ita . . }
#mess:   A=HIT X=CAT,THE Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 5 1 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga father ni kite wo show te ita . . }
#mess:   A=SHOW X=GIRL,A Y=KITE,A Z=FATHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 2 ;link 2 18 2 ;link 3 9 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo woman ga carry te iru . . }
#mess:   A=CARRY X=WOMAN,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga walk te ita . . }
#mess:   A=WALK Y=CAT,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga sleep te iru . . }
#mess:   A=SLEEP Y=NURSE,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 13 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga man ni ball wo show . . }
#mess:   A=SHOW X=WOMAN,A Y=BALL,A Z=MAN,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 2 ;link 2 15 2 ;link 3 3 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo boy ni present . . }
#mess:   A=PRESENT X=SISTER,THE Y=STICK,A Z=BOY,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 11 1 ;link 2 16 2 ;link 3 7 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo brother ga push te ita . . }
#mess:   A=PUSH X=BROTHER,THE Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga toy wo hit ta . . }
#mess:   A=HIT X=TEACHER,THE Y=TOY,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 17 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga walk ta . . }
#mess:   A=WALK Y=CAT,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga walk . . }
#mess:   A=WALK Y=FATHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 9 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga run te iru . . }
#mess:   A=RUN Y=BOY,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 7 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga sleep te iru . . }
#mess:   A=SLEEP Y=MAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 3 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo carry te iru . . }
#mess:   A=CARRY X=NURSE,A Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 13 2 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga stick wo mother ni give . . }
#mess:   A=GIVE X=TEACHER,THE Y=STICK,THE Z=MOTHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 16 1 ;link 3 10 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo mother ga carry te iru . . }
#mess:   A=CARRY X=MOTHER,A Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 10 2 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga stick wo hit te iru . . }
#mess:   A=HIT X=MAN,THE Y=STICK,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 3 1 ;link 2 16 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga walk . . }
#mess:   A=WALK Y=CAT,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga walk te ita . . }
#mess:   A=WALK Y=CAT,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga jump te ita . . }
#mess:   A=JUMP Y=SISTER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 11 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga stick wo hit . . }
#mess:   A=HIT X=GIRL,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 8 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga man ni stick wo throw ta . . }
#mess:   A=THROW X=TEACHER,THE Y=STICK,THE Z=MAN,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 16 1 ;link 3 3 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga sleep . . }
#mess:   A=SLEEP Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 6 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga father ni toy wo give . . }
#mess:   A=GIVE X=SISTER,THE Y=TOY,THE Z=FATHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 17 1 ;link 3 9 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo carry . . }
#mess:   A=CARRY X=GIRL,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga ball wo dog ni give ta . . }
#mess:   A=GIVE X=BROTHER,A Y=BALL,A Z=DOG,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 12 2 ;link 2 15 2 ;link 3 6 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga stick wo kick te iru . . }
#mess:   A=KICK X=GIRL,THE Y=STICK,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 1 ;link 2 16 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo nurse ni show . . }
#mess:   A=SHOW X=DOG,THE Y=STICK,A Z=NURSE,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 16 2 ;link 3 13 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga dog ni toy wo present ta . . }
#mess:   A=PRESENT X=SISTER,THE Y=TOY,A Z=DOG,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 11 1 ;link 2 17 2 ;link 3 6 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga stick wo carry . . }
#mess:   A=CARRY X=MAN,A Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo woman ga hit . . }
#mess:   A=HIT X=WOMAN,A Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo cat ga carry te ita . . }
#mess:   A=CARRY X=CAT,THE Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 5 1 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga brother ni kite wo show ta . . }
#mess:   A=SHOW X=SISTER,A Y=KITE,THE Z=BROTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 18 1 ;link 3 12 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo carry ta . . }
#mess:   A=CARRY X=GIRL,THE Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo girl ga push te ita . . }
#mess:   A=PUSH X=GIRL,A Y=KITE,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 8 2 ;link 2 18 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga kite wo hit te iru . . }
#mess:   A=HIT X=MOTHER,A Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 10 2 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga toy wo kick te iru . . }
#mess:   A=KICK X=BOY,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 7 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga kite wo brother ni give ta . . }
#mess:   A=GIVE X=WOMAN,A Y=KITE,THE Z=BROTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 4 2 ;link 2 18 1 ;link 3 12 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga man ni kite wo give te ita . . }
#mess:   A=GIVE X=NURSE,A Y=KITE,THE Z=MAN,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 13 2 ;link 2 18 1 ;link 3 3 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo dog ga push ta . . }
#mess:   A=PUSH X=DOG,THE Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo sister ga hit te iru . . }
#mess:   A=HIT X=SISTER,THE Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo woman ga kick te iru . . }
#mess:   A=KICK X=WOMAN,THE Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 4 1 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo dog ga kick te ita . . }
#mess:   A=KICK X=DOG,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 6 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga ball wo kick . . }
#mess:   A=KICK X=CAT,THE Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 5 1 ;link 2 15 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga brother ni toy wo give ta . . }
#mess:   A=GIVE X=MOTHER,A Y=TOY,THE Z=BROTHER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 10 2 ;link 2 17 1 ;link 3 12 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga run . . }
#mess:   A=RUN Y=SISTER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 11 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga teacher ni kite wo present te iru . . }
#mess:   A=PRESENT X=BROTHER,THE Y=KITE,A Z=TEACHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 12 1 ;link 2 18 2 ;link 3 14 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga walk . . }
#mess:   A=WALK Y=NURSE,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 13 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga toy wo father ni show ta . . }
#mess:   A=SHOW X=WOMAN,THE Y=TOY,A Z=FATHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 4 1 ;link 2 17 2 ;link 3 9 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo father ga kick ta . . }
#mess:   A=KICK X=FATHER,A Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 9 2 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga toy wo girl ni present . . }
#mess:   A=PRESENT X=FATHER,A Y=TOY,A Z=GIRL,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 9 2 ;link 2 17 2 ;link 3 8 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga jump . . }
#mess:   A=JUMP Y=BOY,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 7 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga kite wo hit . . }
#mess:   A=HIT X=NURSE,THE Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 13 1 ;link 2 18 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga ball wo push te ita . . }
#mess:   A=PUSH X=WOMAN,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 4 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga walk te iru . . }
#mess:   A=WALK Y=GIRL,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 8 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo dog ga push te ita . . }
#mess:   A=PUSH X=DOG,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga jump . . }
#mess:   A=JUMP Y=BROTHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 12 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga ball wo carry . . }
#mess:   A=CARRY X=CAT,A Y=BALL,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 2 ;link 2 15 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sleep te ita . . }
#mess:   A=SLEEP Y=BROTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 12 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga father ni stick wo throw te iru . . }
#mess:   A=THROW X=TEACHER,A Y=STICK,A Z=FATHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 14 2 ;link 2 16 2 ;link 3 9 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga brother ni toy wo give te iru . . }
#mess:   A=GIVE X=CAT,A Y=TOY,THE Z=BROTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 2 ;link 2 17 1 ;link 3 12 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga jump te iru . . }
#mess:   A=JUMP Y=WOMAN,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 4 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo boy ni show te ita . . }
#mess:   A=SHOW X=GIRL,THE Y=TOY,A Z=BOY,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 17 2 ;link 3 7 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo father ni present te ita . . }
#mess:   A=PRESENT X=GIRL,A Y=BALL,A Z=FATHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 8 2 ;link 2 15 2 ;link 3 9 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga toy wo dog ni give te ita . . }
#mess:   A=GIVE X=BOY,A Y=TOY,THE Z=DOG,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 2 ;link 2 17 1 ;link 3 6 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga walk te iru . . }
#mess:   A=WALK Y=DOG,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 6 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga run te iru . . }
#mess:   A=RUN Y=FATHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 9 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga sleep te iru . . }
#mess:   A=SLEEP Y=DOG,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 6 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga nurse ni toy wo present te iru . . }
#mess:   A=PRESENT X=SISTER,A Y=TOY,A Z=NURSE,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 11 2 ;link 2 17 2 ;link 3 13 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo man ni present te iru . . }
#mess:   A=PRESENT X=TEACHER,A Y=KITE,A Z=MAN,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 14 2 ;link 2 18 2 ;link 3 3 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo mother ni give te iru . . }
#mess:   A=GIVE X=DOG,A Y=STICK,A Z=MOTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 2 ;link 2 16 2 ;link 3 10 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo mother ni throw ta . . }
#mess:   A=THROW X=SISTER,A Y=BALL,A Z=MOTHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 11 2 ;link 2 15 2 ;link 3 10 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo teacher ga kick te ita . . }
#mess:   A=KICK X=TEACHER,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga run te ita . . }
#mess:   A=RUN Y=BROTHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 12 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo push te ita . . }
#mess:   A=PUSH X=DOG,A Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 2 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump . . }
#mess:   A=JUMP Y=FATHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 9 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo sister ga kick . . }
#mess:   A=KICK X=SISTER,A Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 11 2 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga run . . }
#mess:   A=RUN Y=MAN,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 3 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo carry te ita . . }
#mess:   A=CARRY X=TEACHER,A Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 14 2 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo man ga push ta . . }
#mess:   A=PUSH X=MAN,THE Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga father ni toy wo throw . . }
#mess:   A=THROW X=BOY,A Y=TOY,THE Z=FATHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 2 ;link 2 17 1 ;link 3 9 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga boy ni ball wo show te ita . . }
#mess:   A=SHOW X=WOMAN,THE Y=BALL,A Z=BOY,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 1 ;link 2 15 2 ;link 3 7 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga toy wo sister ni throw te ita . . }
#mess:   A=THROW X=MOTHER,A Y=TOY,THE Z=SISTER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 10 2 ;link 2 17 1 ;link 3 11 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga stick wo hit . . }
#mess:   A=HIT X=TEACHER,THE Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump te iru . . }
#mess:   A=JUMP Y=FATHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 9 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga brother ni kite wo present te ita . . }
#mess:   A=PRESENT X=WOMAN,A Y=KITE,A Z=BROTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 4 2 ;link 2 18 2 ;link 3 12 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo nurse ga kick te iru . . }
#mess:   A=KICK X=NURSE,A Y=TOY,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 17 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga toy wo boy ni give . . }
#mess:   A=GIVE X=FATHER,A Y=TOY,A Z=BOY,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 17 2 ;link 3 7 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga ball wo teacher ni present te ita . . }
#mess:   A=PRESENT X=WOMAN,A Y=BALL,A Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 4 2 ;link 2 15 2 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga nurse ni ball wo give ta . . }
#mess:   A=GIVE X=BROTHER,THE Y=BALL,THE Z=NURSE,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 12 1 ;link 2 15 1 ;link 3 13 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga ball wo man ni give te iru . . }
#mess:   A=GIVE X=MAN,A Y=BALL,THE Z=MAN,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 3 2 ;link 2 15 1 ;link 3 3 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga jump te iru . . }
#mess:   A=JUMP Y=MOTHER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 10 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga run . . }
#mess:   A=RUN Y=WOMAN,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 4 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo kick te iru . . }
#mess:   A=KICK X=BROTHER,A Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 2 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga woman ni stick wo show te iru . . }
#mess:   A=SHOW X=NURSE,THE Y=STICK,THE Z=WOMAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 1 ;link 2 16 1 ;link 3 4 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo dog ni present . . }
#mess:   A=PRESENT X=BROTHER,A Y=KITE,THE Z=DOG,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 2 ;link 2 18 1 ;link 3 6 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga stick wo hit te iru . . }
#mess:   A=HIT X=WOMAN,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo man ga kick . . }
#mess:   A=KICK X=MAN,THE Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 3 1 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga sister ni stick wo give ta . . }
#mess:   A=GIVE X=FATHER,THE Y=STICK,A Z=SISTER,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 16 2 ;link 3 11 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga toy wo mother ni throw ta . . }
#mess:   A=THROW X=BROTHER,A Y=TOY,A Z=MOTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 17 2 ;link 3 10 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga kick . . }
#mess:   A=KICK X=MOTHER,THE Y=TOY,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 10 1 ;link 2 17 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo brother ni present te iru . . }
#mess:   A=PRESENT X=SISTER,THE Y=TOY,A Z=BROTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 11 1 ;link 2 17 2 ;link 3 12 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga brother ni stick wo give te iru . . }
#mess:   A=GIVE X=MAN,THE Y=STICK,A Z=BROTHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 3 1 ;link 2 16 2 ;link 3 12 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga walk . . }
#mess:   A=WALK Y=NURSE,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 13 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga run te ita . . }
#mess:   A=RUN Y=MOTHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 10 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo sister ga hit . . }
#mess:   A=HIT X=SISTER,A Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga ball wo hit te iru . . }
#mess:   A=HIT X=DOG,A Y=BALL,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 15 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga run te ita . . }
#mess:   A=RUN Y=MAN,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 3 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo mother ga hit ta . . }
#mess:   A=HIT X=MOTHER,A Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 2 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga jump te ita . . }
#mess:   A=JUMP Y=FATHER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 9 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo kick . . }
#mess:   A=KICK X=BROTHER,A Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 12 2 ;link 2 18 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga sleep . . }
#mess:   A=SLEEP Y=MOTHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 10 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo brother ga carry te ita . . }
#mess:   A=CARRY X=BROTHER,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga jump . . }
#mess:   A=JUMP Y=TEACHER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 14 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga woman ni kite wo throw . . }
#mess:   A=THROW X=FATHER,A Y=KITE,A Z=WOMAN,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 9 2 ;link 2 18 2 ;link 3 4 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga jump ta . . }
#mess:   A=JUMP Y=MOTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 10 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga father ni stick wo give . . }
#mess:   A=GIVE X=WOMAN,THE Y=STICK,THE Z=FATHER,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 4 1 ;link 2 16 1 ;link 3 9 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga kite wo carry te ita . . }
#mess:   A=CARRY X=BROTHER,A Y=KITE,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 12 2 ;link 2 18 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga kite wo push te iru . . }
#mess:   A=PUSH X=SISTER,A Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 2 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga mother ni kite wo throw te ita . . }
#mess:   A=THROW X=FATHER,A Y=KITE,A Z=MOTHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 9 2 ;link 2 18 2 ;link 3 10 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo dog ga push ta . . }
#mess:   A=PUSH X=DOG,THE Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 6 1 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga jump . . }
#mess:   A=JUMP Y=TEACHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 14 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo man ga push ta . . }
#mess:   A=PUSH X=MAN,THE Y=STICK,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 16 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga kite wo boy ni present . . }
#mess:   A=PRESENT X=CAT,A Y=KITE,THE Z=BOY,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 5 2 ;link 2 18 1 ;link 3 7 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga jump . . }
#mess:   A=JUMP Y=GIRL,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 8 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga toy wo nurse ni show te iru . . }
#mess:   A=SHOW X=MAN,THE Y=TOY,THE Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 17 1 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga ball wo hit ta . . }
#mess:   A=HIT X=TEACHER,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga walk te ita . . }
#mess:   A=WALK Y=GIRL,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 8 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga girl ni kite wo throw te iru . . }
#mess:   A=THROW X=BROTHER,THE Y=KITE,A Z=GIRL,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 18 2 ;link 3 8 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga ball wo brother ni give te iru . . }
#mess:   A=GIVE X=BOY,THE Y=BALL,THE Z=BROTHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 7 1 ;link 2 15 1 ;link 3 12 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo kick ta . . }
#mess:   A=KICK X=FATHER,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga toy wo cat ni throw ta . . }
#mess:   A=THROW X=CAT,THE Y=TOY,THE Z=CAT,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 5 1 ;link 2 17 1 ;link 3 5 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga toy wo dog ni present ta . . }
#mess:   A=PRESENT X=MOTHER,A Y=TOY,THE Z=DOG,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 2 ;link 2 17 1 ;link 3 6 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga kite wo carry . . }
#mess:   A=CARRY X=BOY,A Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 18 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga mother ni stick wo show te ita . . }
#mess:   A=SHOW X=FATHER,THE Y=STICK,THE Z=MOTHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 9 1 ;link 2 16 1 ;link 3 10 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo woman ga kick te ita . . }
#mess:   A=KICK X=WOMAN,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 4 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga stick wo push te iru . . }
#mess:   A=PUSH X=CAT,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 5 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga boy ni stick wo give te iru . . }
#mess:   A=GIVE X=DOG,THE Y=STICK,A Z=BOY,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 6 1 ;link 2 16 2 ;link 3 7 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga dog ni toy wo show te iru . . }
#mess:   A=SHOW X=MAN,THE Y=TOY,A Z=DOG,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 17 2 ;link 3 6 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga sleep te iru . . }
#mess:   A=SLEEP Y=SISTER,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 11 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga stick wo push . . }
#mess:   A=PUSH X=BROTHER,THE Y=STICK,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 16 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga ball wo mother ni show te ita . . }
#mess:   A=SHOW X=NURSE,A Y=BALL,THE Z=MOTHER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 15 1 ;link 3 10 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga toy wo push te ita . . }
#mess:   A=PUSH X=FATHER,A Y=TOY,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 9 2 ;link 2 17 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga stick wo father ni give ta . . }
#mess:   A=GIVE X=GIRL,THE Y=STICK,A Z=FATHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 8 1 ;link 2 16 2 ;link 3 9 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga ball wo cat ni give te ita . . }
#mess:   A=GIVE X=NURSE,THE Y=BALL,THE Z=CAT,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 13 1 ;link 2 15 1 ;link 3 5 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo hit . . }
#mess:   A=HIT X=SISTER,THE Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 15 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga woman ni kite wo throw te ita . . }
#mess:   A=THROW X=MOTHER,A Y=KITE,THE Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 10 2 ;link 2 18 1 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo cat ga carry te ita . . }
#mess:   A=CARRY X=CAT,THE Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 5 1 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga man ni kite wo give te ita . . }
#mess:   A=GIVE X=SISTER,THE Y=KITE,THE Z=MAN,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 11 1 ;link 2 18 1 ;link 3 3 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo sister ni show ta . . }
#mess:   A=SHOW X=DOG,A Y=KITE,A Z=SISTER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 6 2 ;link 2 18 2 ;link 3 11 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga kite wo push te iru . . }
#mess:   A=PUSH X=SISTER,A Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 2 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga kite wo hit . . }
#mess:   A=HIT X=MOTHER,THE Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 18 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo nurse ga push . . }
#mess:   A=PUSH X=NURSE,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 13 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga sleep te iru . . }
#mess:   A=SLEEP Y=WOMAN,A E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 4 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga run ta . . }
#mess:   A=RUN Y=BROTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 12 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga teacher ni kite wo throw te ita . . }
#mess:   A=THROW X=BOY,THE Y=KITE,A Z=TEACHER,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 1 ;link 2 18 2 ;link 3 14 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga stick wo kick te iru . . }
#mess:   A=KICK X=BOY,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 7 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo woman ga hit . . }
#mess:   A=HIT X=WOMAN,A Y=KITE,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 2 ;link 2 18 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga kite wo kick te iru . . }
#mess:   A=KICK X=MOTHER,THE Y=KITE,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 10 1 ;link 2 18 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo woman ga hit . . }
#mess:   A=HIT X=WOMAN,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo boy ga kick te ita . . }
#mess:   A=KICK X=BOY,THE Y=STICK,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 7 1 ;link 2 16 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo carry . . }
#mess:   A=CARRY X=DOG,THE Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 18 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo teacher ni throw te ita . . }
#mess:   A=THROW X=GIRL,THE Y=TOY,A Z=TEACHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 8 1 ;link 2 17 2 ;link 3 14 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga mother ni ball wo show te ita . . }
#mess:   A=SHOW X=NURSE,THE Y=BALL,A Z=MOTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 1 ;link 2 15 2 ;link 3 10 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga jump te iru . . }
#mess:   A=JUMP Y=WOMAN,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 4 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo hit . . }
#mess:   A=HIT X=DOG,THE Y=KITE,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 18 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga man ni toy wo show . . }
#mess:   A=SHOW X=CAT,THE Y=TOY,A Z=MAN,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 17 2 ;link 3 3 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga woman ni kite wo throw te iru . . }
#mess:   A=THROW X=NURSE,A Y=KITE,THE Z=WOMAN,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 18 1 ;link 3 4 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga man ni ball wo give te ita . . }
#mess:   A=GIVE X=DOG,THE Y=BALL,A Z=MAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 6 1 ;link 2 15 2 ;link 3 3 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga ball wo dog ni throw ta . . }
#mess:   A=THROW X=DOG,THE Y=BALL,A Z=DOG,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 6 1 ;link 2 15 2 ;link 3 6 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga sleep ta . . }
#mess:   A=SLEEP Y=NURSE,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 13 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo sister ga carry ta . . }
#mess:   A=CARRY X=SISTER,THE Y=STICK,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 11 1 ;link 2 16 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo sister ga hit ta . . }
#mess:   A=HIT X=SISTER,THE Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 1 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga sleep te ita . . }
#mess:   A=SLEEP Y=DOG,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 6 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo hit ta . . }
#mess:   A=HIT X=DOG,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 6 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo mother ga kick te ita . . }
#mess:   A=KICK X=MOTHER,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 10 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga run te ita . . }
#mess:   A=RUN Y=MAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 3 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo kick ta . . }
#mess:   A=KICK X=TEACHER,A Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 2 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga toy wo cat ni give te iru . . }
#mess:   A=GIVE X=FATHER,A Y=TOY,THE Z=CAT,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 9 2 ;link 2 17 1 ;link 3 5 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga walk te iru . . }
#mess:   A=WALK Y=MAN,A E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 3 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga mother ni ball wo show . . }
#mess:   A=SHOW X=GIRL,THE Y=BALL,THE Z=MOTHER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 8 1 ;link 2 15 1 ;link 3 10 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga dog ni toy wo throw te iru . . }
#mess:   A=THROW X=BROTHER,THE Y=TOY,THE Z=DOG,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 1 ;link 2 17 1 ;link 3 6 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga ball wo boy ni throw te iru . . }
#mess:   A=THROW X=CAT,THE Y=BALL,THE Z=BOY,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 5 1 ;link 2 15 1 ;link 3 7 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo woman ga carry te ita . . }
#mess:   A=CARRY X=WOMAN,THE Y=STICK,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 1 ;link 2 16 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga walk te ita . . }
#mess:   A=WALK Y=DOG,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 6 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga nurse ni kite wo present te iru . . }
#mess:   A=PRESENT X=MAN,THE Y=KITE,THE Z=NURSE,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 18 1 ;link 3 13 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga sleep te ita . . }
#mess:   A=SLEEP Y=NURSE,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 13 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo father ga hit . . }
#mess:   A=HIT X=FATHER,A Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 9 2 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga ball wo hit te ita . . }
#mess:   A=HIT X=BOY,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 7 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo teacher ga kick te iru . . }
#mess:   A=KICK X=TEACHER,THE Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga stick wo push ta . . }
#mess:   A=PUSH X=WOMAN,THE Y=STICK,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 23 ;link 1 4 1 ;link 2 16 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga stick wo push te ita . . }
#mess:   A=PUSH X=FATHER,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 9 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga kite wo carry te ita . . }
#mess:   A=CARRY X=MOTHER,A Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 10 2 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga kite wo kick te ita . . }
#mess:   A=KICK X=GIRL,A Y=KITE,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 18 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga ball wo hit . . }
#mess:   A=HIT X=FATHER,THE Y=BALL,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 9 1 ;link 2 15 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo dog ni throw te iru . . }
#mess:   A=THROW X=TEACHER,THE Y=KITE,A Z=DOG,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 14 1 ;link 2 18 2 ;link 3 6 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo teacher ga kick te iru . . }
#mess:   A=KICK X=TEACHER,THE Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 14 1 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga cat ni toy wo throw . . }
#mess:   A=THROW X=MOTHER,THE Y=TOY,THE Z=CAT,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 10 1 ;link 2 17 1 ;link 3 5 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga ball wo carry te ita . . }
#mess:   A=CARRY X=NURSE,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 13 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga jump . . }
#mess:   A=JUMP Y=DOG,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 6 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga run te iru . . }
#mess:   A=RUN Y=NURSE,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 13 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga walk te ita . . }
#mess:   A=WALK Y=SISTER,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 11 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo nurse ga carry te ita . . }
#mess:   A=CARRY X=NURSE,A Y=TOY,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 13 2 ;link 2 17 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo kick te ita . . }
#mess:   A=KICK X=GIRL,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 8 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga walk ta . . }
#mess:   A=WALK Y=NURSE,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 13 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo hit ta . . }
#mess:   A=HIT X=GIRL,A Y=BALL,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 8 2 ;link 2 15 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga girl ni toy wo show . . }
#mess:   A=SHOW X=TEACHER,THE Y=TOY,A Z=GIRL,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 14 1 ;link 2 17 2 ;link 3 8 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga run . . }
#mess:   A=RUN Y=SISTER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 11 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga jump . . }
#mess:   A=JUMP Y=SISTER,THE E=PRES,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 11 1 ;tlink 0 2 5;} 
5
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga ball wo father ni present te iru . . }
#mess:   A=PRESENT X=MOTHER,A Y=BALL,A Z=FATHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 10 2 ;link 2 15 2 ;link 3 9 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo brother ga push ta . . }
#mess:   A=PUSH X=BROTHER,THE Y=BALL,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 12 1 ;link 2 15 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga stick wo cat ni show ta . . }
#mess:   A=SHOW X=NURSE,A Y=STICK,THE Z=CAT,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 16 1 ;link 3 5 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo push te iru . . }
#mess:   A=PUSH X=DOG,A Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 6 2 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo carry te ita . . }
#mess:   A=CARRY X=DOG,THE Y=STICK,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 16 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga sleep te iru . . }
#mess:   A=SLEEP Y=SISTER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 11 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga ball wo girl ni present ta . . }
#mess:   A=PRESENT X=BOY,A Y=BALL,A Z=GIRL,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 7 2 ;link 2 15 2 ;link 3 8 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga toy wo dog ni show te ita . . }
#mess:   A=SHOW X=TEACHER,A Y=TOY,THE Z=DOG,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 14 2 ;link 2 17 1 ;link 3 6 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo woman ga hit te iru . . }
#mess:   A=HIT X=WOMAN,THE Y=KITE,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 18 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga sister ni toy wo show te iru . . }
#mess:   A=SHOW X=MAN,THE Y=TOY,A Z=SISTER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 3 1 ;link 2 17 2 ;link 3 11 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo hit . . }
#mess:   A=HIT X=TEACHER,THE Y=KITE,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 14 1 ;link 2 18 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga mother ni ball wo show ta . . }
#mess:   A=SHOW X=DOG,THE Y=BALL,A Z=MOTHER,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 6 1 ;link 2 15 2 ;link 3 10 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo father ga hit te ita . . }
#mess:   A=HIT X=FATHER,THE Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 9 1 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo dog ga kick ta . . }
#mess:   A=KICK X=DOG,A Y=TOY,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 6 2 ;link 2 17 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo mother ga hit ta . . }
#mess:   A=HIT X=MOTHER,THE Y=BALL,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 10 1 ;link 2 15 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga sleep te ita . . }
#mess:   A=SLEEP Y=WOMAN,A E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 4 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo woman ga carry te ita . . }
#mess:   A=CARRY X=WOMAN,A Y=BALL,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 4 2 ;link 2 15 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga ball wo push te ita . . }
#mess:   A=PUSH X=GIRL,A Y=BALL,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 8 2 ;link 2 15 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo nurse ga kick te iru . . }
#mess:   A=KICK X=NURSE,THE Y=STICK,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 1 ;link 2 16 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga man ni kite wo give . . }
#mess:   A=GIVE X=CAT,A Y=KITE,A Z=MAN,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 2 ;link 2 18 2 ;link 3 3 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga ball wo woman ni present ta . . }
#mess:   A=PRESENT X=TEACHER,THE Y=BALL,A Z=WOMAN,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 14 1 ;link 2 15 2 ;link 3 4 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga stick wo brother ni show te iru . . }
#mess:   A=SHOW X=MOTHER,THE Y=STICK,THE Z=BROTHER,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 10 1 ;link 2 16 1 ;link 3 12 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo dog ga hit . . }
#mess:   A=HIT X=DOG,THE Y=TOY,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 6 1 ;link 2 17 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga toy wo hit te ita . . }
#mess:   A=HIT X=NURSE,A Y=TOY,THE E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 13 2 ;link 2 17 1 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga man ni kite wo throw te ita . . }
#mess:   A=THROW X=BROTHER,A Y=KITE,A Z=MAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 18 2 ;link 3 3 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo girl ga carry te ita . . }
#mess:   A=CARRY X=GIRL,THE Y=BALL,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 8 1 ;link 2 15 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga woman ni toy wo throw te ita . . }
#mess:   A=THROW X=BOY,THE Y=TOY,A Z=WOMAN,A E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 7 1 ;link 2 17 2 ;link 3 4 2 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga walk te ita . . }
#mess:   A=WALK Y=CAT,A E=PAST,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 5 2 ;tlink 1 3 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga girl ni stick wo give te iru . . }
#mess:   A=GIVE X=MOTHER,A Y=STICK,THE Z=GIRL,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 10 2 ;link 2 16 1 ;link 3 8 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga stick wo kick . . }
#mess:   A=KICK X=TEACHER,A Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 14 2 ;link 2 16 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga cat ni stick wo show . . }
#mess:   A=SHOW X=SISTER,A Y=STICK,A Z=CAT,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 11 2 ;link 2 16 2 ;link 3 5 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga ball wo hit te ita . . }
#mess:   A=HIT X=MOTHER,A Y=BALL,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 24 ;link 1 10 2 ;link 2 15 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga kite wo sister ni present te ita . . }
#mess:   A=PRESENT X=BOY,THE Y=KITE,THE Z=SISTER,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 7 1 ;link 2 18 1 ;link 3 11 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo boy ga carry ta . . }
#mess:   A=CARRY X=BOY,A Y=KITE,A E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 18 2 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga toy wo push te iru . . }
#mess:   A=PUSH X=FATHER,THE Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 9 1 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo kick . . }
#mess:   A=KICK X=SISTER,A Y=STICK,A E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 11 2 ;link 2 16 2 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga father ni stick wo throw te iru . . }
#mess:   A=THROW X=CAT,THE Y=STICK,A Z=FATHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 5 1 ;link 2 16 2 ;link 3 9 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga toy wo carry . . }
#mess:   A=CARRY X=CAT,A Y=TOY,THE E=PRES,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 5 2 ;link 2 17 1 ;tlink 0 2 4 5;} 
7
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga girl ni stick wo present . . }
#mess:   A=PRESENT X=MAN,THE Y=STICK,THE Z=GIRL,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 3 1 ;link 2 16 1 ;link 3 8 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo man ga carry te iru . . }
#mess:   A=CARRY X=MAN,THE Y=BALL,THE E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 1 ;link 2 15 1 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga stick wo push te iru . . }
#mess:   A=PUSH X=MOTHER,THE Y=STICK,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 10 1 ;link 2 16 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo father ni show ta . . }
#mess:   A=SHOW X=DOG,A Y=STICK,A Z=FATHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 6 2 ;link 2 16 2 ;link 3 9 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga cat ni stick wo show . . }
#mess:   A=SHOW X=NURSE,A Y=STICK,THE Z=CAT,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 13 2 ;link 2 16 1 ;link 3 5 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ man ga stick wo push te ita . . }
#mess:   A=PUSH X=MAN,THE Y=STICK,A E=PAST,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 3 1 ;link 2 16 2 ;tlink 1 3 4 5;} 
9
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo nurse ni present te iru . . }
#mess:   A=PRESENT X=GIRL,A Y=TOY,THE Z=NURSE,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 8 2 ;link 2 17 1 ;link 3 13 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga cat ni ball wo give ta . . }
#mess:   A=GIVE X=TEACHER,THE Y=BALL,THE Z=CAT,A E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 14 1 ;link 2 15 1 ;link 3 5 2 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga toy wo carry te iru . . }
#mess:   A=CARRY X=BOY,A Y=TOY,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 7 2 ;link 2 17 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga teacher ni toy wo show te iru . . }
#mess:   A=SHOW X=MOTHER,THE Y=TOY,A Z=TEACHER,A E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 10 1 ;link 2 17 2 ;link 3 14 2 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sister ni stick wo throw . . }
#mess:   A=THROW X=BROTHER,A Y=STICK,A Z=SISTER,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 12 2 ;link 2 16 2 ;link 3 11 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga kite wo mother ni show te iru . . }
#mess:   A=SHOW X=TEACHER,A Y=KITE,A Z=MOTHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 14 2 ;link 2 18 2 ;link 3 10 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo brother ni throw ta . . }
#mess:   A=THROW X=FATHER,A Y=KITE,THE Z=BROTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 9 2 ;link 2 18 1 ;link 3 12 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga walk te iru . . }
#mess:   A=WALK Y=MOTHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 10 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga toy wo mother ni show . . }
#mess:   A=SHOW X=TEACHER,A Y=TOY,THE Z=MOTHER,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 14 2 ;link 2 17 1 ;link 3 10 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga walk te iru . . }
#mess:   A=WALK Y=FATHER,THE E=PRES,PROG,YY  
proc:{ clear ;link 0 21 ;link 2 9 1 ;tlink 0 3 5;} 
7
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga ball wo girl ni give te ita . . }
#mess:   A=GIVE X=TEACHER,A Y=BALL,THE Z=GIRL,THE E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 14 2 ;link 2 15 1 ;link 3 8 1 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo brother ga carry te iru . . }
#mess:   A=CARRY X=BROTHER,THE Y=BALL,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 12 1 ;link 2 15 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga kite wo brother ni present te ita . . }
#mess:   A=PRESENT X=SISTER,A Y=KITE,A Z=BROTHER,A E=PAST,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 11 2 ;link 2 18 2 ;link 3 12 2 ;tlink 1 3 4 5 -1 6;} 
11
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ toy wo boy ga hit te ita . . }
#mess:   A=HIT X=BOY,A Y=TOY,THE E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 7 2 ;link 2 17 1 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga man ni kite wo present ta . . }
#mess:   A=PRESENT X=CAT,THE Y=KITE,A Z=MAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 5 1 ;link 2 18 2 ;link 3 3 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga jump te ita . . }
#mess:   A=JUMP Y=GIRL,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 8 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ stick wo teacher ga hit . . }
#mess:   A=HIT X=TEACHER,A Y=STICK,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 14 2 ;link 2 16 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo sister ni give ta . . }
#mess:   A=GIVE X=SISTER,A Y=STICK,THE Z=SISTER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 11 2 ;link 2 16 1 ;link 3 11 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ teacher ga sleep . . }
#mess:   A=SLEEP Y=TEACHER,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 19 ;link 2 14 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 14
t:{word 1.0} 14
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga toy wo brother ni present te iru . . }
#mess:   A=PRESENT X=BROTHER,THE Y=TOY,A Z=BROTHER,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 12 1 ;link 2 17 2 ;link 3 12 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga kite wo kick ta . . }
#mess:   A=KICK X=CAT,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 5 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga man ni stick wo give ta . . }
#mess:   A=GIVE X=FATHER,THE Y=STICK,A Z=MAN,THE E=PAST,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 9 1 ;link 2 16 2 ;link 3 3 1 ;tlink 1 2 4 6 5;} 
10
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga toy wo girl ni show . . }
#mess:   A=SHOW X=SISTER,THE Y=TOY,A Z=GIRL,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 11 1 ;link 2 17 2 ;link 3 8 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga sleep te ita . . }
#mess:   A=SLEEP Y=BROTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 19 ;link 2 12 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 19
t:{word 1.0} 19
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga ball wo push te iru . . }
#mess:   A=PUSH X=SISTER,A Y=BALL,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 23 ;link 1 11 2 ;link 2 15 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga walk . . }
#mess:   A=WALK Y=NURSE,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 13 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga toy wo father ni present . . }
#mess:   A=PRESENT X=BOY,A Y=TOY,A Z=FATHER,THE E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 7 2 ;link 2 17 2 ;link 3 9 1 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo woman ni throw ta . . }
#mess:   A=THROW X=GIRL,A Y=TOY,THE Z=WOMAN,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 8 2 ;link 2 17 1 ;link 3 4 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga girl ni kite wo show te ita . . }
#mess:   A=SHOW X=WOMAN,THE Y=KITE,A Z=GIRL,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 4 1 ;link 2 18 2 ;link 3 8 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga jump ta . . }
#mess:   A=JUMP Y=BROTHER,A E=PAST,SIMP,YY  
proc:{ clear ;link 0 20 ;link 2 12 2 ;tlink 1 2 5;} 
6
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo girl ni give . . }
#mess:   A=GIVE X=DOG,THE Y=STICK,A Z=GIRL,A E=PRES,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 27 ;link 1 6 1 ;link 2 16 2 ;link 3 8 2 ;tlink 0 2 4 5 -1 6;} 
9
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo nurse ga kick . . }
#mess:   A=KICK X=NURSE,A Y=BALL,THE E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 25 ;link 1 13 2 ;link 2 15 1 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga boy ni kite wo present te ita . . }
#mess:   A=PRESENT X=NURSE,THE Y=KITE,THE Z=BOY,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 30 ;link 1 13 1 ;link 2 18 1 ;link 3 7 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ boy ga run te iru . . }
#mess:   A=RUN Y=BOY,A E=PRES,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 7 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga father ni stick wo throw te iru . . }
#mess:   A=THROW X=DOG,THE Y=STICK,THE Z=FATHER,THE E=PRES,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 6 1 ;link 2 16 1 ;link 3 9 1 ;tlink 0 3 4 6 5;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo cat ga push ta . . }
#mess:   A=PUSH X=CAT,A Y=KITE,THE E=PAST,SIMP,YY,-1,XX  
proc:{ clear ;link 0 23 ;link 1 5 2 ;link 2 18 1 ;tlink 1 2 5 -1 4;} 
8
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 23
t:{word 1.0} 23
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ sister ga stick wo kick te iru . . }
#mess:   A=KICK X=SISTER,THE Y=STICK,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 11 1 ;link 2 16 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga kite wo brother ni present ta . . }
#mess:   A=PRESENT X=DOG,A Y=KITE,THE Z=BROTHER,A E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 18 1 ;link 3 12 2 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo carry te iru . . }
#mess:   A=CARRY X=FATHER,A Y=KITE,A E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 18 2 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo sister ga hit . . }
#mess:   A=HIT X=SISTER,A Y=BALL,A E=PRES,SIMP,YY,-1,XX  
proc:{ clear ;link 0 24 ;link 1 11 2 ;link 2 15 2 ;tlink 0 2 5 -1 4;} 
7
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 11
t:{word 1.0} 11
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ brother ga brother ni kite wo show te ita . . }
#mess:   A=SHOW X=BROTHER,A Y=KITE,THE Z=BROTHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 12 2 ;link 2 18 1 ;link 3 12 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 12
t:{word 1.0} 12
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ kite wo man ga carry te iru . . }
#mess:   A=CARRY X=MAN,A Y=KITE,A E=PRES,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 3 2 ;link 2 18 2 ;tlink 0 3 5 -1 4;} 
9
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ ball wo dog ga carry te ita . . }
#mess:   A=CARRY X=DOG,THE Y=BALL,A E=PAST,PROG,YY,-1,XX  
proc:{ clear ;link 0 26 ;link 1 6 1 ;link 2 15 2 ;tlink 1 3 5 -1 4;} 
9
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga run . . }
#mess:   A=RUN Y=CAT,A E=PRES,SIMP,YY  
proc:{ clear ;link 0 22 ;link 2 5 2 ;tlink 0 2 5;} 
5
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ dog ga stick wo nurse ni present te iru . . }
#mess:   A=PRESENT X=DOG,A Y=STICK,THE Z=NURSE,THE E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 30 ;link 1 6 2 ;link 2 16 1 ;link 3 13 1 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 6
t:{word 1.0} 6
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 30
t:{word 1.0} 30
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga toy wo hit ta . . }
#mess:   A=HIT X=GIRL,A Y=TOY,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 8 2 ;link 2 17 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga kite wo kick ta . . }
#mess:   A=KICK X=MOTHER,THE Y=KITE,A E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 25 ;link 1 10 1 ;link 2 18 2 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ woman ga ball wo hit ta . . }
#mess:   A=HIT X=WOMAN,THE Y=BALL,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 24 ;link 1 4 1 ;link 2 15 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 4
t:{word 1.0} 4
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 24
t:{word 1.0} 24
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga jump te iru . . }
#mess:   A=JUMP Y=NURSE,A E=PRES,PROG,YY  
proc:{ clear ;link 0 20 ;link 2 13 2 ;tlink 0 3 5;} 
7
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 20
t:{word 1.0} 20
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga stick wo kick te iru . . }
#mess:   A=KICK X=FATHER,THE Y=STICK,THE E=PRES,PROG,XX,YY  
proc:{ clear ;link 0 25 ;link 1 9 1 ;link 2 16 1 ;tlink 0 3 4 5;} 
9
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 25
t:{word 1.0} 25
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ girl ga man ni kite wo throw . . }
#mess:   A=THROW X=GIRL,A Y=KITE,A Z=MAN,A E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 28 ;link 1 8 2 ;link 2 18 2 ;link 3 3 2 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 8
t:{word 1.0} 8
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 3
t:{word 1.0} 3
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga stick wo father ni show ta . . }
#mess:   A=SHOW X=CAT,THE Y=STICK,A Z=FATHER,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 16 2 ;link 3 9 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga walk ta . . }
#mess:   A=WALK Y=MOTHER,THE E=PAST,SIMP,YY  
proc:{ clear ;link 0 21 ;link 2 10 1 ;tlink 1 2 5;} 
6
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 21
t:{word 1.0} 21
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga stick wo cat ni show ta . . }
#mess:   A=SHOW X=MOTHER,A Y=STICK,THE Z=CAT,THE E=PAST,SIMP,XX,YY,-1,ZZ  
proc:{ clear ;link 0 29 ;link 1 10 2 ;link 2 16 1 ;link 3 5 1 ;tlink 1 2 4 5 -1 6;} 
10
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 16
t:{word 1.0} 16
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ mother ga run te ita . . }
#mess:   A=RUN Y=MOTHER,THE E=PAST,PROG,YY  
proc:{ clear ;link 0 22 ;link 2 10 1 ;tlink 1 3 5;} 
7
i:{targ 1.0} 10
t:{word 1.0} 10
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 22
t:{word 1.0} 22
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ nurse ga toy wo cat ni throw te iru . . }
#mess:   A=THROW X=NURSE,A Y=TOY,A Z=CAT,A E=PRES,PROG,XX,YY,-1,ZZ  
proc:{ clear ;link 0 28 ;link 1 13 2 ;link 2 17 2 ;link 3 5 2 ;tlink 0 3 4 5 -1 6;} 
11
i:{targ 1.0} 13
t:{word 1.0} 13
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 28
t:{word 1.0} 28
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 38
t:{word 1.0} 38
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga boy ni toy wo show . . }
#mess:   A=SHOW X=CAT,THE Y=TOY,THE Z=BOY,THE E=PRES,SIMP,XX,ZZ,YY  
proc:{ clear ;link 0 29 ;link 1 5 1 ;link 2 17 1 ;link 3 7 1 ;tlink 0 2 4 6 5;} 
9
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 7
t:{word 1.0} 7
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 17
t:{word 1.0} 17
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 29
t:{word 1.0} 29
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ cat ga father ni ball wo give te ita . . }
#mess:   A=GIVE X=CAT,A Y=BALL,THE Z=FATHER,THE E=PAST,PROG,XX,ZZ,YY  
proc:{ clear ;link 0 27 ;link 1 5 2 ;link 2 15 1 ;link 3 9 1 ;tlink 1 3 4 6 5;} 
11
i:{targ 1.0} 5
t:{word 1.0} 5
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 33
t:{word 1.0} 33
i:{targ 1.0} 15
t:{word 1.0} 15
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 27
t:{word 1.0} 27
i:{targ 1.0} 36
t:{word 1.0} 36
i:{targ 1.0} 37
t:{word 1.0} 37
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;
name:{ father ga kite wo carry ta . . }
#mess:   A=CARRY X=FATHER,A Y=KITE,THE E=PAST,SIMP,XX,YY  
proc:{ clear ;link 0 26 ;link 1 9 2 ;link 2 18 1 ;tlink 1 2 4 5;} 
8
i:{targ 1.0} 9
t:{word 1.0} 9
i:{targ 1.0} 32
t:{word 1.0} 32
i:{targ 1.0} 18
t:{word 1.0} 18
i:{targ 1.0} 34
t:{word 1.0} 34
i:{targ 1.0} 26
t:{word 1.0} 26
i:{targ 1.0} 35
t:{word 1.0} 35
i:{targ 1.0} 39
t:{word 1.0} 39
i:{targ 1.0} 39
t:{word 1.0} 39;