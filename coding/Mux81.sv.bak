module  Mux81 (
    Y,I,S
);
    input logic I[7:0];
    input logic S[2:0];
    output logic Y;
// first stage
    wire w1[3:0];
    Mux21 M1(w1[0],I[1:0],S[0]);
    Mux21 M2(w1[1],I[3:2],S[0]);
    Mux21 M3(w1[2],I[5:4],S[0]);
    Mux21 M4(w1[3],I[7:6],S[0]);
//second stage
    wire w2[1:0];
    Mux21 M5(w2[0],w1[1:0],S[1]);
    Mux21 M6(w2[1],w1[3:2],S[1]);
//third stage
    Mux21 M7(Y,w2[1:0],S[2]);
endmodule