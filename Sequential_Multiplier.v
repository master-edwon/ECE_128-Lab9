`timescale 1ns / 1ps

module Sequential_Multiplier (
    input clk,
    input reset,
    input start,
    input [3:0] a,  // Multiplicand
    input [3:0] b,  // Multiplier
    output reg [7:0] product,
    output reg done
);
    reg [3:0] multiplicand, multiplier;
    reg [7:0] partial_sum;
    reg [2:0] count; 
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            multiplicand <= 4'b0;
            multiplier <= 4'b0;
            partial_sum <= 8'b0;
            count <= 3'b0;
            product <= 8'b0;
            done <= 1'b0;
        end else if (start) begin
            // initialize values
            multiplicand <= a;
            multiplier <= b;
            partial_sum <= 8'b0;
            count <= 3'b0;
            done <= 1'b0;
        end else if (count < 4) begin
            if (multiplier[0]) begin
                partial_sum <= partial_sum + (multiplicand << count);
            end
            multiplier <= multiplier >> 1;
            count <= count + 1;         
        end else if (count == 4) begin
            product <= partial_sum;
            done <= 1'b1;
        end
    end
endmodule


