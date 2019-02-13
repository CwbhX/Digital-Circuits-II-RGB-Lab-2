`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Clement Hathaway
// 
// Create Date: 02/07/2019 09:08:28 AM
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


module columnFiller(input clk, delayed_enable_3Mhz, enable, input logic [2:0] colour1, colour2, output logic [2:0] LED1, LED2, output logic sclk, filled);
    logic [4:0] count;
    
    logic countReset;
    logic countEnable;
    
    binaryCounter counter(.clk(clk), .reset(countReset), .enable(countEnable), .out(count));
    
    
    always_ff @ (posedge clk) begin         // For every clock cycle of the FPGA (10ns)
        if (countEnable) countEnable <=0;  // Turn off the count after 1 cycle from when it was turned on to make sure we only count once
        if (&enable) countReset <= 1;     // Reset the counter if we are not enabled
        else countReset <= 0;
        
        if (enable) begin           // If this module is enabled
            LED1 <= colour1;        // 
            LED2 <= colour2;        // Assign LED outputs to the colour inputs
            
            if (delayed_enable_3Mhz) begin     // If it is time to cycle the shift register on the matrix (happens every 333ns) -- CHANGE TO DELAY ENABLE
                if (&sclk) begin    // If it was low below, make it high for this 333ns and count once
                
                    sclk <= 1;          // Shift over one on the matrix
                    countEnable <= 1;   // Increase the counter for this one clock cycle - Will I need another clock cycle to count 1? I think so, therefore put turn off after next cycle
                end
                else begin
                    sclk <= 0;         // Turn off the clock after another 333ns if it was high before for 333ns and do NOT count
                end
            end
        end
        
        if (count <= 5'b11111) filled <= 1; // If we have counted to 32 (e.g. filled the row) set the filled output to true
        else filled <= 0;                   // If we have not filled the row, do not set filled high
        
    end

endmodule
