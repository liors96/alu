module alu (
    input  [3:0] a,
    input  [3:0] b,
    input  [2:0] sel,
    output reg [3:0] result
);

// Combinatorial Logic

always @(*) begin
    case (sel)
        3'b000: result = a + b; // ADD
        3'b001: result = a - b; // SUB
        3'b010: result = a & b; // OR
        3'b011: result = a | b; // AND
        3'b100: result = a ^ b; // XOR
        3'b101: result = a < b; // SLT
        default: result = 4'b0000; // default: in case of 3'b110 and 3'b111 -> result equals 0 
    endcase
end

endmodule
