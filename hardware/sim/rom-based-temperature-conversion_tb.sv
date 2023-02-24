`timescale 1ns / 1ps

module rom_based_temperature_conversion_tb();

reg clk;
reg [7:0] temperature;
reg unit;
wire [6:0] data;

integer i;
parameter CP = 8;

rom_based_temperature_conversion ROM_uut (.*);

//initial 
//begin
//PART A: INITIALIZE MEMORY
//$readmemb("temperature_conversion.txt", ROM_uut.rom, 8);
//$readmemb("temperature_conversion.txt", rom);
//end

always #(CP/2) clk = ~clk;

initial 
begin
clk = 0;
temperature = 0;
unit = 0;
end

initial begin
    #CP unit = 0;
    #(10*CP)
    #CP unit = 1;
    #CP temperature = 8'b0;
    //for (i = 0; i < 101; i++)
    //    #CP temperature = i;
end

endmodule