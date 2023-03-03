`timescale 1ns / 1ps

module fifo_tb();


   parameter DATA_WIDTH=4; // number of bits in a word
   parameter ADDR_WIDTH=4;  // number of address bits
  
   reg clk, reset;
   reg rd, wr;
   reg [DATA_WIDTH-1:0] w_data;
   wire almost_empty, almost_full;
   wire empty, full;
   wire [ADDR_WIDTH+1:0] word_count;
   wire [DATA_WIDTH-1:0] r_data;

integer i;
parameter CP = 8;

fifo #(.ADDR_WIDTH(ADDR_WIDTH),.DATA_WIDTH(DATA_WIDTH)) fifo_uut (.*);

always #(CP/2) clk = ~clk;

initial 
begin
clk = 0;
reset = 0;
rd = 0;
wr = 0;
end

initial begin
    #CP reset = 1;
    #CP reset = 0;
    #CP wr = 1;
    for (i = 0; i < 2 ** DATA_WIDTH; i++)
        #CP w_data = i;
    #(2*CP) wr = 0;
    #CP rd = 1;
    #(16 * CP) 
    //$finish;

    #CP rd = 0;
    #CP reset = 1;
    #CP reset = 0;

    #CP 
    $finish;
end

endmodule
