// Add Word_count
// 25 and 75 percent full

module fifo_ctrl
#(
 parameter ADDR_WIDTH=4  // number of address bits
)
(
 input  logic clk, reset,
 input  logic rd, wr,
 output logic almost_empty, almost_full,
 output logic empty, full,
 output logic [ADDR_WIDTH+1:0] word_count,
 output logic [ADDR_WIDTH-1:0] w_addr,
 output logic [ADDR_WIDTH-1:0] r_addr
);

parameter STACK_DEPTH = 2 ** ADDR_WIDTH;              // Paramter used to calculate stack size
parameter TWENTY_FIVE = STACK_DEPTH / 4;         // Results to 25% of the stack size
parameter SEVENTY_FIVE = (3 * STACK_DEPTH) / 4;   // Results to 75% of the stack size

//signal declaration
logic [ADDR_WIDTH-1:0] w_ptr_logic, w_ptr_next, w_ptr_succ;
logic [ADDR_WIDTH-1:0] r_ptr_logic, r_ptr_next, r_ptr_succ;
logic [ADDR_WIDTH+1:0] word_count_logic;
logic full_logic, empty_logic, full_next, empty_next;
  // body
  // fifo control logic
  // logicisters for status and read and write pointers
always_ff @(posedge clk, posedge reset)
if (reset)
   begin
      w_ptr_logic <= 0;
      r_ptr_logic <= 0;
      full_logic <= 1'b0;
      empty_logic <= 1'b1;
      word_count_logic <= 0;
   end
else
   begin
      w_ptr_logic <= w_ptr_next;
      r_ptr_logic <= r_ptr_next;
      full_logic <= full_next;
      empty_logic <= empty_next;
      word_count <= word_count_logic;
   end
// next-state logic for read and write pointers
   always_comb
   begin
      // successive pointer values
      w_ptr_succ = w_ptr_logic + 1;
      r_ptr_succ = r_ptr_logic + 1;
      // default: keep old values
      w_ptr_next = w_ptr_logic;
      r_ptr_next = r_ptr_logic;
      full_next = full_logic;
      empty_next = empty_logic;
      unique case ({wr, rd})
      2'b01: // read
         if (~empty_logic) // not empty
            begin
               r_ptr_next = r_ptr_succ;
               full_next = 1'b0;
               word_count_logic = word_count_logic - 1;
               if (r_ptr_succ==w_ptr_logic)
                  empty_next = 1'b1;
            end
      2'b10: // write
         if (~full_logic) // not full
            begin
               w_ptr_next = w_ptr_succ;
               empty_next = 1'b0;
               word_count_logic = word_count_logic + 1;
               if (w_ptr_succ==r_ptr_logic)
                  full_next = 1'b1;
            end
      2'b11: // write and read
         begin
            w_ptr_next = w_ptr_succ;
            r_ptr_next = r_ptr_succ;
            word_count_logic = word_count_logic;
         end
      default: ;  // 2'b00; null statement; no op
   endcase
end
// output
//assign word_count = word_count_logic;
assign w_addr = w_ptr_logic;
assign r_addr = r_ptr_logic;
assign full = full_logic;
assign empty = empty_logic;
assign almost_empty = (word_count_logic == TWENTY_FIVE) ? 1 : 0;
assign almost_full = (word_count_logic == SEVENTY_FIVE) ? 1 : 0;
endmodule