module bcd(
  input [3:0] A,B,
  input C,
  output reg [3:0] S,
  output reg Co
);
  reg [4:0] temp;
  always @(*) begin 
    temp = A + B + C;
    if (temp > 9) begin 
      temp = temp + 5'd6; 
      Co = 1;
    end
    else Co = 0;
    S = temp[3:0] ; 
  end 
endmodule
