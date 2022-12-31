module Checker16b (
    I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,
    RST,Op,
    Sadd0,Sadd1,Sadd2,Sadd3,Sadd4,Sadd5,Sadd6,Sadd7,Sadd8,Sadd9,Sadd10,Sadd11,Sadd12,Sadd13,Sadd14,Sadd15,
    Ssub0,Ssub1,Ssub2,Ssub3,Ssub4,Ssub5,Ssub6,Ssub7,Ssub8,Ssub9,Ssub10,Ssub11,Ssub12,Ssub13,Ssub14,Ssub15,
    E,G,M
);
    input  RST,Op,E,G,M; //E is if the upper >= lower in adding // G is if the upper >= lower in subtracting
    input  Sadd0,Sadd1,Sadd2,Sadd3,Sadd4,Sadd5,Sadd6,Sadd7,Sadd8,Sadd9,Sadd10,Sadd11,Sadd12,Sadd13,Sadd14,Sadd15;
    input  Ssub0,Ssub1,Ssub2,Ssub3,Ssub4,Ssub5,Ssub6,Ssub7,Ssub8,Ssub9,Ssub10,Ssub11,Ssub12,Ssub13,Ssub14,Ssub15;
    output I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15;

    Checker1b checker1(I0,RST,Op,Sadd0,Ssub0,E,G,M,0,0);
    Checker1b checker2(I1,RST,Op,Sadd1,Ssub1,E,G,M,0,0);
    Checker1b checker3(I2,RST,Op,Sadd2,Ssub2,E,G,M,0,0);
    Checker1b checker4(I3,RST,Op,Sadd3,Ssub3,E,G,M,0,0);
    Checker1b checker5(I4,RST,Op,Sadd4,Ssub4,E,G,M,1,0);
    Checker1b checker6(I5,RST,Op,Sadd5,Ssub5,E,G,M,1,1);
    Checker1b checker7(I6,RST,Op,Sadd6,Ssub6,E,G,M,0,0);
    Checker1b checker8(I7,RST,Op,Sadd7,Ssub7,E,G,M,0,0);
    Checker1b checker9(I8,RST,Op,Sadd8,Ssub8,E,G,M,1,0);
    Checker1b checker10(I9,RST,Op,Sadd9,Ssub9,E,G,M,0,0);
    Checker1b checker11(I10,RST,Op,Sadd10,Ssub10,E,G,M,0,0);
    Checker1b checker12(I11,RST,Op,Sadd11,Ssub11,E,G,M,1,0);
    Checker1b checker13(I12,RST,Op,Sadd12,Ssub12,E,G,M,0,1);
    Checker1b checker14(I13,RST,Op,Sadd13,Ssub13,E,G,M,0,0);
    Checker1b checker15(I14,RST,Op,Sadd14,Ssub14,E,G,M,1,0);
    Checker1b checker16(I15,RST,Op,Sadd15,Ssub15,E,G,M,0,0);
endmodule
