// test/alu_tb.v
`timescale 1ps / 1ps

module alu_tb;

reg [3:0] a, b;
reg [1:0] sel;
wire [3:0] result;

alu uut (
    .a(a), .b(b), .sel(sel), .result(result)
);

initial begin
    $dumpfile("alu_test.vcd");
    $dumpvars(0, alu_tb);

    a = 4'b0101; b = 4'b0011;

    sel = 2'b00; #2; // ADD
    sel = 2'b01; #2; // SUB
    sel = 2'b10; #2; // AND
    sel = 2'b11; #2; // OR

    $finish;
end

endmodule
