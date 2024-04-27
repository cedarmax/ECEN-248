`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2021 08:26:17 AM
// Design Name: 
// Module Name: four_two_encoder
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


module four_two_encoder(
    input wire [3:0] W,
    output wire zero,
    output reg [1:0] Y
    );
    
    /*can mix levels of abstraction!*/
    assign zero = (W == 4'b0000); //a zero test! notice use of == rather than =
    
    /*behavioral portion*/
    always@(W)
        begin //not necessary because case is single clause but looks better
            case(W)
                4'b0001: Y = 2'b00;
                4'b0010: Y = 2'b01;
                4'b0100: Y = 2'b10; //the missing piece to the puzzle
                4'b1000: Y = 2'b11;
                default: Y = 2'bXX;
            endcase
        end
endmodule
