`timescale 1ns / 1ps

module rom_based_sign_magnitude_adder
#(
    parameter DATA_WIDTH=4
)
(
input  logic clk,                   // Clock input
input  logic [DATA_WIDTH-1:0] a,    // Temperature input
input  logic [DATA_WIDTH-1:0] b,    // Temperature input
output logic [DATA_WIDTH:0] sum   // Covnerted temperature output
);

// signal declaration
logic [DATA_WIDTH+1:0] addr;
logic [DATA_WIDTH:0] sum_logic;
//logic [6:0] SAME_FOUR_BIT [0:63]; // ascending range
logic [DATA_WIDTH:0] data_reg;

// load initial values from file led_pattern.txt
//initial
//$readmemb("led_pattern.txt", rom);

// body
//always_ff @(posedge clk)
//    data_reg <= rom[addr];

//assign data = data_reg;

always @(posedge clk)
begin
    if (a[DATA_WIDTH-1] == 1 && b[DATA_WIDTH-1] == 1) begin
        data_reg <= SAME_FOUR_BIT[addr];
        sum_logic <= {1,data_reg};
    end else if (a[DATA_WIDTH-1] == 1 && b[DATA_WIDTH-1] == 0) begin
        if (a[DATA_WIDTH-2:0] > b[DATA_WIDTH-2:0]) begin
            data_reg <= DIFF_FOUR_BIT[addr];
            sum_logic <= {1,data_reg};
        end else begin
            data_reg <= DIFF_FOUR_BIT[addr];
            sum_logic <= {0,data_reg};
        end
    end else if (a[DATA_WIDTH-1] == 0 && b[DATA_WIDTH-1] == 1) begin
        if (a[DATA_WIDTH-2:0] > b[DATA_WIDTH-2:0]) begin
            data_reg <= DIFF_FOUR_BIT[addr];
            sum_logic <= {0,data_reg};
        end else begin
            data_reg <= DIFF_FOUR_BIT[addr];
            sum_logic <= {1,data_reg};
        end
    end else begin
        data_reg <= SAME_FOUR_BIT[addr];
        sum_logic <= {0,data_reg};
    end
end

assign addr = {a[DATA_WIDTH-2:0], b[DATA_WIDTH-2:0]};
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