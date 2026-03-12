module controller (
    input clk, rst, start,
    input [3:0] n,
    output reg load, shift, res, n1, done
);

  parameter IDLE=3'd0, LOAD=3'd1, SHIFT=3'd2, RESTORE=3'd3, COUNT=3'd4, DONE=3'd5;
  
  reg [2:0] state, nstate;
  
  always @(posedge clk) begin
      if (!rst)
          state <= IDLE;
      else
          state <= nstate;
  end
  
  always @(*) begin
      load = 0;
      shift = 0;
      res = 0;
      done = 0;
      n1 = 0;
      nstate = state;
  
      case (state)
          IDLE    : begin
                      if (start) nstate = LOAD;
                    end
  
          LOAD    : begin
                      load = 1;
                      nstate = SHIFT;
                    end
  
          SHIFT   : begin
                      shift = 1;
                      nstate = RESTORE;
                    end
  
          RESTORE : begin
                      res = 1;
                      nstate = COUNT;
                    end
  
          COUNT   : begin
                      n1 = 1;
                      if (n == 4'd1)
                          nstate = DONE;
                      else
                          nstate = SHIFT;
                    end
  
          DONE    : begin
                      done = 1;
                      nstate = IDLE;
                    end
      endcase
  end
endmodule
