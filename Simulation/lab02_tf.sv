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
    logic [2:0] generatedLED1;
    logic [2:0] generatedLED2;
	logic [2:0] rowSelect;
	logic blank, latch;

    
    
    initial
        forever begin
            clk = 0; #10; clk = 1; #10;
        end
    
    ledTop uut(.clk(clk), .reset(reset),
               .LED1(generatedLED1),
               .LED2(generatedLED2),
               .rowSelect(rowSelect),
               .blank(blank),
               .latch(latch),
               .sclk(sclk));
    
    initial begin
        reset = 1;
        #100;
        reset = 0;
    end
    
endmodule
