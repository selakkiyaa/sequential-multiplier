module sequential_multiplier (
    input clk,
    input reset,
    input [3:0] A,
    input [3:0] B,
    output reg [7:0] multiply
);
    reg [7:0] result;
    reg [3:0] B_reg;        
    reg [3:0] counter;      
    reg busy;                
    always @(posedge clk) begin
        if (reset) begin
            result <= 8'b0;
            multiply <= 8'b0;
            B_reg <= 4'b0;
            counter <= 4'b0;
            busy <= 1'b0;
        end else begin
            if (!busy) begin
                result <= 8'b0;
                B_reg <= B;
                counter <= 4'b0;
                busy <= 1'b1;
            end
        else if (counter < B) begin
                result <= result + A;
                counter <= counter + 1;
            end else begin
                multiply <= result;
                busy <= 1'b0;
            end
        end
    end
endmodule

