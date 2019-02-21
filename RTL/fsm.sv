`timescale 1ns / 1ps

module fsm(input logic clk, reset, delay_enb, col_count, row_filled,
		  output logic col_counter_enb, row_counter_enb, sclk, blank, latch);
		
	typedef enum logic[5:0] {IDLE, SCLK_LOW, SCLK_HIGH, ROWS_FILLED, BLANK, LATCH} matrix_trans_table;
	matrix_trans_table matrix_trans_state; // Instantiate our enumeration as a record of our state
	
	always_ff @(posedge clk) begin
		if(reset) begin
			matrix_trans_state <= IDLE;
			sclk <=  0;
			blank <= 0;
			latch <= 0;
			col_counter_enb <= 0;
			row_counter_enb <= 0;
		end
		else begin
			case(matrix_trans_state)
				IDLE: begin
					blank <= 0;
					latch <= 0;
					sclk <=  0;
					col_counter_enb <= 0;
					row_counter_enb <= 0;
					
					if(delay_enb && !row_filled) matrix_trans_state <= SCLK_LOW;
					else matrix_trans_state <= IDLE;
				end
				SCLK_LOW: begin
					blank <= 0;
					latch <= 0;
					sclk <=  0;
					col_counter_enb <= 0;
					row_counter_enb <= 0;
					
					if(delay_enb) matrix_trans_state <= SCLK_HIGH; // Move state to SCLK_HIGH if delay is enabled
					else matrix_trans_state <= SCLK_LOW;           // Stay in SCLK_LOW state whilst waiting for delay
				end
				SCLK_HIGH: begin
					blank <= 0;
					latch <= 0;
					sclk <=  1;
					col_counter_enb <= 0;                          // Turn off Column count so it only counts once
					row_counter_enb <= 0;
					
					if(delay_enb && !row_filled) begin
						col_counter_enb <= 1;                      // Increase the col_count by 1
						matrix_trans_state <= SCLK_LOW;            // Move state to SCLK_LOW - pulsing the sclk
						
					end else if(delay_enb && row_filled) begin
						col_counter_enb <= 1;                      // Overflow col_count to 0
						matrix_trans_state <= ROWS_FILLED;         // Move state to ROWS_FILLED
						
					end else matrix_trans_state <= SCLK_HIGH;      // Stay in SCLK_HIGH state whilst waiting for delay
				end
				ROWS_FILLED: begin
					blank <= 0;
					latch <= 0;
					sclk <=  0;
					col_counter_enb <= 0;                          // Turn off Column count so it only counts once
					row_counter_enb <= 0;
					
					matrix_trans_state <= BLANK;                   // Move state to BLANK after one clock cycle
				end
				BLANK: begin
					blank <= 1;                                    // Enable the BLANK signal
					latch <= 0;
					sclk <=  0;
					col_counter_enb <= 0;
					row_counter_enb <= 0;
					
					if(delay_enb) begin
						row_counter_enb <= 1;                      // Increase row counter by 1 - This will also let the matrix display the correct row when blank comes low - Should also overflow eventually which is what we want
						matrix_trans_state <= LATCH;               // Move state to LATCH
					end
					else matrix_trans_state <= BLANK;              // Stay in BLANK state whilst waiting for delay
				end
				LATCH: begin
					blank <= 1;
					latch <= 1;
					sclk <= 0;
					col_counter_enb <= 0;
					row_counter_enb <= 0;                          // Disable the row count so it only counts once
					
					if(delay_enb) begin
						latch <= 0;                                // Disable latch before blank is disabled in IDLE
						matrix_trans_state <= IDLE;                // Move state to IDLE
					end
					else matrix_trans_state <= LATCH;              // Stay in LATCH state whilst waiting for delay
				end
				
				default: matrix_trans_state <= IDLE;
			endcase
		end
	end
endmodule