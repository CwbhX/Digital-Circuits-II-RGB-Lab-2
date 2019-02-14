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
              output [2:0] LED1, LED2,
              output [2:0] rowSelect,
              output blank, latch, sclk);
			  
		logic [2:0] generatedLED1;
		logic [2:0] generatedLED2;
		logic [3:0] selected
		logic delayed_enable_300ns;
		logic isFilled;
		
        delay_enb #(.DELAY_NS(300)) enable_300ns(.clk(clk), .reset(1'b0), .clr(1'b0) .enb_out(delayed_enable_300ns)); // Gives a pulse every 300ns for a duration of one clock cycle
        ledGen ledGen(.clk(clk), .sclk(sclk), .rowSelected(rowSelect), .LED1(generatedLED1), .LED2(generatedLED2); // Gives LED values for top and bottom depending on the row we will use
        columnFiller columnFiller(.clk(clk), .delayed_enable_300ns(delayed_enable_300ns), .enable(blank), .colour1(generatedLED1), .colour2(generatedLED2),
								  .LED1(LED1), .LED2(LED2), .sclk(sclk), .filled(isFilled));
		
		
		
		
endmodule
