`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 10:57:02 AM
// Design Name: 
// Module Name: two_four_decoder
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


module two_four_decoder(input wire [1:0] W, input wire En, output reg [3:0] Y);

    always@(W)
        begin
            if(En == 1'b1)
                case(W)
                    2'b00: Y = 4'b0001;
                    2'b01: Y = 4'b0010;
                    2'b10: Y = 4'b0100;
                    2'b11: Y = 4'b1000;
                endcase
            else
                Y = 4'b0000;
        end
endmodule
