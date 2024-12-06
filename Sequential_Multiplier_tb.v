`timescale 1ns / 1ps

module Sequential_Multiplier_tb();
    reg clk, reset, start;
    reg [3:0] a, b;
    wire [7:0] product;
    wire done;
    
    Sequential_Multiplier uut (clk,reset,start,a,b,product,done);

    initial clk = 0;
    always #5 clk = ~clk; 
    
    initial begin
       
        reset = 1;
        start = 0;
        a = 4'b0;
        b = 4'b0;

        #10 reset = 0; // Release reset

        // 3 * 2
        a = 4'b0011; 
        b = 4'b0010; 
        start = 1;
        #10 start = 0; 

        wait(done); 
        // 7 * 4
        #20;
        a = 4'b0111; 
        b = 4'b0100; 
        start = 1;
        #10 start = 0; 

        wait(done); 
        #20 $finish; 
    end
endmodule


