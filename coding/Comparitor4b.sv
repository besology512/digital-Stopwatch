module Comparitor4b (
    OUT, EQ,
    a0,a1,a2,a3,
    b0,b1,b2,b3
); // Trure if A >= B
    input a0,a1,a2,a3;
    input b0,b1,b2,b3;
    output OUT,EQ;
    wire W1,W2,W3,W4,W5,W6,W7,W8,m1,m2,m3,m4,g1,g2,g3;

    not(W1,b3);
    not(W2,b2);
    not(W3,b1);
    not(W4,b0);

    xnor(m1,a3,b3);
    xnor(m2,a2,b2);
    xnor(m3,a1,b1);
    xnor(m4,a0,b0);

    and(W5,W1,a3);
    and(W6,m1,W2,a2);
    and(W7,m2,m1,W3,a1);
    and(W8,m3,m2,m1,W4,a0);

    or(OUT,W5,W6,W7,W8);
    and(EQ,m1,m2,m3,m4);
    nor(g3,g1,g2);

    // or(OUT,g1,g2);


endmodule

