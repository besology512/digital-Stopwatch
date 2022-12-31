module  SJKff (
    J,K,RST,CLK, Q1, Q2
);
    input J, K, RST, CLK; //Our inputs
    output Q1,Q2;  //Our outputs
    wire W1,W2,W3,W4,W5,W6,W7,W8,W9,W10; //Our wires
    
	 // Assigning the values according to our schemitic
	 and(W1, J, Q2); //Remember output then inputs (WILL DELETE THAT)
	 not(W2, K); 
	 and(W3,W2,Q1);
	 or(W4,W1,W3);
	 not(W5, RST);
	 not(W6, CLK);
	 nand(W7,W8,W5,W4);
	 nand(W8,W9,W6,W7);
	 nand(W9,W10,W5,W6);
	 nand(W10,W7,W9);
	 nand(Q1,W9,Q2);
	 nand(Q2,Q1,W8,W5);
	 
	 
endmodule