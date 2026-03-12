module top (
    input clk, rst, start,
    input [7:0] Dividend, Divisor,
    output [7:0] Quo, Rem,
    output done
);

  wire load, shift, res, n1;
  wire [3:0] n;
  
  controller c1 (
      .clk(clk),
      .rst(rst),
      .start(start),
      .n(n),
      .load(load),
      .shift(shift),
      .res(res),
      .n1(n1),
      .done(done)
  );
  
  datapath d1 (
      .clk(clk),
      .rst(rst),
      .Dividend(Dividend),
      .Divisor(Divisor),
      .load(load),
      .shift(shift),
      .res(res),
      .n1(n1),
      .Quo(Quo),
      .Rem(Rem),
      .n(n)
  );

endmodule
