module top (
    input clk, rst, start,
    input [7:0] Dividend, Divisor,
    output [7:0] Quo, Rem,
    output done
);

  wire load, shift, as, restore, corr, n1;
  wire [2:0] n;
  wire [8:0] A;
  
  controller c1 (
      .clk(clk),
      .rst(rst),
      .start(start),
      .A(A),
      .n(n),
      .load(load),
      .shift(shift),
      .as(as),
      .restore(restore),
      .n1(n1),
      .corr(corr),
      .done(done)
  );
  
  datapath d1 (
      .clk(clk),
      .rst(rst),
      .Dividend(Dividend),
      .Divisor(Divisor),
      .load(load),
      .shift(shift),
      .as(as),
      .restore(restore),
      .corr(corr),
      .n1(n1),
      .done(done),
      .Quo(Quo),
      .Rem(Rem),
      .n(n),
      .A(A)
  );

endmodule
