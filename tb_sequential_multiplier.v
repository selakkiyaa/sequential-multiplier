module tb_sequential_multiplier();
    reg clk;
    reg reset;
    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] multiply;
    sequential_multiplier uut (
        .clk(clk),
        .reset(reset),
        .A(A),
        .B(B),
        .multiply(multiply)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        reset = 1;        
        A = 4'b0000;     
        B = 4'b0000;     
        #10;
        reset = 0;       
        #10;
        A = 4'b0010;      
        B = 4'b0010;      
        #100;
        A = 4'b0101;      
        B = 4'b0011;      
        #100;
        $finish;
    end
endmodule

