module tb_bcd();
  reg [3:0] A,B;
  reg C;
  reg [3:0] S;
  wire Co;

  bcd F(.A(A),.B(B),.C(C),.S(S),.Co(Co));
  integer i,j,k;
  initial begin 
    for(i=0;i<=9;i=i+1) begin 
      for(j=0;j<=9;j=j+1) begin 
        for(k=0;k<=1;k=k+1) begin 
          A = i ; B = j ; C = k ; #10;
        end
      end
    end
    $finish
  end
endmodule
