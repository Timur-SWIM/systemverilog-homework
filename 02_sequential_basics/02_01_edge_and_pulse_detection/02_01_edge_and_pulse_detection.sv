//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module posedge_detector (input clk, rst, a, output detected);

  logic a_r;

  // Note:
  // The a_r flip-flop input value d propogates to the output q
  // only on the next clock cycle.

  always_ff @ (posedge clk)
    if (rst)
      a_r <= '0;
    else
      a_r <= a;

  assign detected = ~ a_r & a;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module one_cycle_pulse_detector (input clk, rst, a, output detected);

  // Task:
  // Create an one cycle pulse (010) detector.
  //
  // Note:
  // See the testbench for the output format ($display task).


logic [1:0] shift_reg;
    
always_ff @(posedge clk) begin
    if (rst) begin
        shift_reg <= 3'b00;
    end
    else begin 
        shift_reg <= {shift_reg[0], a};
    end
end
    
assign detected = (shift_reg == 3'b01) && !a;

endmodule
