`timescale 1ns / 1ps

module Combinational_Multiplier(
    input [3:0] a,  // 4-bit multiplicand
    input [3:0] b,  // 4-bit multiplier
    output [7:0] product // 8-bit product
);
    wire [7:0] partial0, partial1, partial2, partial3;

    // Generate partial products
    assign partial0 = b[0] ? {4'b0, a} : 8'b0;      // Least significant bit
    assign partial1 = b[1] ? {3'b0, a, 1'b0} : 8'b0; // Shifted by 1
    assign partial2 = b[2] ? {2'b0, a, 2'b0} : 8'b0; // Shifted by 2
    assign partial3 = b[3] ? {1'b0, a, 3'b0} : 8'b0; // Shifted by 3

    // Sum up all partial products
    assign product = partial0 + partial1 + partial2 + partial3;
endmodule

