`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2019 08:17:16 AM
// Design Name: 
// Module Name: ledTop
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
module ledTop(input clk,
              output [2:0] LEDs1, LEDs2,
              output [2:0] rowSelect,
              output blank, latch, sclk);
			  
		logic [2:0] generatedLED;
		
        delay_enb #(.DELAY_NS(300)) enable_300ns(.clk(clk), .reset(1'b0), .clr(1'b0) .enb_out(sclk));
        ledGen ledGen(.clk(clk), .sclk(sclk), .rowSelected(rowSelect), .LED(generatedLED));
        

endmodule
