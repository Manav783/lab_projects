module shift_add_multiplier #(
    parameter N = 8
)(
    input  wire              clk,
    input  wire              rst,
    input  wire              start,
    input  wire [N-1:0]      multiplicand,
    input  wire [N-1:0]      multiplier,
    output reg  [2*N-1:0]    product,
    output reg               done
);

    reg [N-1:0] A;          // Accumulator (n-bit)
    reg [N-1:0] M;          // Multiplicand
    reg [N-1:0] Q;          // Multiplier
    reg [$clog2(N):0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A     <= 0;
            M     <= 0;
            Q     <= 0;
            count <= 0;
            done  <= 0;
            product <= 0;
        end 
        else if (start) begin
            A     <= 0;
            M     <= multiplicand;
            Q     <= multiplier;
            count <= N;
            done  <= 0;
        end 
        else if (count > 0) begin
            if (Q[0] == 1'b1)
                A <= A + M;           // n-bit adder used here

            M <= M << 1;              // Shift left
            Q <= Q >> 1;              // Shift right
            count <= count - 1;
        end 
        else begin
            product <= {A, Q};
            done <= 1;
        end
    end

endmodule
