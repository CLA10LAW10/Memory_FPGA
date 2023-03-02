`timescale 1ns / 1ps

module rom_sixteen_truth_table_tb();

parameter DATA_WIDTH = 8;
reg                         clk;    // Clock input
reg     [DATA_WIDTH-1:0]    a;      // Temperature input
reg     [DATA_WIDTH-1:0]    b;      // Temperature input
wire    [DATA_WIDTH:0]    sum;    // Covnerted temperature output

integer i,j;
parameter CP = 8;

rom_sixteen_sma_truth_table #(.DATA_WIDTH(DATA_WIDTH)) sixteen_truth_table_uut (.clk(clk),.a(a),.b(b),.sum(sum));

always #(CP/2) clk = ~clk;

initial 
begin
    clk = 0;
    a = 0;
    b = 0;
end

initial begin

#CP

    for (i = 0; i < 2 ** DATA_WIDTH; i++) begin
        for (j = 0; j < 2 ** DATA_WIDTH; j++) begin
            #CP 
            a = i;
            b = j;
            $display("a%9bb",sum);
        end
    end
    #CP a = 0; b = 0;
    $display("%9b,",sum);
    #CP a = 0; b = 0;
    $display("%9b,",sum);
    #CP a = 0; b = 0;
    $display("%9b,",sum);
    #(2*CP) $finish;
end

endmodule