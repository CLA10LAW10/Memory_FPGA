`timescale 1ns / 1ps

module rom_based_sign_magnitude_adder
#(
    parameter DATA_WIDTH=4
)
(
input  logic clk,                   // Clock input
input  logic [DATA_WIDTH-1:0] a,    // a input
input  logic [DATA_WIDTH-1:0] b,    // b input
output logic [DATA_WIDTH:0] sum     //  SMA output
);

// signal declaration
logic [(DATA_WIDTH*2)-1:0] addr;
logic [DATA_WIDTH:0] sum_logic;
logic [DATA_WIDTH:0] ROM_FOUR_BIT [0:255]={
    8'h00,
8'h01,
8'h02,
8'h03,
8'h04,
8'h05,
8'h06,
8'h06,
8'h17,
8'h01,
8'h12,
8'h03,
8'h14,
8'h05,
8'h16,
8'h07,
8'h01,
8'h02,
8'h03,
8'h04,
8'h05,
8'h06,
8'h07,
8'h18,
8'h18,
8'h01,
8'h11,
8'h02,
8'h13,
8'h04,
8'h15,
8'h06,
8'h02,
8'h03,
8'h04,
8'h05,
8'h06,
8'h07,
8'h08,
8'h09,
8'h02,
8'h02,
8'h11,
8'h01,
8'h12,
8'h03,
8'h14,
8'h05,
8'h03,
8'h04,
8'h05,
8'h06,
8'h07,
8'h08,
8'h09,
8'h1a,
8'h13,
8'h12,
8'h12,
8'h01,
8'h11,
8'h02,
8'h13,
8'h04,
8'h04,
8'h05,
8'h06,
8'h07,
8'h08,
8'h09,
8'h0a,
8'h0b,
8'h04,
8'h03,
8'h02,
8'h02,
8'h11,
8'h01,
8'h12,
8'h03,
8'h05,
8'h06,
8'h07,
8'h08,
8'h09,
8'h0a,
8'h0b,
8'h1c,
8'h15,
8'h14,
8'h13,
8'h12,
8'h12,
8'h01,
8'h11,
8'h02,
8'h06,
8'h07,
8'h08,
8'h09,
8'h0a,
8'h0b,
8'h0c,
8'h0d,
8'h06,
8'h05,
8'h04,
8'h03,
8'h02,
8'h02,
8'h11,
8'h01,
8'h07,
8'h08,
8'h09,
8'h0a,
8'h0b,
8'h0c,
8'h0d,
8'h1e,
8'h17,
8'h16,
8'h15,
8'h14,
8'h13,
8'h12,
8'h12,
8'h12,
8'h11,
8'h01,
8'h12,
8'h03,
8'h14,
8'h05,
8'h16,
8'h17,
8'h10,
8'h11,
8'h12,
8'h13,
8'h14,
8'h15,
8'h16,
8'h17,
8'h17,
8'h01,
8'h11,
8'h02,
8'h13,
8'h04,
8'h15,
8'h16,
8'h11,
8'h12,
8'h13,
8'h14,
8'h15,
8'h16,
8'h17,
8'h08,
8'h02,
8'h02,
8'h11,
8'h01,
8'h12,
8'h03,
8'h14,
8'h15,
8'h12,
8'h13,
8'h14,
8'h15,
8'h16,
8'h17,
8'h18,
8'h19,
8'h13,
8'h12,
8'h12,
8'h01,
8'h11,
8'h02,
8'h13,
8'h14,
8'h13,
8'h14,
8'h15,
8'h16,
8'h17,
8'h18,
8'h19,
8'h0a,
8'h04,
8'h03,
8'h02,
8'h02,
8'h11,
8'h01,
8'h12,
8'h13,
8'h14,
8'h15,
8'h16,
8'h17,
8'h18,
8'h19,
8'h1a,
8'h1b,
8'h15,
8'h14,
8'h13,
8'h12,
8'h12,
8'h01,
8'h11,
8'h12,
8'h15,
8'h16,
8'h17,
8'h18,
8'h19,
8'h1a,
8'h1b,
8'h0c,
8'h06,
8'h05,
8'h04,
8'h03,
8'h02,
8'h02,
8'h11,
8'h11,
8'h16,
8'h17,
8'h18,
8'h19,
8'h1a,
8'h1b,
8'h1c,
8'h1d,
8'h17,
8'h16,
8'h15,
8'h14,
8'h13,
8'h12,
8'h12,
8'h11,
8'h17,
8'h18,
8'h19,
8'h1a,
8'h1b,
8'h1c,
8'h1d,
8'h1e
};

always @(posedge clk)
begin
    sum_logic <= ROM_FOUR_BIT[addr];
end

assign addr = {a, b};
assign sum = sum_logic;


endmodule