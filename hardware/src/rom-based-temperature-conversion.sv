// Rom Based Temperature Conversion
module rom_based_temperature_conversion
(
 input  logic clk,               // Clock input
 input  logic [7:0] temperature, // Temperature input
 input  logic unit,              // 1 for Celsius input, 0 for Fahrenheit
 output logic [7:0] data         // Covnerted temperature output
);

// signal declaration
//logic [7:0] rom [0:202];   // ROM, ascending range
logic [7:0] data_reg;      // Temp data register

// load initial values from file temperature_conversion.txt
//initial
  // $readmemb("temperature_conversion.txt", rom);   // Will recognize white space or new lines as new elements within the .txt

// body
always_ff @(posedge clk)
   if (unit) begin
      // celsius to fahrenheit. Input will be element output.
      data_reg <= celsius_conversion_rom[temperature]; // 0-100 input will directly address to Fahrenheit output 
   end else begin
      // fahrenheit to celsius
      data_reg <= fahrenheit_conversion_rom[temperature];
   end 
   
assign data = data_reg;

logic [7:0] celsius_conversion_rom [0:100]='{
   8'h20,8'h22,8'h24,8'h26,8'h28,8'h29,8'h2B,8'h2D,8'h2F,8'h31,
   8'h32,8'h34,8'h36,8'h38,8'h3A,8'h3B,8'h3D,8'h3F,8'h41,8'h43,
   8'h44,8'h46,8'h48,8'h4A,8'h4C,8'h4D,8'h4F,8'h51,8'h53,8'h55,
   8'h56,8'h58,8'h5A,8'h5C,8'h5E,8'h5F,8'h61,8'h63,8'h65,8'h67,
   8'h68,8'h6A,8'h6C,8'h6E,8'h70,8'h71,8'h73,8'h75,8'h77,8'h79,
   8'h7A,8'h7C,8'h7E,8'h80,8'h82,8'h83,8'h85,8'h87,8'h89,8'h8B,
   8'h8C,8'h8E,8'h90,8'h92,8'h94,8'h95,8'h97,8'h99,8'h9B,8'h9D,
   8'h9E,8'hA0,8'hA2,8'hA4,8'hA6,8'hA7,8'hA9,8'hAB,8'hAD,8'hAF,
   8'hB0,8'hB2,8'hB4,8'hB6,8'hB8,8'hB9,8'hBB,8'hBD,8'hBF,8'hC1,
   8'hC2,8'hC4,8'hC6,8'hC8,8'hCA,8'hCB,8'hCD,8'hCF,8'hD1,8'hD3,8'hD4
};
logic [7:0] fahrenheit_conversion_rom [0:212]='{
   8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,
   8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,
   8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'hZ,8'h0,8'h1,8'h2,8'h2,8'h3,8'h3,8'h4,
   8'h4,8'h5,8'h5,8'h6,8'h7,8'h7,8'h8,8'h8,8'h9,8'h9,8'hA,8'hA,8'hB,
   8'hC,8'hC,8'hD,8'hD,8'hE,8'hE,8'hF,8'hF,8'h10,8'h11,8'h11,8'h12,
   8'h12,8'h13,8'h13,8'h14,8'h14,8'h15,8'h16,8'h16,8'h17,8'h17,8'h18,
   8'h18,8'h19,8'h19,8'h1A,8'h1B,8'h1B,8'h1C,8'h1C,8'h1D,8'h1D,8'h1E,
   8'h1E,8'h1F,8'h20,8'h20,8'h21,8'h21,8'h22,8'h22,8'h23,8'h23,8'h24,
   8'h25,8'h25,8'h26,8'h26,8'h27,8'h27,8'h28,8'h28,8'h29,8'h2A,8'h2A,
   8'h2B,8'h2B,8'h2C,8'h2C,8'h2D,8'h2D,8'h2E,8'h2F,8'h2F,8'h30,8'h30,
   8'h31,8'h31,8'h32,8'h32,8'h33,8'h34,8'h34,8'h35,8'h35,8'h36,8'h36,
   8'h37,8'h37,8'h38,8'h39,8'h39,8'h3A,8'h3A,8'h3B,8'h3B,8'h3C,8'h3C,
   8'h3D,8'h3E,8'h3E,8'h3F,8'h3F,8'h40,8'h40,8'h41,8'h41,8'h42,8'h43,
   8'h43,8'h44,8'h44,8'h45,8'h45,8'h46,8'h46,8'h47,8'h48,8'h48,8'h49,
   8'h49,8'h4A,8'h4A,8'h4B,8'h4B,8'h4C,8'h4D,8'h4D,8'h4E,8'h4E,8'h4F,
   8'h4F,8'h50,8'h50,8'h51,8'h52,8'h52,8'h53,8'h53,8'h54,8'h54,8'h55,
   8'h55,8'h56,8'h57,8'h57,8'h58,8'h58,8'h59,8'h59,8'h5A,8'h5A,8'h5B,
   8'h5C,8'h5C,8'h5D,8'h5D,8'h5E,8'h5E,8'h5F,8'h5F,8'h60,8'h61,8'h61,
   8'h62,8'h62,8'h63,8'h63,8'h64,8'h64
};

endmodule