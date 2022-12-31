module BCDAdder4b (
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

    wire S00,S11,S22,S33,CCout,W1,W2,Junk;

    FullAdder4b A1(S00,S11,S22,S33,  
                  CCout,
                  Q0,Q1,Q2,Q3,
                  B0,B1,B2,B3,
                  Cin);

    and(W1,S33,S22);
    and(W2,S33,S11);
    or(Cout,CCout,W1,W2);

    FullAdder4b A2(S0,S1,S2,S3,  
                  Junk,
                  S00,S11,S22,S33,
                  0,Cout,Cout,0,
                  0);


endmodule



