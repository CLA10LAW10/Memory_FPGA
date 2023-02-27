// Rom Based 16 Bit Signed Magnitude Adder
module rom_16_based_sign_magnitude_adder
#(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 16
)
(
 input  logic clk,                  // Clock input
 input  logic [DATA_WIDTH-1:0] a,   // A input
 input  logic [DATA_WIDTH-1:0] b,   // B input
 output logic [DATA_WIDTH:0] data   // Signed Magnitude output
);

// signal declaration
logic [DATA_WIDTH:0] rom [0:(2**ADDR_WIDTH)-1]; // ROM, ascending range
logic [DATA_WIDTH:0] data_reg;                  // Synchronous data register
logic [15:0] addr;                              // Address

// load initial values from file temperature_conversion.txt
// Will recognize white space or new lines as new elements within the .txt
initial
   $readmemb("C:\Users\Clayton\Documents\CSUN\ECE524\Labs\Lab4\sp23-e524-lab4-mem-CLA10LAW10\hardware\src\8-bit-rom.txt", rom);

// body
always @(posedge clk)
      data_reg <= rom[addr]; // Read outputs depending on address, input A and B concatonated.

// Continually concatonate inputs
assign addr = {a, b};
// Continually assign too the output
assign data = data_reg;

endmodule