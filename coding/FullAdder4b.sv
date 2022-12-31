module FullAdder4b (
    S0,S1,S2,S3,
    Cout,
    Q0,Q1,Q2,Q3,
    B0,B1,B2,B3,
    Cin
);
    input Q0,Q1,Q2,Q3;
    input B0,B1,B2,B3;
    input Cin;
    output S0,S1,S2,S3;
    output Cout;
    wire wCout[2:0],wCin[14:0];
    FullAdder1b A0(S0,wCout[0],Q0,B0,Cin);
    FullAdder1b A1(S1,wCout[1],Q1,B1,wCout[0]);
    FullAdder1b A2(S2,wCout[2],Q2,B2,wCout[1]);
    FullAdder1b A3(S3,Cout,Q3,B3,wCout[2]);
endmodule


