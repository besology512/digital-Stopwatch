module Comparitor16b (
    OUT,
    a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,
    b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15
); // Trure if A >= B
    input a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15;
    input b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14,b15;
    output OUT;
    wire E1,E2,E3,E4,EQ1,EQ2,EQ3,EQ4,W1,W2,W3;

    Comparitor4b Comparitor4b1 (
        E1,EQ1,
        a12,a13,a14,a15,
        b12,b13,b14,b15
    );

    Comparitor4b Comparitor4b2 (
        E2,EQ2,
        a8,a9,a10,a11,
        b8,b9,b10,b11
    );

    Comparitor4b Comparitor4b3 (
        E3,EQ3,
        a4,a5,a6,a7,
        b4,b5,b6,b7        
    );

    Comparitor4b Comparitor4b4 (
        E4,EQ4,
        a0,a1,a2,a3,
        b0,b1,b2,b3  
    );


    and(W1,~E1,E2,EQ1);
    and(W2,~E1,~E2,E3,EQ1,EQ2);
    and(W3,~E1,~E2,~E3,E4,EQ1,EQ2,EQ3);

    or(OUT,E1,W1,W2,W3);


endmodule

