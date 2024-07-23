module tristate_buffer(in,sel,out);
input in,sel;
output out;
assign out= sel?in:1'bz;
endmodule

module decoder_24(en,a,b,w,x,y,z);
input a,b,en;
output w,x,y,z;
assign w= en & (~a) & (~b);
assign x= en & (~a) & (b);
assign y= en & (a)  & (~b);
assign z= en & (a)  & (b);
endmodule


module mux_41(en,s0,s1,i0,i1,i2,i3,out);
input en,s0,s1,i0,i1,i2,i3;
output out;
wire m0,m1,m2,m3,W0,W1,W2,W3;

decoder_24 D1(en,s0,s1,m0,m1,m2,m3);
tristate_buffer B1(m0,i0,W0);
tristate_buffer B2(m1,i1,W1);
tristate_buffer B3(m2,i2,W2);
tristate_buffer B4(m3,i3,W3);

assign out= W0 | W1 | W2 | W3;

endmodule