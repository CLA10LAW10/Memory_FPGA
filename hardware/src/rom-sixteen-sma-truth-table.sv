`timescale 1ns / 1ps

module rom_sixteen_sma_truth_table
#(
    parameter DATA_WIDTH=8
)
(
input  logic                    clk,    // Clock input
input  logic [DATA_WIDTH-1:0]   a,      // Temperature input
input  logic [DATA_WIDTH-1:0]   b,      // Temperature input
output logic [DATA_WIDTH:0]     sum     // Covnerted temperature output
);

// signal declaration
logic [DATA_WIDTH-1:0] temp;
logic [DATA_WIDTH:0] sum_logic;

always @(posedge clk)
begin
    if (a[DATA_WIDTH-1] == b[DATA_WIDTH-1] ) begin
        temp <= a[DATA_WIDTH-2:0] + b[DATA_WIDTH-2:0];
        sum_logic <= {a[DATA_WIDTH-1],temp};
    end else if (a[DATA_WIDTH-2:0] > b[DATA_WIDTH-2:0]) begin
            temp <= a[DATA_WIDTH-2:0] - b[DATA_WIDTH-2:0];
            sum_logic <= {a[DATA_WIDTH-1:0],temp}; 
    end else if (a[DATA_WIDTH-2:0] < b[DATA_WIDTH-2:0]) begin
            temp <= b[DATA_WIDTH-2:0] - a[DATA_WIDTH-2:0];
            sum_logic <= {b[DATA_WIDTH-1:0],temp};
    end
end

assign sum = sum_logic;

endmodule