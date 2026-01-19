module rca (
    input  [7:0] A,B,
    input  Cin,
    output [7:0] Sum,
    output Cout
);
    wire [8:0] C;
    assign C[0] = Cin;

    assign {C[1], Sum[0]} = A[0] + B[0] + C[0];
    assign {C[2], Sum[1]} = A[1] + B[1] + C[1];
    assign {C[3], Sum[2]} = A[2] + B[2] + C[2];
    assign {C[4], Sum[3]} = A[3] + B[3] + C[3];
    assign {C[5], Sum[4]} = A[4] + B[4] + C[4];
    assign {C[6], Sum[5]} = A[5] + B[5] + C[5];
    assign {C[7], Sum[6]} = A[6] + B[6] + C[6];
    assign {C[8], Sum[7]} = A[7] + B[7] + C[7];

    assign Cout = C[8];
endmodule
