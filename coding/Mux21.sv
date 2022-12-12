module  Mux21 (
    Y,D,S
);
    input logic D[0:1];
    input logic S;
    output logic Y;
    wire Sn;
    not(Sn,S);
	 wire X1,X2;
    and(X1,Sn,D[0]);
    and(X2,S,D[1]);
    or(Y,X1,X2);
endmodule