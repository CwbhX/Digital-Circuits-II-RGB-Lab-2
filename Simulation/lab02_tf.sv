`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2019 09:19:44 AM
// Design Name: 
// Module Name: lab02_tf
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module lab02_tf();
    // Inputs
    logic clk;
    logic reset;
    
    // Outputs
    logic [2:0] LED_Top;
    logic [2:0] LED_Bottom;
	logic [2:0] row_select;
	logic sclk, latch, blank;

    
    
    initial
        forever begin
            clk = 0; #10; clk = 1; #10;
        end
    
    top uut(.clk(clk), .reset(reset),
               .sclk(sclk),
               .latch(latch),
               .blank(blank),
               .LED_Top(LED_Top),
			   .LED_Bottom(LED_Bottom),
			   .row_select(row_select));
    
    initial begin
        reset = 1;
        #100;
        reset = 0;
        repeat (3000) @(posedge clk); #1;
        $stop;
    end
    
endmodule
