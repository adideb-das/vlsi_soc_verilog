`timescale 1ns / 1ps
`include "mux_41.v"
`timescale 1ns / 1ps

module mux_41_tb;

    // Testbench signals
    reg a;
    reg b;
    reg c;
    reg d;
    reg [1:0] sel;
    wire f;

    // Instantiate the mux_41 module
    mux_41 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .f(f)
    );

    initial begin
        // Initialize signals
        a = 0;
        b = 0;
        c = 0;
        d = 0;
        sel = 2'b00;

        // Monitor outputs
        $monitor("At time %t: a = %b, b = %b, c = %b, d = %b, sel = %b -> f = %b", $time, a, b, c, d, sel, f);

        // Test all combinations of sel with different input values
        #10; a = 1; b = 0; c = 0; d = 0; sel = 2'b00;
        #10; a = 0; b = 1; c = 0; d = 0; sel = 2'b01;
        #10; a = 0; b = 0; c = 1; d = 0; sel = 2'b10;
        #10; a = 0; b = 0; c = 0; d = 1; sel = 2'b11;

        // Test with multiple inputs being high
        #10; a = 1; b = 1; c = 0; d = 0; sel = 2'b00;
        #10; a = 0; b = 1; c = 1; d = 0; sel = 2'b01;
        #10; a = 0; b = 0; c = 1; d = 1; sel = 2'b10;
        #10; a = 1; b = 0; c = 0; d = 1; sel = 2'b11;

        // Test with all inputs being high
        #10; a = 1; b = 1; c = 1; d = 1; sel = 2'b00;
        #10; sel = 2'b01;
        #10; sel = 2'b10;
        #10; sel = 2'b11;

        // Finish the simulation
        #10;
        $finish;
    end
 initial begin
        $dumpfile("mux_41_waveform.vcd");
        $dumpvars(0,mux_41_tb);
    end
endmodule

   
