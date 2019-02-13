`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2019 08:23:26 AM
// Design Name: 
// Module Name: binaryPulser
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Uses a BinaryCounter to generate a 1 clock cycle long pulse every n clock cycles
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module binaryPulser(
    input logic clk, reset,   // clk and reset
    output logic out         // output pulse
);

    parameter TIME = 300;
    
    logic [$clog2(TIME) - 1 : 0] count;
    
    binaryCounter #(TIME) counter(clk, reset, count);
    
    assign out = (count == TIME - 1);

endmodule