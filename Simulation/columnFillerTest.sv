`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2019 10:47:06 AM
// Design Name: 
// Module Name: columnFillerTest
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


module columnFillerTest();
    // Inputs
    logic clk, delayed_enable_300ns, enable, reset, clear;
    logic [2:0] colour1, colour2;
    
    // Outputs
    logic [2:0] LED1, LED2;
    logic sclk, filled;
    
    
    initial
        forever begin
            clk = 0; #10; clk = 1; #25;
        end

    delay_enb #(.DELAY_NS(300)) delayed_enable(.clk(clk), .rst(reset), .clr(clear), .enb_out(delayed_enable_300ns));
    
    columnFiller UUT(.clk(clk), .delayed_enable_300ns(delayed_enable_300ns), .enable(enable), .colour1(colour1), .colour2(colour2),
                     .LED1(LED1), .LED2(LED2), .sclk(sclk), .filled(filled));
    
    initial begin
        // Reset
        reset = 1;
        clear = 1;
        enable = 0;
        #20
        
        // Turn off reset
        reset = 0;
        clear = 0;
        enable= 1;
        
        // Start with White Colour
        colour1 = 3'b111;
        colour2 = 3'b111;
    
    end
        

endmodule
