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
			  output logic [2:0] LED1, LED2);

	always_ff @(posedge clk) begin
		case(rowSelected)
			4'd0 : begin LED1 <= 100; LED2 <= 100; end// Red
			4'd1 : begin LED1 <= 110; LED2 <= 110; end // Yellow (R+G)
			4'd2 : begin LED1 <= 011; LED2 <= 011; end // Cyan   (G+B)
			4'd3 : begin LED1 <= 001; LED2 <= 001; end // Blue
			4'd4 : begin LED1 <= 101; LED2 <= 101; end // Purple (R+B)
			4'd5 : begin LED1 <= 000; LED2 <= 111; end // Black / White
			4'd6 : begin LED1 <= 000; LED2 <= 111; end // Black / White
			4'd7 : begin LED1 <= 000; LED2 <= 111; end // Black / White
			default : begin LED1 <= 010; LED2 <= 010; end
			// 4'd8 : LED <= 100;
			// 4'd9 : LED <= 110;
			// 4'd10: LED <= 011;
			// 4'd11: LED <= 001;
			// 4'd12: LED <= 101;
			// 4'd13: LED <= 111; // White
			// 4'd14: LED <= 111; // White
			// 4'd15: LED <= 111; // White
		endcase         //RGB
	end
	

endmodule