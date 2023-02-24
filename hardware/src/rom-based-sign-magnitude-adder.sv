`timescale 1ns / 1ps

module rom_based_sign_magnitude_adder
#(
    parameter DATA_WIDTH=4
)
(
input  logic clk,                   // Clock input
input  logic [DATA_WIDTH-1:0] a,    // Temperature input
input  logic [DATA_WIDTH-1:0] b,    // Temperature input
output logic [DATA_WIDTH-1:0] sum   // Covnerted temperature output
);

// signal declaration
logic [DATA_WIDTH-2:0] temp;
logic [DATA_WIDTH-1:0] sum_logic;
//logic [6:0] rom [0:15]; // ascending range
//logic [6:0] data_reg;

// load initial values from file led_pattern.txt
//initial
//$readmemb("led_pattern.txt", rom);

// body
//always_ff @(posedge clk)
//data_reg <= rom[addr];
//assign data = data_reg;

always @(posedge clk)
begin
    if (a[DATA_WIDTH-1] == 1 && b[DATA_WIDTH-1] == 1) begin
        temp <= a[DATA_WIDTH-2:0] + b[DATA_WIDTH-2:0];
        sum_logic <= {1,temp};
    end else if (a[DATA_WIDTH-1] == 1 && b[DATA_WIDTH-1] == 0) begin
        if (a[DATA_WIDTH-2:0] > b[DATA_WIDTH-2:0]) begin
            temp <= a[DATA_WIDTH-2:0] - b[DATA_WIDTH-2:0];
            sum_logic <= {1,temp};
        end else begin
            temp <= b[DATA_WIDTH-2:0] - a[DATA_WIDTH-2:0];
            sum_logic <= {0,temp};
        end
    end else if (a[DATA_WIDTH-1] == 0 && b[DATA_WIDTH-1] == 1) begin
        if (a[DATA_WIDTH-2:0] > b[DATA_WIDTH-2:0]) begin
            temp <= a[DATA_WIDTH-2:0] - b[DATA_WIDTH-2:0];
            sum_logic <= {0,temp};
        end else begin
            temp <= b[DATA_WIDTH-2:0] - a[DATA_WIDTH-2:0];
            sum_logic <= {1,temp};
        end
    end else begin
        temp <= a[DATA_WIDTH-2:0] + b[DATA_WIDTH-2:0];
        sum_logic <= {0,temp};
    end
end

assign sum = sum_logic;

endmodule