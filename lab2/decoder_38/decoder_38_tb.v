`include "decoder_38.v"
module decoder_38_tb;
wire [7:0] out;
reg en;
reg [2:0] in;
integer i;

decoder_38 dut(in,out,en);

initial begin  
 $monitor( "en=%b, in=%d, out=%b ", en, in, out);
   for ( i=0; i<16; i=i+1) 
        begin
           {en,in}  = i;
            #1;
        end
end
 initial begin
        $dumpfile("decoder_38_waveform.vcd");
        $dumpvars(0,decoder_38_tb);
    end
endmodule