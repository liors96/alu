// test/regfile_tb.v

`timescale 1ps / 1ps
module regfile_tb;

    // Testbench signals
    reg clk;
    reg write_enable;
    reg [31:0] write_data;
    reg [4:0] write_address;
    reg [4:0] read_address1;
    reg [4:0] read_address2;
    wire [31:0] read_data1;
    wire [31:0] read_data2;

    // Instantiate the regfile
    regfile uut (
        .clk(clk),
        .write_enable(write_enable),
        .write_data(write_data),
        .write_address(write_address),
        .read_address1(read_address1),
        .read_address2(read_address2),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #2 clk = ~clk; // 4ps clock period
    end

    initial begin
        // VCD output for GTKWave
        $dumpfile("regfile_test.vcd");
        $dumpvars(0, regfile_tb);

        // Initial values
        write_enable = 0;
        write_data = 0;
        write_address = 0;
        read_address1 = 0;
        read_address2 = 0;

        // Wait for a few cycles to enable
        #10;

        // WRITE: Store 32'ABCDEF47 into register 5
        write_enable = 1;
        write_data = 32'hABCDEF47;
        write_address = 5;

        #4; // wait for one clock cycle to disable write operation

        write_enable = 0;
        write_data = 0;

        // READ: Read back from register 5
        read_address1 = 5;
        read_address2 = 0; // read from reg[0] to show dual-read

        #4; // allow time for combinational read

        // Display results
        $display("Read from reg[5]: %h (expected: ABCDEF47)", read_data1);
        $display("Read from reg[0]: %h (expected: 00000000)", read_data2);

        #4;
        $finish;
    end

endmodule
