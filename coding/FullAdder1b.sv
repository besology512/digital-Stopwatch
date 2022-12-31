module FullAdder1b (
    S,Cout,A,B,Cin
);
    input A,B,Cin; //inputs
    output S,Cout; // outputs
    wire W1,W2,W3; //identifying the wires
    //logic using the drawn schematic
    xor(W1,A,B);
    and(W2,A,B);
    and(W3,W1,Cin);
    or(Cout,W3,W2);
    xor(S,W1,Cin);
endmodule
