module datapath (
    input clk, rst,
    input [7:0] Dividend, Divisor,
    input load, shift, as, restore, corr, n1, done,
    output [7:0] Quo, Rem,
    output reg [2:0] n,
    output reg [8:0] A
);

  reg [7:0] Q;
  reg [8:0] M;
  reg [16:0] temp;
  
  always @(posedge clk) begin
      if (!rst) begin
          A    <= 9'd0;
          Q    <= 8'd0;
          M    <= 9'd0;
          n    <= 3'd7;
          temp <= 17'd0;
      end
      else begin
          if (load) begin
              A <= 9'd0;
              Q <= Dividend;
              M <= {1'b0, Divisor};
              n <= 3'd7;
          end
  
          if (shift) begin
              temp = {A, Q} << 1;
              A <= temp[16:8];
              Q <= temp[7:0];
          end
  
          if (as) begin
              if (A[8] == 0)
                  A <= A - M;
              else
                  A <= A + M;
          end
  
          if (corr) begin
              A <= A + M;
          end
  
          if (restore) begin
              if (A[8] == 0)
                  Q[0] <= 1'b1;
              else
                  Q[0] <= 1'b0;
          end
  
          if (n1)
              n <= n - 1'b1;
      end
  end
  
  assign Quo = Q;
  assign Rem = A[7:0];

endmodule
