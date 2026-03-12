module controller (
    input clk, rst, start,
    input [8:0] A,
    input [2:0] n,
    output reg load, shift, as, restore, n1, corr, done
);

  parameter IDLE    = 3'd0,
            LOAD    = 3'd1,
            SHIFT   = 3'd2,
            ARITH   = 3'd3,
            SETQ    = 3'd4,
            COUNT   = 3'd5,
            CORRECT = 3'd6,
            DONE    = 3'd7;
  
  reg [2:0] state, nstate;
  
  always @(posedge clk) begin
      if (!rst)
          state <= IDLE;
      else
          state <= nstate;
  end
  
  always @(*) begin
      load    = 0;
      shift   = 0;
      as      = 0;
      restore = 0;
      n1      = 0;
      done    = 0;
      corr    = 0;
      nstate  = state;
  
      case (state)
          IDLE: begin
              if (start)
                  nstate = LOAD;
          end
  
          LOAD: begin
              load = 1;
              nstate = SHIFT;
          end
  
          SHIFT: begin
              shift = 1;
              nstate = ARITH;
          end
  
          ARITH: begin
              as = 1;
              nstate = SETQ;
          end
  
          SETQ: begin
              restore = 1;
              nstate = COUNT;
          end
  
          COUNT: begin
              n1 = 1;
              if (n == 0)
                  nstate = CORRECT;
              else
                  nstate = SHIFT;
          end
  
          CORRECT: begin
              if (A[8] == 1)
                  corr = 1;
              nstate = DONE;
          end
  
          DONE: begin
              done = 1;
              nstate = IDLE;
          end
      endcase
  end

endmodule
