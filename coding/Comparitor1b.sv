module Comparitor1b (
    out,upper,lower
);
    input upper,lower;
    output out;
    wire w1,w2,nlower;
    xnor(w1,upper,lower);
    not(nlower,lower);
    and(w2,nlower,upper);
    or(out,w1,w2);
endmodule
