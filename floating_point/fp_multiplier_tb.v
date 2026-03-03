`timescale 1ns/1ps

module fp_multiplier_tb;

    reg signed [3:0] M1, M2;
    reg [2:0] E1, E2;

    wire signed [3:0] M_out;
    wire [2:0] E_out;

    fp_multiplier uut (
        .M1(M1),
        .M2(M2),
        .E1(E1),
        .E2(E2),
        .M_out(M_out),
        .E_out(E_out)
    );

    initial begin
        //$display("Time | M1 E1 | M2 E2 || M_out E_out");
        //$monitor("%4t | %d %d | %d %d || %d %d", $time, M1, E1, M2, E2, M_out, E_out);

        // Test Case 1
        M1 = 4'b0101;  // +5
        E1 = 3'b010;   // 2
        M2 = 4'b1100;  // -4
        E2 = 3'b001;   // 1
        #10;

        // Test Case 2
        M1 = 4'b0011;  // +3
        E1 = 3'b001;
        M2 = 4'b0010;  // +2
        E2 = 3'b010;
        #10;

        // Test Case 3
        M1 = 4'b1110;  // -2
        E1 = 3'b001;
        M2 = 4'b0011;  // +3
        E2 = 3'b001;
        #10;

        $stop;
    end

endmodule
