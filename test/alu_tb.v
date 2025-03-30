// test/alu_tb.v
`timescale 1ps / 1ps

module alu_tb;

reg [3:0] a, b;
reg [2:0] sel;
wire [3:0] result;

alu uut (
    .a(a), .b(b), .sel(sel), .result(result)
);

initial begin
    $dumpfile("alu_test1.vcd");
    $dumpvars(0, alu_tb);

    a = 4'b0110; b = 4'b0001;

    sel = 3'b000; #2; // ADD
    sel = 3'b001; #2; // SUB
    sel = 3'b010; #2; // AND
    sel = 3'b011; #2; // OR
    sel = 3'b100; #2; // XOR
    sel = 3'b101; #2; // SLT
    sel = 3'b110; #2; // default case
 
    $finish;
end

endmodule
