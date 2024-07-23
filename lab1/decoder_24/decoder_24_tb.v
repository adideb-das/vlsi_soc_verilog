`timescale 1ns / 1ps
`include "decoder_24.v"

module decoder_24_tb;

    // Testbench signals
    reg a;
    reg b;
    reg en;
    wire w;
    wire x;
    wire y;
    wire z;

    // Instantiate the decoder_24 module
    decoder_24 uut (
        .a(a),
        .b(b),
        .en(en),
        .w(w),
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        // Initialize signals
        a = 0;
        b = 0;
        en = 0;

        // Monitor outputs
        $monitor("At time %t: en = %b, a = %b, b = %b -> w = %b, x = %b, y = %b, z = %b", $time, en, a, b, w, x, y, z);

        // Test case 1: Enable = 0, all outputs should be 0
        #10;
        en = 0;
        a = 0;
        b = 0;
        #10;
        en = 0;
        a = 0;
        b = 1;
        #10;
        en = 0;
        a = 1;
        b = 0;
        #10;
        en = 0;
        a = 1;
        b = 1;

        // Test case 2: Enable = 1, check all combinations of a and b
        #10;
        en = 1;
        a = 0;
        b = 0;
        #10;
        en = 1;
        a = 0;
        b = 1;
        #10;
        en = 1;
        a = 1;
        b = 0;
        #10;
        en = 1;
        a = 1;
        b = 1;

        // Finish the simulation
        #10;
        $finish;
    end

   initial begin
        $dumpfile("decoder_24_waveform.vcd");
        $dumpvars(0,decoder_24_tb);
    end
endmodule
