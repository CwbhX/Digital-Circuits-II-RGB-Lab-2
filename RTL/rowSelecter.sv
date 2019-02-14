`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/013/2019 08:17:16 AM
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

module rowSelecter(input clk, delayed_enable_300ns, isFilled,
				   output [2:0] selectedRow);
	
	logic [2:0] rowCount;
	
	binaryCounter counter(.clk(clk), .reset(countReset), .enable(countEnable), .out(rowCount));
	
	
	always_ff @(posedge clk) begin
		case(rowCount)
			3'd0 : selectedRow <= 3'd0;
			3'd1 : selectedrow <= 3'd1;
			3'd2 : selectedRow <= 3'd2;
			3'd3 : selectedRow <= 3'd3;
			3'd4 : selectedRow <= 3'd4;
			3'd5 : selectedRow <= 3'd5;
			3'd6 : selectedRow <= 3'd6;
			3'd7 : selectedRow <= 3'd7;
		endcase
	end

endmodule