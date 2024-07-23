`timescale 1ns / 1ps
`include "mux_41_decoder _tristatebuffer.v"
module mux_41_tb;

    // Testbench signals
    reg en;
    reg s0;
    reg s1;
    reg i0;
    reg i1;
    reg i2;
    reg i3;
    wire out;

    // Instantiate the mux_41 module
    mux_41 uut (
        .en(en),
        .s0(s0),
        .s1(s1),
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .out(out)
    );

    initial begin
        // Initialize signals
        en = 0;
        s0 = 0;
        s1 = 0;
        i0 = 0;
        i1 = 0;
        i2 = 0;
        i3 = 0;

        // Monitor outputs
        $monitor("At time %t: en = %b, s0 = %b, s1 = %b, i0 = %b, i1 = %b, i2 = %b, i3 = %b -> out = %b", $time, en, s0, s1, i0, i1, i2, i3, out);

        // Test case: Enable = 0, all inputs and select lines = 0
        #10;
        en = 0; s0 = 0; s1 = 0; i0 = 0; i1 = 0; i2 = 0; i3 = 0;
        
        // Test all combinations of inputs and select lines with enable = 1
        #10; en = 1; s0 = 0; s1 = 0; i0 = 1; i1 = 0; i2 = 0; i3 = 0;
        #10; en = 1; s0 = 0; s1 = 1; i0 = 0; i1 = 1; i2 = 0; i3 = 0;
        #10; en = 1; s0 = 1; s1 = 0; i0 = 0; i1 = 0; i2 = 1; i3 = 0;
        #10; en = 1; s0 = 1; s1 = 1; i0 = 0; i1 = 0; i2 = 0; i3 = 1;

        // Test with different data inputs and select lines
        #10; en = 1; s0 = 0; s1 = 0; i0 = 1; i1 = 1; i2 = 1; i3 = 1;
        #10; en = 1; s0 = 0; s1 = 1; i0 = 1; i1 = 1; i2 = 1; i3 = 1;
        #10; en = 1; s0 = 1; s1 = 0; i0 = 1; i1 = 1; i2 = 1; i3 = 1;
        #10; en = 1; s0 = 1; s1 = 1; i0 = 1; i1 = 1; i2 = 1; i3 = 1;

        // Test with enable = 0
        #10; en = 0; s0 = 0; s1 = 0; i0 = 1; i1 = 0; i2 = 0; i3 = 0;
        #10; en = 0; s0 = 0; s1 = 1; i0 = 0; i1 = 1; i2 = 0; i3 = 0;
        #10; en = 0; s0 = 1; s1 = 0; i0 = 0; i1 = 0; i2 = 1; i3 = 0;
        #10; en = 0; s0 = 1; s1 = 1; i0 = 0; i1 = 0; i2 = 0; i3 = 1;

        // Finish the simulation
        #10;
        $finish;
    end
           initial begin
        $dumpfile("mux_41_tb_waveform.vcd");
        $dumpvars(0,mux_41_tb);
    end


endmodule
