`timescale 1ns / 1ps

module rom_based_temperature_conversion_tb();

reg clk;
reg [7:0] temperature;
reg unit;
wire [7:0] data;

integer i;
parameter CP = 8;

rom_based_temperature_conversion ROM_uut (.*);

always #(CP/2) clk = ~clk;

initial 
begin
clk = 0;
temperature = 0;
unit = 0;
end

initial begin
    #CP unit = 1;
    for (i = 0; i < 101; i++)
        #CP temperature = i;

    #CP unit = 0;
    for (i = 0; i < 213; i++)
        #CP temperature = i;
    #CP
    $finish;
end

endmodule