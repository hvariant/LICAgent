#hide.
#show does/3.
terminal(T+1) :- terminal(T), time(T).
goal(R,M,T+1) :- goal(R,M,T), time(T), terminal(T).
1 { does(R,M,T) : input(R,M) } 1 :- role(R), time(T), not terminal(T).
:- does(R,M,T) , not legal(R,M,T), time(T), role(R), input(R,M).
:- 0 { terminal(T) : time(T) } 0.
:- terminal(T), role(R), not goal(R,100,T), time(T).
role(robot).
base(cell(Vm,Vn,Vt)) :- index(Vm),index(Vn),tile(Vt).
base(step(1)).
base(step(Vn)) :- successor(Vm,Vn).
index(1).
index(2).
tile(1).
tile(2).
tile(3).
tile(b).
input(robot,left).
input(robot,right).
input(robot,up).
input(robot,down).
true(cell(1,1,b),1).
true(cell(1,2,3),1).
true(cell(2,1,2),1).
true(cell(2,2,1),1).
true(step(1),1).
legal(robot,left,T) :- true(cell(Vm,2,b),T), time(T).
legal(robot,right,T) :- true(cell(Vm,1,b),T), time(T).
legal(robot,up,T) :- true(cell(2,Vn,b),T), time(T).
legal(robot,down,T) :- true(cell(1,Vn,b),T), time(T).
true(cell(1,Vn,b),T+1) :- does(robot,up,T),true(cell(2,Vn,b),T), time(T).
true(cell(2,Vn,b),T+1) :- does(robot,down,T),true(cell(1,Vn,b),T), time(T).
true(cell(Vm,1,b),T+1) :- does(robot,left,T),true(cell(Vm,2,b),T), time(T).
true(cell(Vm,2,b),T+1) :- does(robot,right,T),true(cell(Vm,1,b),T), time(T).
true(cell(2,Vn,Vx),T+1) :- does(robot,up,T),true(cell(2,Vn,b),T),true(cell(1,Vn,Vx),T), time(T).
true(cell(1,Vn,Vx),T+1) :- does(robot,down,T),true(cell(1,Vn,b),T),true(cell(2,Vn,Vx),T), time(T).
true(cell(Vm,2,Vx),T+1) :- does(robot,left,T),true(cell(Vm,2,b),T),true(cell(Vm,1,Vx),T), time(T).
true(cell(Vm,1,Vx),T+1) :- does(robot,right,T),true(cell(Vm,1,b),T),true(cell(Vm,2,Vx),T), time(T).
true(cell(Vm,Vn,Vw),T+1) :- does(robot,up,T),true(cell(Vx,Vy,b),T),true(cell(Vm,Vn,Vw),T),Vy != Vn, time(T).
true(cell(Vm,Vn,Vw),T+1) :- does(robot,down,T),true(cell(Vx,Vy,b),T),true(cell(Vm,Vn,Vw),T),Vy != Vn, time(T).
true(cell(Vm,Vn,Vw),T+1) :- does(robot,left,T),true(cell(Vx,Vy,b),T),true(cell(Vm,Vn,Vw),T),Vx != Vm, time(T).
true(cell(Vm,Vn,Vw),T+1) :- does(robot,right,T),true(cell(Vx,Vy,b),T),true(cell(Vm,Vn,Vw),T),Vx != Vm, time(T).
true(step(Vn),T+1) :- true(step(Vm),T),successor(Vm,Vn), time(T).
goal(robot,100,T) :- true(cell(1,1,1),T),true(cell(1,2,2),T),true(cell(2,1,3),T), time(T).
goal(robot,0,T) :- not true(cell(1,1,1),T), time(T).
goal(robot,0,T) :- not true(cell(1,2,2),T), time(T).
goal(robot,0,T) :- not true(cell(2,1,3),T), time(T).
terminal(T) :- true(step(7),T), time(T).
successor(1,2).
successor(2,3).
successor(3,4).
successor(4,5).
successor(5,6).
successor(6,7).
time(1..100).
