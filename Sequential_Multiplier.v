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
    reg [2:0] count; // Counter to track steps (0 to 3 for 4-bit multiplication)

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            multiplicand <= 4'b0;
            multiplier <= 4'b0;
            partial_sum <= 8'b0;
            count <= 3'b0;
            product <= 8'b0;
            done <= 1'b0;
        end else if (start) begin
            // On start, initialize values
            multiplicand <= a;
            multiplier <= b;
            partial_sum <= 8'b0;
            count <= 3'b0;
            done <= 1'b0;
        end else if (count < 4) begin
            // Perform shift-and-add multiplication
            if (multiplier[0]) begin
                partial_sum <= partial_sum + (multiplicand << count);
            end
            multiplier <= multiplier >> 1; // Shift multiplier right
            count <= count + 1;           // Increment step count
        end else if (count == 4) begin
            // Finalize product and signal done
            product <= partial_sum;
            done <= 1'b1;
        end
    end
endmodule


