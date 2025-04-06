
module regfile (

    // ports
    input clk, 
    input write_enable,
    input [31:0] write_data,
    input [4:0] write_address,
    input [4:0] read_address1,
    input [4:0] read_address2,
    output reg [31:0] read_data1,
    output reg [31:0] read_data2
);

reg [31:0] registers [0:31];

// Initialize all registers to 0
integer i;
initial begin
    for (i = 0; i < 32; i = i + 1)
        registers[i] = 32'b0;
end

// combinational logic - read operation
always @(*) begin
    read_data1 = registers[read_address1];
    read_data2 = registers[read_address2];
end

// Synchronous logic - write operation (except for register 0 - allways equals 0)
always @(posedge clk) begin
    if (write_enable && write_address != 0)
        registers[write_address] <= write_data;
end
    
endmodule