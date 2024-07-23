module decoder_24(en,a,b,w,x,y,z);
input a,b,en;
output w,x,y,z;
assign w= en & (~a) & (~b);
assign x= en & (~a) & (b);
assign y= en & (a)  & (~b);
assign z= en & (a)  & (b);
endmodule