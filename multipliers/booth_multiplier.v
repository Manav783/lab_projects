module booth_multiplier #(
    parameter N = 8
)(
    input  wire               clk,
    input  wire               rst,
    input  wire               start,
    input  wire signed [N-1:0] multiplicand,
    input  wire signed [N-1:0] multiplier,
    output reg  signed [2*N-1:0] product,
    output reg                done
);

    reg signed [N-1:0] A;
    reg signed [N-1:0] M;
    reg signed [N-1:0] Q;
    reg Q_1;
    reg [$clog2(N):0] count;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            A <= 0;
            M <= 0;
            Q <= 0;
            Q_1 <= 0;
            count <= 0;
            done <= 0;
            product <= 0;
        end 
        else if (start) begin
            A <= 0;
            M <= multiplicand;
            Q <= multiplier;
            Q_1 <= 0;
            count <= N;
            done <= 0;
        end 
        else if (count > 0) begin
            case ({Q[0], Q_1})
                2'b01: A <= A + M;
                2'b10: A <= A - M;
                default: A <= A;
            endcase

            {A, Q, Q_1} <= {A[N-1], A, Q};  // Arithmetic right shift
            count <= count - 1;
        end 
        else begin
            product <= {A, Q};
            done <= 1;
        end
    end

endmodule
