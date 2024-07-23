module bidir_buffer (
    inout wire data,
    input wire dir,    
    input wire enable,
    input wire in,    
    output wire out    
);

assign data = (enable && dir) ? in : 1'bz; 
assign out = (enable && !dir) ? data : 1'bz; 

endmodule
