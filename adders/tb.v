`timescale 1ns / 1ps

//this same testbench can be used for all the adders by just changing module instantiation

module adder_tb;
    reg  [7:0] A,B;
    reg Cin;
  
    wire [7:0] Sum;
    wire Cout;

    rca F (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum_rca), .Cout(Cout_rca)
    );

    initial begin
        Cin = 0;

        A = 8'h05; B = 8'h03; #10;
        A = 8'h0F; B = 8'h01; #10;
        A = 8'hAA; B = 8'h55; #10;
        A = 8'hFF; B = 8'h01; #10;

        Cin = 1;
        A = 8'h10; B = 8'h20; #10;
        A = 8'h7F; B = 8'h01; #10;

        $stop;
    end
endmodule
