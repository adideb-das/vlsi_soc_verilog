// `timescale 1ns / 1ps
`include "full_adder.v"
module full_adder_tb();

    // Testbench signals
    reg a_in;
    reg b_in;
    reg c_in;
    wire sum_out;
    wire carry_out;

    // Instantiate the full_adder_1bit module
    full_adder dut(
        .a_in(a_in),
        .b_in(b_in),
        .c_in(c_in),
        .sum_out(sum_out),
        .carry_out(carry_out)
    );

    initial begin
        // Initialize signals
        a_in = 0;
        b_in = 0;
        c_in = 0;

        // Monitor outputs
        $monitor("At time %t: a = %b, b = %b, c = %b -> sum = %b, carry = %b", $time, a_in, b_in, c_in, sum_out, carry_out);

        // Test all combinations of a, b, and c
              #10; {a_in, b_in, c_in} = 3'b000;
        #10; {a_in, b_in, c_in} = 3'b001;
        #10; {a_in, b_in, c_in} = 3'b010;
        #10; {a_in, b_in, c_in} = 3'b011;
        #10; {a_in, b_in, c_in} = 3'b100;
        #10; {a_in, b_in, c_in} = 3'b101;
        #10; {a_in, b_in, c_in} = 3'b110;
        #10; {a_in, b_in, c_in} = 3'b111;

        // Finish the simulation
        #10;
        $finish;
    end
       initial begin
        $dumpfile("full_adder_waveform.vcd");
        $dumpvars(0,full_adder_tb);
    end

endmodule
