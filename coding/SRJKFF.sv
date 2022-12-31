module  SRJKFF (
    Q1, Q2, J,K, CLK, RST,PRST
);
    input J,K,CLK, RST, PRST; //Our inputs
    output Q1,Q2;  //Our outputs
    reg Q1,Q2;
    wire W1,W2,W3,W4,W5,W6,W7,W8,W9; //Our wires //issue here W8, W5, W6,W9
    
	 // Assigning the values according to our schemitic
     not(W1,PRST);
     not(W4,RST);
     not(W7,CLK);

     nand(W2,J,Q2,CLK);
     nand(W3,Q1,CLK,K);
     nand(W5,W1,W2,W6);
     nand(W6,W5,W3,W4);

     nand(W8,W7,W6);
     nand(W9,W5,W7);
     nand(Q1,W9,Q2);
     nand(Q2,Q1,W8);
	 
endmodule