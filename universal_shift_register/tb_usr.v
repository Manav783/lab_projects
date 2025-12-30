module tb_usr( );
    reg clk;
    reg [1:0] mode;
    reg [3:0] par_in;
    reg s_left,s_right;
    wire [3:0] Q;
    usr F(clk,mode,par_in,s_left,s_right,Q);
    initial begin
        clk=0; forever #5 clk = ~clk;
    end
    initial begin
        par_in=4'b1010; s_left=0; s_right=1;
        mode=2'b11; #10;
        mode=2'b00; #10;
        mode=2'b01; #10;
        mode=2'b10; #10;
        par_in=4'b1100;
        mode=2'b11;
        $finish;
   end
endmodule
