module OperationUnit (
    I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,RST,OP,MODE
);
    input Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,RST,OP,MODE;
    output I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15;
    wire E,G,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,JUNK, JUNK2, JUNK3,S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15;  //Our wires //issue here at W30

    // I's are the values of I for the load
    // Q's are the current counter number (Q's)
    // A's are the output of adding the current stop watch value with  2 
    // S's are the output of subtracting the current stop watch value with 2 
    // 


	 // Assigning the values according to our schemitic

     // I add the current stop watch value with 2
     BCDAdder16b Adder(A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15, JUNK,
                        Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,
                        0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,
                        0 
     );


    // I subtract the current stop watch value with 2
    //  FullAdder16b Subtractor(S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15, 
    //                     JUNK2,
    //                     Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,
    //                     1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1, 
    //                     1
    //  );
    // I will replace that with that subtractor with bcd subtractor
    //First the seconds will not be affected in the subtraction (cuz we subtract two minutes)
    buf (S0, Q0); buf (S1, Q1); buf (S2, Q2); buf (S3, Q3); buf (S4, Q4); buf (S5, Q5); buf (S6, Q6); buf (S7, Q7); 
    // then subtracting the minutes
    BCDSubtractor8b Subtractor(
        S8,S9,S10,S11,S12,S13,S14,S15,
        JUNK2,
        Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,
        0,1,0,0,0,0,0,0
    );


    // I compare the adder value to the maximum value if adder > max so E = 1  
    Comparitor16b AdderComparitor(
        E,
        A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,
        0,0,0,0,1,1,0,0,1,0,0,1,0,0,1,0
    );
    

    // I compare the subtractor value to the minmum value if min > subtractor so G = 1
    Comparitor16b SubtractorComparitor(
        G,
        0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,
        S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15
    );


    Checker16b Checking(
    I0,I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14,I15,
    RST,OP,
    A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,
    S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13,S14,S15,
    E,G,MODE
    );


endmodule
