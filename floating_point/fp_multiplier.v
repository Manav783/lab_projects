module fp_multiplier (
    input  signed [3:0] M1,
    input  signed [3:0] M2,
    input  [2:0] E1,
    input  [2:0] E2,
    output reg signed [3:0] M_out,
    output reg [2:0] E_out
);

    reg signed [7:0] product;      // 8-bit mantissa product
    reg signed [7:0] multiplicand;
    reg signed [7:0] multiplier;
    integer i;

    always @(*) begin
        // Step 1: Exponent addition
        E_out = E1 + E2;

        // Step 2: Sign extend mantissas
        multiplicand = {{4{M1[3]}}, M1};
        multiplier   = {{4{M2[3]}}, M2};

        product = 8'd0;

        // Step 3: Shift-Add Multiplication
        for (i = 0; i < 4; i = i + 1) begin
            if (multiplier[i] == 1'b1)
                product = product + (multiplicand <<< i);
        end

        // Step 4: Normalization
        if (product[7] == 0 && product[6] == 1) begin
            product = product << 1;
            E_out = E_out - 1;
        end
        else if (product[7] == 1 && product[6] == 0) begin
            product = product << 1;
            E_out = E_out - 1;
        end

        // Take upper 4 bits as final mantissa
        M_out = product[7:4];
    end

endmodule
