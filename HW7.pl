/* course(course_number, course_name, credits) */

course(cs101,python, 2).
course(mth210, calculusI, 5).
course(cs120, web_design, 3).
course(cs200, data_structures, 4).
course(cs210, algorithms, 4).
course(wrt101, basic_writing, 3).

/* section(CRN, course_number) */

section(1522,cs101).
section(1122,cs101).
section(2322,mth210).
section(2421,cs120).
section(8522,mth210).
section(1621,cs200).
section(7822,mth210).
section(2822,cs210).
section(3522,wrt101).

/* place( CRN, building, time) */

place(1522,owen102,10).
place(1122,dear118,11).
place(2322,with210,11).
place(2421,cov216,15).
place(8522,kec1001,13).
place(1621,cov216,14).
place(7822,kec1001,14).
place(2822,owen102,13).
place(3522,with210,15).

/* enroll(sid, CRN) */

enroll(122,1522).
enroll(122,8522).
enroll(150,1522).
enroll(150,2421).
enroll(212,7822).
enroll(300,2822).
enroll(300,8522).
enroll(310,3522).
enroll(310,8522).
enroll(310,1621).
enroll(175,2822).
enroll(175,7822).
enroll(175,3522).
enroll(410,1621).
enroll(410,7822).
enroll(113,3522).

/* student(sid, student_name, major) */

student(122, mary, cs).
student(150, john, math).
student(212, jim, ece).
student(300, lee, cs).
student(310, pat, cs).
student(175, amy, math).
student(410, john, cs).
student(113, zoe, ece).

/*1*/
/*a*/
schedule(SID, C, B, T) :- student(SID, _, _), enroll(SID, CRN), place(CRN, B, T), section(CRN, CN), course(CN, C, _).
/*schedule(SID, C, B, T) :- student(I, F, L)*/

/*b*/
schedule(SID, N, C) :- student(SID, N, _), enroll(SID, CRN), place(CRN, _, _), section(CRN, CN), course(CN, C, _).
   
/*c*/
offer(CN, N, C, T) :- place(C, _, T), section(C, CN), course(CN, N, _).
/*d*/
conflict(SID, X, Y) :- enroll(SID, X), enroll(SID, Y), place(X, _, T1), place(Y, _, T2), T1=:=T2, X\=Y.

/*e*/
meet(X, SID) :- enroll(X, C), enroll(SID, C), X\=SID; schedule(X, _, B, C1), schedule(SID, _, B, C2), (C1 + 1) =:= C2; schedule(X, _, B, C1), schedule(SID, _, B, C2), (C1 - 1) =:= C2.

/*f*/
roster(CRN, Sname) :- student(SID, Sname, _), enroll(SID, CRN).

/*g*/
highCredits(Cname) :- course(_, Cname, CREDITS), CREDITS > 3.

/*2*/
/*a*/


