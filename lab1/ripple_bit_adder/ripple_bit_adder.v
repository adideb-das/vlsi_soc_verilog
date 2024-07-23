module full_adder_1bit(a, b, c, sum, carry);
  input a, b, c;
  output sum, carry;
  assign sum = a ^ b ^ c;
  assign carry = (a & b) | (b & c) | (c & a);
endmodule

module ripple_bit_adder(a_in, b_in, cin, sum, cout);
  input [3:0] a_in;
  input [3:0] b_in;
  input cin;
  output [3:0] sum;
  output cout;
  wire [2:0] c;

  full_adder_1bit F0(a_in[0], b_in[0], cin, sum[0], c[0]);
  full_adder_1bit F1(a_in[1], b_in[1], c[0], sum[1], c[1]);
  full_adder_1bit F2(a_in[2], b_in[2], c[1], sum[2], c[2]);
  full_adder_1bit F3(a_in[3], b_in[3], c[2], sum[3], cout);

endmodule
