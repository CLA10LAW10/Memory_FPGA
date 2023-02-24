// Rom Based Temperature Conversion
module rom_based_temperature_conversion
(
 input  logic clk,               // Clock input
 input  logic [7:0] temperature, // Temperature input
 input  logic unit,              // 1 for Celsius input, 0 for Fahrenheit
 output logic [7:0] data         // Covnerted temperature output
);

// signal declaration
logic [7:0] rom [0:202];   // ROM, ascending range
logic [7:0] data_reg;      // Temp data register

// load initial values from file temperature_conversion.txt
initial
   $readmemb("temperature_conversion.txt", rom);   // Will recognize white space or new lines as new elements within the .txt

// body
always_ff @(posedge clk)
   if (unit) begin
      // celsius to fahrenheit. Input will be element output.
      data_reg <= rom[addr]; // 0-100 input will directly address to Fahrenheit output 
   end else begin
      // fahrenheit to celsius
      data_reg <= 0;
   end 
   
assign data = data_reg;
endmodule