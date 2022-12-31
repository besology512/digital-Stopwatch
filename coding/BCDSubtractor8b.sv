module BCDSubtractor8b (
    S0,S1,S2,S3,S4,S5,S6,S7,
    Cout,
    Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,
    B0,B1,B2,B3,B4,B5,B6,B7
);
    input Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7; //Q - B
    input B0,B1,B2,B3,B4,B5,B6,B7;
    output S0,S1,S2,S3,S4,S5,S6,S7;
    output Cout;

    wire W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13,W14,W15,W16,W17,W18,W19,W20,W21,W22,W23,W24,W25,W26,W27,W28,W29,W30,W31,W32,W33,W34,W35,W36,CCout, nCCout, Junk1,Junk2, Junk3, Junk4, Out1,Out2,nOut2,Out3;

// getting 10's complement for the first 4 bits
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

// getting 10's complement for the second 4 bits

    xor(W9,1,B4);
    xor(W10,1,B5);
    xor(W11,1,B6);
    xor(W12,1,B7);

    FullAdder4b fulladd4b2(
        W13,W14,W15,W16,
        Junk2,
        0,1,0,1,
        W9,W10,W11,W12,
        1
    );

    // Adding our input with the 10's complement
    BCDAdder4b BCDAdder4b1(
        W17,W18,W19,W20,
        Out1,
        W5,W6,W7,W8,
        Q0,Q1,Q2,Q3,
        0
    );

    BCDAdder4b BCDAdder4b2(
        W21,W22,W23,W24,
        Out2,
        W13,W14,W15,W16,
        Q4,Q5,Q6,Q7,
        Out1
    );

// now doing the correction to each 4 bit seperately 
    not(nOut2,Out2);

    xor(W25,W17,nOut2);
    xor(W26,W18,nOut2);
    xor(W27,W19,nOut2);
    xor(W28,W20,nOut2);

    xor(W29,W21,nOut2);
    xor(W30,W22,nOut2);
    xor(W31,W23,nOut2);
    xor(W32,W24,nOut2);


    FullAdder4b fulladd4b3(
        S0,S1,S2,S3,
        Out3,
        0,nOut2,0,nOut2,
        W25,W26,W27,W28,
        nOut2
    );

    
    // FullAdder4b fulladd4b4(
    //     S4,S5,S6,S7,
    //     Cout,
    //     0,nOut2,0,nOut2,
    //     W29,W30,W31,W32,
    //     nOut2
    // );

    //In the old version I stop here

        
    FullAdder4b fulladd4b4(
        W33,W34,W35,W36,
        Cout,
        0,nOut2,0,nOut2,
        W29,W30,W31,W32,
        nOut2
    );

    BCDSubtractor4b BCDSubtractor4b1
    (
        S4,S5,S6,S7,
        Junk4,
        W33,W34,W35,W36,
        1,0,0,0 
    );


endmodule




