module FullAdder16b (
    S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,
    Cout,
    Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,
    B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15,
    Cin
);
    input Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15;
    input B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,B13,B14,B15;
    input Cin;
    output S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15;
    output Cout;
    wire wCout[14:0],wCin[14:0];
    FullAdder1b A0(S0,wCout[0],Q0,B0,Cin);
    FullAdder1b A1(S1,wCout[1],Q1,B1,wCout[0]);
    FullAdder1b A2(S2,wCout[2],Q2,B2,wCout[1]);
    FullAdder1b A3(S3,wCout[3],Q3,B3,wCout[2]);
    FullAdder1b A4(S4,wCout[4],Q4,B4,wCout[3]);
    FullAdder1b A5(S5,wCout[5],Q5,B5,wCout[4]);
    FullAdder1b A6(S6,wCout[6],Q6,B6,wCout[5]);
    FullAdder1b A7(S7,wCout[7],Q7,B7,wCout[6]);
    FullAdder1b A8(S8,wCout[8],Q8,B8,wCout[7]);
    FullAdder1b A9(S9,wCout[9],Q9,B9,wCout[8]);
    FullAdder1b A10(S10,wCout[10],Q10,B10,wCout[9]);
    FullAdder1b A11(S11,wCout[11],Q11,B11,wCout[10]);
    FullAdder1b A12(S12,wCout[12],Q12,B12,wCout[11]);
    FullAdder1b A13(S13,wCout[13],Q13,B13,wCout[12]);
    FullAdder1b A14(S14,wCout[14],Q14,B14,wCout[13]);
    FullAdder1b A15(S15,Cout,Q15,B15,wCout[14]);
endmodule

