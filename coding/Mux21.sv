module  Mux21 (
    Y,D0,D1,S
);
    input D0,D1;
    input S;
    output Y;
    wire Sn;
    not(Sn,S);
	 wire X1,X2;
    and(X1,Sn,D0);
    and(X2,S,D1);
    or(Y,X1,X2);
endmodule
