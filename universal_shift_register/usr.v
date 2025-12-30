module usr(
    input clk,
    input [1:0] mode,
    input [3:0] par_in,
    input s_left,s_right,
    output reg [3:0] Q
    );
   
    always @(posedge clk) begin
        case(mode)
            2'b00: Q <= Q;
            2'b01: Q <= {s_left,Q[3:1]};
            2'b10: Q <= {Q[2:0],s_right};
            2'b11: Q <= par_in;
        endcase
    end          
endmodule
