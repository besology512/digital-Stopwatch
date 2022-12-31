module  ClockControl (
    SP, SL, CLK, RST, newCLK // The CLK here should be the fastest one
);
    input SP, SL, RST, CLK; //Our inputs
    output logic newCLK;  //Our outputs
    wire W1,W2,W3,W4,W5,W6,W7,W8,W9,W10,W11,W12,W13,W14; //Our wires
    
	 // Assigning the values according to our schemitic
     not(W1,SP);
     not(W2,SL);
	 and(W3, SP,W2);
     and(W4, SP,SL);
     and(W5, CLK,W3);
     and(W6, W1,W2);
     or(W7, W4,W6);
     and(W8, W1,SL);

    // DFF DFF1 (W11,W13,W13,CLK); //is it ok to put the D in that way??
    // DFF DFF2 (W12,W14,W14,W11);  //??
    DRFF DFF1 (W11,W13,W13,RST,CLK); //is it ok to put the D in that way??
    DRFF DFF2 (W12,W14,W14,RST,W11);  //??

     and(W9, W11,W7);
     and(W10, W12,W8);
     or(newCLK, W5,W9,W10); //removed w10
	 
endmodule