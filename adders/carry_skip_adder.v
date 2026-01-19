module carry_skip_adder(
    input  [7:0] A,B,
    input  Cin,
    output [7:0] Sum,
    output Cout
);
    wire c4;
    wire [3:0] P0;
    wire skip;
    wire carry_mid;

    assign {c4, Sum[3:0]} = A[3:0] + B[3:0] + Cin;

    assign P0   = A[3:0] ^ B[3:0];
    assign skip = P0[0] & P0[1] & P0[2] & P0[3];

    assign carry_mid = skip ? Cin : c4;

    assign {Cout, Sum[7:4]} = A[7:4] + B[7:4] + carry_mid;
endmodule
