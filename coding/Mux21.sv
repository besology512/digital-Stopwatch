module  Mux21 (
    D,S,Y
);
    input logic D[0:1];
    input logic S;
    output logic Y;
    wire Sn,X1,X2;
    not(Sn,S);
    and(X1,Sn,D[0]);
    and(X2,S,D[1]);
    or(X1,X2);
endmodule