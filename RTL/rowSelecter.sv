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
				   output logic [2:0] selectedRow);
	
	logic [2:0] rowCount;
	logic countReset;
	logic countEnable;
	
	binaryCounter #(.MAXVAL(8)) counter(.clk(clk), .reset(countReset), .enable(countEnable), .out(rowCount)); // Counter
	
	
	always_ff @(posedge clk) begin                        // On every clock cycle
		if (countReset) countReset <= 0;                  // If we we reset the counter, this time un-reset? it
		if (countEnable) countEnable <= 0;                // If counter was enabled to count once, disable to prevent multiple counting | worried about it failing to count before hitting this statement
	
		if (isFilled && delayed_enable_300ns)             // If the columns are filled and we have waited 300ns (I think this is right...)
			begin 
				if (rowCount != 3'd7) countEnable <= 1;   // If we aren't on the last row, increase the count by one by enabling the counter for a clock cycle
				else begin
					countEnable <= 0;                     // If we are on the last row don't count
					countReset <= 1;                      // If we are on the last row reset the counter back to zero 
				end
			end
		else countEnable <= 0;                            // If we are not filled and/or the 300ns delay enable is not enabled, don't increase the row count
		
		// Select the row
		case(rowCount)
			3'd0 : selectedRow <= 3'd0;
			3'd1 : selectedRow <= 3'd1;
			3'd2 : selectedRow <= 3'd2;
			3'd3 : selectedRow <= 3'd3;
			3'd4 : selectedRow <= 3'd4;
			3'd5 : selectedRow <= 3'd5;
			3'd6 : selectedRow <= 3'd6;
			3'd7 : selectedRow <= 3'd7;
			default: selectedRow <= 3'd0;
		endcase
	end

endmodule