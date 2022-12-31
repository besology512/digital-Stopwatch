module SevenSegment(A, B, C, D, a, b, c, d, e, f, g);
	input A, B, C, D;
	output a, b, c, d, e, f, g;
	wire Bc, Cc, Dc, w1, w2, w22, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16;
	
	// prepare complimint
	not(Bc, B);
	not(Cc, C);
	not(Dc, D);
	
	//get a 
	and(w1, B, D);
	and(w2, Bc, Dc);
	or(a, A, C, w1, w2);
	
	//get b
	and(w22, Cc,Dc);//w22 as i name it w2 but i forgot that i used it before
	and(w3, C, D);
	or(b, Bc, w22, w3);
	
	//get c 
	or(c, B, Cc, D);
	
	//get d
	and(w4, Bc, Dc);
	and(w5, C, Dc);
	and(w6, B, Cc, D);
	and(w7, Bc, C);
	or(d, w4, w5, w6, w7, A);
	
	//get e
	and(w8, Bc, Dc);
	and(w9, C, Dc);
	or(e, w8, w9);
	
	//get f
	and(w10, Cc, Dc);
	and(w11, B, Cc);
	and(w12, B, Dc);
	or(f, A, w10, w11, w12);
	
	//get g
	and(w13, Bc, C);
	and(w14, C, Dc);
	and(w15, B, Cc);
	and(w16, B, Cc);
	or(g, w13, w14, w15, w16, A);
	
endmodule	