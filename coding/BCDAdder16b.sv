module BCDAdder16b (
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

    wire wCout[2:0];

    BCDAdder4b A0(S0,S1,S2,S3,
                  wCout[0],
                  Q0,Q1,Q2,Q3,
                  B0,B1,B2,B3,
                  Cin
    ); 

    BCDAdder4b A1(S4,S5,S6,S7,
                  wCout[1],
                  Q4,Q5,Q6,Q7,
                  B4,B5,B6,B7,
                  wCout[0]
    ); 

    BCDAdder4b A2(S8,S9,S10,S11,
                  wCout[2],
                  Q8,Q9,Q10,Q11,
                  B8,B9,B10,B11,
                  wCout[1]
    ); 

    BCDAdder4b A3(S12,S13,S14,S15,
                  Cout,
                  Q12,Q13,Q14,Q15,
                  B12,B13,B14,B15,
                  wCout[2]
    ); 

endmodule


