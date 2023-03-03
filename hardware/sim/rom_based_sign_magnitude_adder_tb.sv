`timescale 1ns / 1ps

module rom_based_sign_magnitude_adder_tb();

parameter DATA_WIDTH = 4;
reg clk;               // Clock input
reg [DATA_WIDTH-1:0] a; // Temperature input
reg [DATA_WIDTH-1:0] b; // Temperature input
wire [DATA_WIDTH:0] sum;         // Covnerted temperature output

//integer i;
parameter CP = 8;

rom_based_sign_magnitude_adder #(.DATA_WIDTH(DATA_WIDTH)) adder_uut (.*);

always #(CP/2) clk = ~clk;

initial 
begin
clk = 1;
a = 0;
b = 0;
end

initial begin
//    for (i = 0; i < 2 ** DATA_WIDTH; i++)
//        #CP a = i;
//        for (i = 0; i < 2 ** DATA_WIDTH; i++)
//           #CP b = i;
    #CP
    a = 4'b0100;
    b = 4'b0001;
    #CP

    a = 4'b0100;
    b = 4'b1001;
    #CP

    a = 4'b1111;
    b = 4'b0001;
    #CP

    a = 4'b1001;
    b = 4'b1010;
    
    #CP
    a = 4'b0100;
    b = 4'b0001;

    #CP
    a = 4'b1111;
    b = 4'b1110;
    
    #(5*CP) $finish;
end

endmodule