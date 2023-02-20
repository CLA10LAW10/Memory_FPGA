// Rom Based Temperature Conversion
module sync_rom
(
 input  logic clk,
 input  logic [7:0] addr,
 input  logic unit,
 output logic [6:0] data
);

// signal declaration
logic [6:0] rom [0:202]; // ascending range
logic [6:0] data_reg;

// load initial values from file led_pattern.txt
// content of led_pattern.txt:
// 1000000 1111001 0100100 0110000 0011001 0010010 0000010 1111000
// 0000000 0010000 0001000 0000011 1000110 0100001 0000110 0001110
initial
   $readmemb("led_pattern.txt", rom);   // Will recognize white space or new lines as new elements within the .txt

// body
always_ff @(posedge clk)
   if (unit) begin
      // celsius to fahrenheit. Input will be element output.
      data_reg <= rom[addr];
   end else begin
      // fahrenheit to celsius
      data_reg <= 0;
   end 
   
assign data = data_reg;
endmodule