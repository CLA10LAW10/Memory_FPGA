`timescale 1ns / 1ps

module rom_based_sign_magnitude_adder
#(
    parameter DATA_WIDTH=4
)
(
input  logic clk,                   // Clock input
input  logic [DATA_WIDTH-1:0] a,    // Temperature input
input  logic [DATA_WIDTH-1:0] b,    // Temperature input
output logic [DATA_WIDTH:0] sum     // Converted temperature output
);

// signal declaration
logic [DATA_WIDTH+1:0] addr;
logic [DATA_WIDTH:0] sum_logic;
logic [DATA_WIDTH-1:0] diff_data_reg;
logic [DATA_WIDTH-1:0] same_data_reg;

always @(posedge clk)
begin
    if (a[DATA_WIDTH-1] == b[DATA_WIDTH-1]) begin
        sum_logic <= {a[DATA_WIDTH-1],same_data_reg};
    end else if (a[DATA_WIDTH-2:0] > b[DATA_WIDTH-2:0]) begin
        sum_logic <= {a[DATA_WIDTH-1],diff_data_reg}; 
    end else if (a[DATA_WIDTH-2:0] < b[DATA_WIDTH-2:0]) begin
        sum_logic <= {b[DATA_WIDTH-1],diff_data_reg};
    end 
end

assign addr = {a[DATA_WIDTH-2:0], b[DATA_WIDTH-2:0]};
assign same_data_reg = SAME_FOUR_BIT[addr];
assign diff_data_reg = DIFF_FOUR_BIT[addr];
assign sum = sum_logic;

logic [3:0] SAME_FOUR_BIT [0:63]='{
    4'h0,4'h1,4'h2,4'h3,4'h4,4'h5,4'h6,
    4'h7,4'h1,4'h2,4'h3,4'h4,4'h5,4'h6,
    4'h7,4'h8,4'h2,4'h3,4'h4,4'h5,4'h6,
    4'h7,4'h8,4'h9,4'h3,4'h4,4'h5,4'h6,
    4'h7,4'h8,4'h9,4'hA,4'h4,4'h5,4'h6,
    4'h7,4'h8,4'h9,4'hA,4'hB,4'h5,4'h6,
    4'h7,4'h8,4'h9,4'hA,4'hB,4'hC,4'h6,
    4'h7,4'h8,4'h9,4'hA,4'hB,4'hC,4'hD,
    4'h7,4'h8,4'h9,4'hA,4'hB,4'hC,4'hD,
    4'hE
};

logic [3:0] DIFF_FOUR_BIT [0:63]='{
    4'h0,4'h1,4'h2,4'h3,4'h4,4'h5,4'h6,
    4'h7,4'h1,4'h0,4'h1,4'h2,4'h3,4'h4,
    4'h5,4'h6,4'h2,4'h1,4'h0,4'h1,4'h2,
    4'h3,4'h4,4'h5,4'h3,4'h2,4'h1,4'h0,
    4'h1,4'h2,4'h3,4'h4,4'h4,4'h3,4'h2,
    4'h1,4'h0,4'h1,4'h2,4'h3,4'h5,4'h4,
    4'h3,4'h2,4'h1,4'h0,4'h1,4'h2,4'h6,
    4'h5,4'h4,4'h3,4'h2,4'h1,4'h0,4'h1,
    4'h7,4'h6,4'h5,4'h4,4'h3,4'h2,4'h1,
    4'h0
};

endmodule