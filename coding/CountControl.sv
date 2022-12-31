module CountControl (
    outCount,outUP,UpDown,COUNT,CLK,RST,
    Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15
);
    input COUNT,UpDown,CLK,RST;
    input Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15;
    output outCount,outUP;
    // logic for first objective:
    wire EqnMax;
nand(EqnMax,~Q15,Q14,~Q13,~Q12,Q11,~Q10,~Q9,Q8,~Q7,~Q6,Q5,Q4,~Q3,~Q2,~Q1,~Q0);
wire upMode;
and(upMode,EqnMax,UpDown);

nand(EqnMin,~Q15,~Q14,~Q13,Q12,~Q11,~Q10,~Q9,~Q8,~Q7,~Q6,Q5,~Q4,~Q3,~Q2,~Q1,~Q0);
wire DownMode;
and(DownMode,EqnMin,~UpDown);
wire outCountBeforeAnd;
or(outCountBeforeAnd,DownMode,upMode);
and(outCount,COUNT,outCountBeforeAnd);
    //logic for second objective:
wire mux1,Nmux1;
Mux21 M1(mux1,UpDown,0,outCount);
not(Nmux1,mux1);
wire mux2;
Mux21 M2(mux2,Nmux1,mux1,outCount);
wire NoutUP;
SJKff JK(mux1,mux2,RST,CLK,outUP,NoutUP);
endmodule