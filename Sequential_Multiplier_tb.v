`timescale 1ns / 1ps

module Sequential_Multiplier_tb();
    reg clk, reset, start;
    reg [3:0] a, b;
    wire [7:0] product;
    wire done;

    // Instantiate the multiplier
    Sequential_Multiplier uut (clk,reset,start,a,b,product,done);

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10ns clock period

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        start = 0;
        a = 4'b0;
        b = 4'b0;

        #10 reset = 0; // Release reset

        // Test case 1: Multiply 3 * 2
        a = 4'b0011; // 3
        b = 4'b0010; // 2
        start = 1;
        #10 start = 0; // Deassert start

        wait(done); // Wait for completion
        // Test case 2: Multiply 7 * 4
        #20;
        a = 4'b0111; // 7
        b = 4'b0100; // 4
        start = 1;
        #10 start = 0; // Deassert start

        wait(done); // Wait for completion
        #20 $finish; // End simulation
    end
endmodule


