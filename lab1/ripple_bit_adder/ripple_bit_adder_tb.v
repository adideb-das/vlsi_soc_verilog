`timescale 1ns / 1ps
`include "ripple_bit_adder.v"
module ripple_bit_adder_tb;

    // Testbench signals
    reg [3:0] a_in;
    reg [3:0] b_in;
    reg cin;
    wire [3:0] sum;
    wire cout;

    // Instantiate the ripple_bit_adder module
    ripple_bit_adder dut (
        .a_in(a_in),
        .b_in(b_in),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Initialize signals
        a_in = 4'b0000;
        b_in = 4'b0000;
        cin = 1'b0;

        // Monitor outputs
        $monitor("At time %t: a_in = %b, b_in = %b, cin = %b -> sum = %b, cout = %b", $time, a_in, b_in, cin, sum, cout);

        // Test case: Add 4'b0000 and 4'b0000 with carry-in 0
        #10; a_in = 4'b0000; b_in = 4'b0000; cin = 1'b0;
        
        // Test case: Add 4'b0001 and 4'b0001 with carry-in 0
        #10; a_in = 4'b0001; b_in = 4'b0001; cin = 1'b0;
        
        // Test case: Add 4'b0011 and 4'b0101 with carry-in 0
        #10; a_in = 4'b0011; b_in = 4'b0101; cin = 1'b0;
        
        // Test case: Add 4'b0111 and 4'b0110 with carry-in 1
        #10; a_in = 4'b0111; b_in = 4'b0110; cin = 1'b1;
        
        // Test case: Add 4'b1001 and 4'b1001 with carry-in 0
        #10; a_in = 4'b1001; b_in = 4'b1001; cin = 1'b0;
        
        // Test case: Add 4'b1111 and 4'b1111 with carry-in 1
        #10; a_in = 4'b1111; b_in = 4'b1111; cin = 1'b1;

        // Finish the simulation
        #10;
        $finish;
    end

 initial begin
        $dumpfile("ripple_bit_adder_waveform.vcd");
        $dumpvars(0,ripple_bit_adder_tb);
    end
endmodule
