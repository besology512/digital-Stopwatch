module BCDSubtractor4b (
    S0,S1,S2,S3,
    Cout,
    Q0,Q1,Q2,Q3,
    B0,B1,B2,B3,
);
    input Q0,Q1,Q2,Q3;  //Q - B
    input B0,B1,B2,B3;
    output S0,S1,S2,S3;
    output Cout;

    wire W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13,W14,W15,W16,W17,CCout, nCCout, Junk1,Junk2;

    xor(W1,1,B0);
    xor(W2,1,B1);
    xor(W3,1,B2);
    xor(W4,1,B3);

    FullAdder4b fulladd4b1(
        W5,W6,W7,W8,
        Junk1,
        0,1,0,1,
        W1,W2,W3,W4,
        1
    );

    BCDAdder4b bcdadd4b1(
        W9,W10,W11,W12,
        CCout,
        W5,W6,W7,W8,
        Q0,Q1,Q2,Q3,
        0
    );

    not(nCCout,CCout);
    xor(W14,W9,nCCout);
    xor(W15,W10,nCCout);
    xor(W16,W11,nCCout);
    xor(W17,W12,nCCout);

    FullAdder4b fulladd4b2(
        S0,S1,S2,S3,
        Cout,
        0,nCCout,0,nCCout,
        W14,W15,W16,W17,
        nCCout
    );


endmodule



