`timescale 1ns/1ps

module tb_shift_add_multiplier;

    parameter N = 8;

    reg clk;
    reg rst;
    reg start;
    reg [N-1:0] multiplicand;
    reg [N-1:0] multiplier;

    wire [2*N-1:0] product;
    wire done;

    // DUT
    shift_add_multiplier #(.N(N)) uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product),
        .done(done)
    );

    // Clock (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize
        clk = 0;
        rst = 1;
        start = 0;
        multiplicand = 0;
        multiplier = 0;

        // Reset
        #10 rst = 0;

        // Apply inputs
        #10;
        multiplicand = 8'd5;
        multiplier   = 8'd3;
        start = 1;

        #10 start = 0;

        // Wait for completion
        wait(done);

        #20 $finish;
    end

endmodule
