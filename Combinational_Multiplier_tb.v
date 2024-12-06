`timescale 1ns / 1ps

module Combinational_Multiplier_tb();

    reg [3:0] a, b;
    wire [7:0] product;

    Combinational_Multiplier uut (a,b,product);
    
    initial begin
        // 3 * 2
        a = 4'b0011; 
        b = 4'b0010; 
        #10;

        // Multiply 7 * 4
        a = 4'b0111; 
        b = 4'b0100; 
        #10
        // 15 * 15
        a = 4'b1111; 
        b = 4'b1111; 

        #10 $finish;
    end
endmodule


