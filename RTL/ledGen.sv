`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Clement Hathaway
// 
// Create Date: 02/13/2019 09:08:28 AM
// Design Name: 
// Module Name: columnFiller
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

module ledGen(input clk, enable, sclk,
			  input [3:0] rowSelected,
			  output [2:0] LED);

	always_ff @(posedge clk) begin
		case(rowSelected)
			4'd0 : LED <= 100; // Red
			4'd1 : LED <= 110; // Yellow (R+G)
			4'd2 : LED <= 011; // Cyan   (G+B)
			4'd3 : LED <= 001; // Blue
			4'd4 : LED <= 101; // Purple (R+B)
			4'd5 : LED <= 000; // Black
			4'd6 : LED <= 000; // Black
			4'd7 : LED <= 000; // Black
			4'd8 : LED <= 100;
			4'd9 : LED <= 110;
			4'd10: LED <= 011;
			4'd11: LED <= 001;
			4'd12: LED <= 101;
			4'd13: LED <= 111; // White
			4'd14: LED <= 111; // White
			4'd15: LED <= 111; // White
		endcase         //RGB
	end
	

endmodule