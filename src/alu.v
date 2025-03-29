module alu (
    input  [3:0] a,
    input  [3:0] b,
    input  [1:0] sel, // sel = 00 -> ADD; sel = 01 -> SUBTRACT; sel = 10 -> bitwise AND; sel = 11 -> bitwise OR
    output reg [3:0] result
);

always @(*) begin
    case (sel)
        2'b00: result = a + b;
        2'b01: result = a - b;
        2'b10: result = a & b;
        2'b11: result = a | b;
    endcase
end

endmodule
