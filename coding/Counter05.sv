module  Counter05 (
    Q0,Q1,Q2,Q3, TRG, CLK, LOAD, COUNT, MODE, RST, I0,I1,I2,I3
);
    input CLK,LOAD,COUNT,MODE,RST;
    input I0,I1,I2,I3; //Our inputs
    output Q0,Q1,Q2,Q3;
    reg Q0,Q1,Q2,Q3;
    output TRG;  //Our outputs
    wire W1,W2,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13,W14,W15,W16,W17,W18,W19,W20,W21,W22,W23,W24,W25,W26,W27,W28,W29,W30, NQ0,NQ1,NQ2,NQ3,NLOD, W31,W32; //Our wires //issue here at W30
    
	 // Assigning the values according to our schemitic
    not(W1,MODE);
    or(W2,W26,RST);
    not(NQ0,Q0); 
    not(NQ1,Q1);
    not(NQ2,Q2);
    not(NQ3,Q3);
    not(NLOD,LOAD); 
    and(W26,MODE,Q1,Q2,NQ0,NQ3,NLOD); // I forget a wire so the output wire number is odd // I will edit a little bit here(NQ0/NQ2)
    // When counting up I make it reset to 0 after 5

    and(W4,NQ0,W1);
    and(W5,Q0,MODE);
    and(W6,Q1,W5);
    and(W7,Q2,W6);
    and(W8,NQ1,W4);
    and(W9,NQ2,W8);
    and(W10,~Q0,~Q1,~Q2,~Q3,W1,~CLK); 
    // and(W11,W1,NLOD,W10);
    or(W12,W10,W2);
    // or(W13,W11,W2);

     // We will call the multiplixers here 
     // 4 Mux81
     // 2 Mux21
     Mux81 M8_1(.Y(W14),.I0(0),.I1(0),.I2(W1),.I3(MODE),.I4(I0),.I5(I0),.I6(I0),.I7(I0),.S0(MODE),.S1(COUNT),.S2(LOAD));
     not(W15,W14);
     Mux21 M2_1(.Y(W16),.D0(W14),.D1(W15),.S(LOAD));

     Mux81 M8_2(.Y(W17),.I0(0),.I1(0),.I2(W4),.I3(W5),.I4(I1),.I5(I1),.I6(I1),.I7(I1),.S0(MODE),.S1(COUNT),.S2(LOAD));
     not(W18,W17);
     Mux21 M2_2(.Y(W19),.D0(W17),.D1(W18),.S(LOAD));
     
     Mux81 M8_3(.Y(W20),.I0(0),.I1(0),.I2(W8),.I3(W6),.I4(I2),.I5(I2),.I6(I2),.I7(I2),.S0(MODE),.S1(COUNT),.S2(LOAD));
     not(W21,W20);
     Mux21 M2_3(.Y(W22),.D0(W20),.D1(W21),.S(LOAD));
     
     Mux81 M8_4(.Y(W23),.I0(0),.I1(0),.I2(W9),.I3(W7),.I4(I3),.I5(I3),.I6(I3),.I7(I3),.S0(MODE),.S1(COUNT),.S2(LOAD));
     not(W24,W23);
     Mux21 M2_4(.Y(W25),.D0(W23),.D1(W24),.S(LOAD));



     // We will call the Set/Rst JK flip flops here
     // 4 JK flip flops

    //  not(W31,W11);
    //  and(W32,W10,W31,W1);

    // and(W31,Q3,~Q2,~Q1,Q0,MODE); // the trigger work here when the counter is 9 we want it when it is after 9
    and(W31,~Q3,~Q2,~Q1,~Q0,MODE,~RST,~CLK);
    //The other one in W10

     SRJKFF SRJKFF1(.Q1(Q0),.Q2(W27),.J(W14),.K(W16),.CLK(CLK),.RST(W2),.PRST(0));  // J K CLK RST PRST
     SRJKFF SRJKFF2(.Q1(Q1),.Q2(W28),.J(W17),.K(W19),.CLK(CLK),.RST(W12),.PRST(0));
     SRJKFF SRJKFF3(.Q1(Q2),.Q2(W29),.J(W20),.K(W22),.CLK(CLK),.RST(W2),.PRST(0));
     SRJKFF SRJKFF4(.Q1(Q3),.Q2(W30),.J(W23),.K(W25),.CLK(CLK),.RST(W12),.PRST(0)); // issue here

     or(TRG,W10,W31);

	 
endmodule
