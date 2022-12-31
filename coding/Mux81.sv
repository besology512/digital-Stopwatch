module  Mux81 (
    Y,I0,I1,I2,I3,I4,I5,I6,I7,S0,S1,S2
);
    input I0,I1,I2,I3,I4,I5,I6,I7;
    input S0,S1,S2;
    output Y;
// first stage
    wire W0,W1,W2,W3,W4,W5;
    Mux21 M1(.Y(W0),.D0(I0),.D1(I1),.S(S0));
    Mux21 M2(.Y(W1),.D0(I2),.D1(I3),.S(S0));
    Mux21 M3(.Y(W2),.D0(I4),.D1(I5),.S(S0));
    Mux21 M4(.Y(W3),.D0(I6),.D1(I7),.S(S0));
//second stage
    Mux21 M5(.Y(W4),.D0(W0),.D1(W1),.S(S1));
    Mux21 M6(.Y(W5),.D0(W2),.D1(W3),.S(S1));
//third stage
    Mux21 M7(.Y(Y),.D0(W4),.D1(W5),.S(S2));
endmodule
