`timescale 1ns / 1ps
`include "bidirectional_buffer.v"
module bidir_buffer_tb;

    // Testbench signals
    reg dir;
    reg enable;
    reg in;
    wire out;
    wire data;

    // Instantiate the bidir_buffer module
    bidir_buffer dut (
        .data(data),
        .dir(dir),
        .enable(enable),
        .in(in),
        .out(out)
    );

    // Data signal as inout
    reg data_reg;
    assign data = data_reg;

    initial begin
        // Initialize signals
        dir = 0;
        enable = 0;
        in = 0;
        data_reg = 1'bz;

        // Test case 1: Buffer disabled
        #10;
        enable = 0;
        dir = 0;
        in = 1;
        #10;
        $display("Test case 1: data = %b, out = %b", data, out);

        // Test case 2: Buffer enabled, direction input to output
        #10;
        enable = 1;
        dir = 1;
        in = 1;
        #10;
        $display("Test case 2: data = %b, out = %b", data, out);

        // Test case 3: Buffer enabled, direction output to input
        #10;
        enable = 1;
        dir = 0;
        data_reg = 1;
        #10;
        $display("Test case 3: data = %b, out = %b", data, out);

        // Test case 4: Buffer enabled, direction input to output, changing input
        #10;
        enable = 1;
        dir = 1;
        in = 0;
        #10;
        $display("Test case 4: data = %b, out = %b", data, out);

        // Test case 5: Buffer enabled, direction output to input, changing data
        #10;
        enable = 1;
        dir = 0;
        data_reg = 0;
        #10;
        $display("Test case 5: data = %b, out = %b", data, out);

        // Finish the simulation
        $finish;
    end

    initial begin
        $dumpfile("bidir_buffer_waveform.vcd");
        $dumpvars(0,bidir_buffer_tb);
    end

endmodule
