module carry_select_adder (
    input  [7:0] A,B,
    input  Cin,
    output [7:0] Sum,
    output Cout
);
    wire [3:0] sum0, sum1;
    wire c0, c1, c2;

    assign {c0, Sum[3:0]} = A[3:0] + B[3:0] + Cin;

    assign {c1, sum0} = A[7:4] + B[7:4] + 1'b0;
    assign {c2, sum1} = A[7:4] + B[7:4] + 1'b1;

    assign Sum[7:4] = c0 ? sum1 : sum0;
    assign Cout     = c0 ? c2   : c1;
endmodule
