module  DRFF (
    Q1, Q2, D, RST , CLK
);
    input D, RST, CLK; //Our inputs
    output Q1,Q2;  //Our outputs
    wire W1,W2,W3,W4; //Our wires
    
	 // Assigning the values according to our schemitic
    //  not(W5,RST);
     nand(W1,W2,D,RST);
     nand(W2,W1,CLK,W3);
     nand(W3,W4,CLK,RST);
     nand(W4,W1,W3);
     nand(Q1,W3,Q2);
     nand(Q2,Q1,W2,RST);
	 
endmodule