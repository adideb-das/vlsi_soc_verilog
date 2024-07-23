module mux_41(a,b,c,d,sel,f);
input a,b,c,d;
input [1:0]sel;
output reg f;
always@(a or b or c or d or sel)
case (sel)
    2'b00: f<=a;
    2'b01: f<=b;
    2'b10: f<=c;
    2'b11: f<=d;
endcase

endmodule