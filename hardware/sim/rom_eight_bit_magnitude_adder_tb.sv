`timescale 1ns / 1ps

module rom_16_bit_magnitude_adder_tb();

parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 16;
reg                         clk;  // Clock input
reg     [DATA_WIDTH-1:0]    a;    // A input
reg     [DATA_WIDTH-1:0]    b;    // B input
wire    [DATA_WIDTH:0]    sum;   // Signed Magnitude output

parameter CP = 8;

rom_eight_bit_magnitude_adder #(.ADDR_WIDTH(ADDR_WIDTH),.DATA_WIDTH(DATA_WIDTH)) adder_sixteen_uut (.clk(clk),.a(a),.b(b),.sum(sum));

//rom_16_based_sign_magnitude_adder #(.DATA_WIDTH(DATA_WIDTH),.ADDR_WIDTH(ADDR_WIDTH)) adder_sixteen_uut(.*);

always #(CP/2) clk = ~clk;

initial 
begin
clk = 1;
a = 0;
b = 0;
end

initial begin

    #CP
    a = 8'b00000001;
    b = 8'b00000010;
    #CP

    a = 8'b00000010;
    b = 8'b10000100;
    #CP

    a = 8'b10000100;
    b = 8'b00000001;
    #CP

    a = 8'b10000010;
    b = 8'b10000010;
    
    #CP
    a = 8'b10111001;
    b = 8'b01111001;
    
    #CP
    a = 8'b11111111;
    b = 8'b11111111;
    
    #(2*CP) $finish;
end

endmodule