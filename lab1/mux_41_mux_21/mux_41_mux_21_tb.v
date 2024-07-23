`timescale 1ns / 1ps
`include "mux_41_mux_21.v"
module mux_41_tb;

    // Testbench signals
    reg a;
    reg b;
    reg c;
    reg d;
    reg s0;
    reg s1;
    wire f2;

    // Instantiate the mux_41 module
    mux_41 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s0(s0),
        .s1(s1),
        .f2(f2)
    );

    initial begin
        // Initialize signals
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        s0 = 0;
        s1 = 0;

        // Monitor outputs
        $monitor("At time %t: a = %b, b = %b, c = %b, d = %b, s0 = %b, s1 = %b -> f2 = %b", $time, a, b, c, d, s0, s1, f2);

        // Test all combinations of inputs and select lines
        #10; {a, b, c, d, s0, s1} = 6'b000000;
        #10; {a, b, c, d, s0, s1} = 6'b000001;
        #10; {a, b, c, d, s0, s1} = 6'b000010;
        #10; {a, b, c, d, s0, s1} = 6'b000011;
        #10; {a, b, c, d, s0, s1} = 6'b001000;
        #10; {a, b, c, d, s0, s1} = 6'b001001;
        #10; {a, b, c, d, s0, s1} = 6'b001010;
        #10; {a, b, c, d, s0, s1} = 6'b001011;
        #10; {a, b, c, d, s0, s1} = 6'b010000;
        #10; {a, b, c, d, s0, s1} = 6'b010001;
        #10; {a, b, c, d, s0, s1} = 6'b010010;
        #10; {a, b, c, d, s0, s1} = 6'b010011;
        #10; {a, b, c, d, s0, s1} = 6'b011000;
        #10; {a, b, c, d, s0, s1} = 6'b011001;
        #10; {a, b, c, d, s0, s1} = 6'b011010;
        #10; {a, b, c, d, s0, s1} = 6'b011011;
        #10; {a, b, c, d, s0, s1} = 6'b100000;
        #10; {a, b, c, d, s0, s1} = 6'b100001;
        #10; {a, b, c, d, s0, s1} = 6'b100010;
        #10; {a, b, c, d, s0, s1} = 6'b100011;
        #10; {a, b, c, d, s0, s1} = 6'b101000;
        #10; {a, b, c, d, s0, s1} = 6'b101001;
        #10; {a, b, c, d, s0, s1} = 6'b101010;
        #10; {a, b, c, d, s0, s1} = 6'b101011;
        #10; {a, b, c, d, s0, s1} = 6'b110000;
        #10; {a, b, c, d, s0, s1} = 6'b110001;
        #10; {a, b, c, d, s0, s1} = 6'b110010;
        #10; {a, b, c, d, s0, s1} = 6'b110011;
        #10; {a, b, c, d, s0, s1} = 6'b111000;
        #10; {a, b, c, d, s0, s1} = 6'b111001;
        #10; {a, b, c, d, s0, s1} = 6'b111010;
        #10; {a, b, c, d, s0, s1} = 6'b111011;

        // Finish the simulation
        #10;
        $finish;
    end

 initial begin
        $dumpfile("mux_41_waveform.vcd");
        $dumpvars(0,mux_41_tb);
    end
endmodule
