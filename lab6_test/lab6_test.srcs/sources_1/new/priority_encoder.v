`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2021 08:41:38 AM
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder(
    input wire [3:0] W,
    output wire zero,
    output reg [1:0] Y
    );
    /*
    wire [3:0] I;
    assign I[0] = ~W[3]&~W[2]&~W[1]&W[0];
    assign I[1] = ~W[3]&~W[2]&W[1];
    assign I[2] = ~W[3]&W[2];
    assign I[3] = W[3];
    
    assign zero = (W == 4'b0000); //a zero test! notice use of == rather than =
    /*behavioral portion*/
    always@(W)
        begin //not necessary because case is single clause but looks better
            casex(W)
                4'b0001: Y = 2'b00;
                4'b001X: Y = 2'b01;
                4'b01XX: Y = 2'b10;
                4'b1XXX: Y = 2'b11;
                default: Y = 2'bXX;
            endcase
        end
    /*can mix levels of abstraction!*/
    
    //assign zero = (W == 4'b0000); //a zero test! notice use of == rather than =
    
    /*behavioral portion*/
   /* always@(W)
        begin //not necessary because case is single clause but looks better
            casex(W)
                4'b0001: Y = 2'b00;
                4'b0010: Y = 2'b01;
                4'b0100: Y = 2'b10;
                4'b1000: Y = 2'b11;
                default: Y = 2'bXX;
            endcase
        end*/
endmodule
