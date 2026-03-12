module datapath (
    input clk, rst,
    input [7:0] Dividend, Divisor,
    input load, shift, res, n1,
    output [7:0] Quo, Rem,
    output reg [3:0] n
);

  reg [7:0] Q;
  reg [8:0] M, resA;
  reg signed [8:0] A;
  reg [16:0] temp;
  
  always @(posedge clk) begin
      if (!rst) begin
          A    <= 0;
          n    <= 4'd8;
          resA <= 0;
          Q    <= 0;
          M    <= 0;
          temp <= 0;
      end
      else begin
          if (load) begin
              M <= {1'b0, Divisor};
              A <= 9'd0;
              Q <= Dividend;
              n <= 4'd8;
          end
  
          if (shift) begin
              temp = {A, Q} << 1;
              resA <= temp[16:8];
              A <= temp[16:8] - M;
              Q <= temp[7:0];
          end
  
          if (res) begin
              if (A[8] == 0)
                  Q[0] <= 1'b1;
              else begin
                  Q[0] <= 1'b0;
                  A <= resA;
              end
          end
  
          if (n1)
              n <= n - 1'b1;
      end
  end
  
  assign Quo = Q;
  assign Rem = A[7:0];

endmodule
