// `timescale 1ns / 1ps
`include "full_adder_1bit.v"
module full_adder_1bit_tb;

    // Testbench signals
    reg a;
    reg b;
    reg c;
    wire sum;
    wire carry;

    // Instantiate the full_adder_1bit module
    full_adder_1bit dut(
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        // Initialize signals
        a = 0;
        b = 0;
        c = 0;

        // Monitor outputs
        $monitor("At time %t: a = %b, b = %b, c = %b -> sum = %b, carry = %b", $time, a, b, c, sum, carry);

        // Test all combinations of a, b, and c
        #10; {a, b, c} = 3'b000;
        #10; {a, b, c} = 3'b001;
        #10; {a, b, c} = 3'b010;
        #10; {a, b, c} = 3'b011;
        #10; {a, b, c} = 3'b100;
        #10; {a, b, c} = 3'b101;
        #10; {a, b, c} = 3'b110;
        #10; {a, b, c} = 3'b111;

        // Finish the simulation
        #10;
        $finish;
    end
       initial begin
        $dumpfile("full_adder_1bit_waveform.vcd");
        $dumpvars(0,full_adder_1bit_tb);
    end

endmodule
