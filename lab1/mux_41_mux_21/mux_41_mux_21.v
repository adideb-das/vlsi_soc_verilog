module mux_21(x,y,s,f1);
input x,y,s;
output f1;
assign f1= s? x:y;
endmodule

module mux_41(a,b,c,d,s0,s1,f2);
input a,b,c,d,s0,s1;
output f2;
wire W1,W2;
mux_21 M1(a,b,s0,W1);
mux_21 M2(c,d,s0,W2);
mux_21 M3(W1,W2,s1,f2);
endmodule