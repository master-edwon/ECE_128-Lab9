`timescale 1ns / 1ps

module Combinational_Multiplier_tb();

    reg [3:0] a, b;
    wire [7:0] product;

    // Instantiate the multiplier  
    Combinational_Multiplier uut (a,b,product);
    
    // Test sequence
    initial begin
        // Test case 1: Multiply 3 * 2
        a = 4'b0011; // 3
        b = 4'b0010; // 2
        #10;

        // Test case 2: Multiply 7 * 4
        a = 4'b0111; // 7
        b = 4'b0100; // 4
        #10;
        $display("Test 2: %d * %d = %d", a, b, product);

        // Test case 3: Multiply 15 * 15
        a = 4'b1111; // 15
        b = 4'b1111; // 15

        #10 $finish; // End simulation
    end
endmodule


