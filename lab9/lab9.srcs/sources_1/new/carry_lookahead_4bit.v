`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2020 01:56:22 PM
// Design Name: 
// Module Name: carry_lookahead_4bit
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

//THIS VERSION OF THE CODE INCLUDES NO DELAYS
/*This module describes the Carry Generate/Propagate Unit for 4 bit carry lookahead addition*/
module generate_propagate_unit(G, P, X, Y);

    /*ports are wires as we will use dataflow*/
    output wire [3:0] G, P;
    input wire [3:0] X, Y;
    assign G = X & Y;
    assign P = X ^ Y;
    
endmodule

/*This module describes the 4 bit carry lookahead unit for a carry lookahead adder*/
module carry_lookahead_unit(C, G, P, C0);

    /*ports are wires because we will use dataflow*/
    output wire [4:1] C; //C4, C3, C2, C1
    input wire [3:0] G, P; //generates and propagates
    input wire C0; //input carry
    
    //Below we assign each C component different values progressively with a 4ns delay
    assign C[1] = G[0] | (P[0] & C0);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C0);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C0);
    assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C0);
    
endmodule
    
/*This module describes the 4 bit summation unit for a carry lookahead adder*/
module summation_unit(S, P, C);

    /*ports are wires because we will use dataflow*/
    output wire [3:0] S; //sum vector
    input wire [3:0] P, C; //propagate and carry vectors
    assign S = P ^ C; //Assign S with 2ns delay to P to the C
    
endmodule

module carry_lookahead_4bit(Cout, S, X, Y, Cin);

    /*ports are wires as we will use structural*/
    output wire Cout; //C_4 for a 4 bit adder
    output wire [3:0] S; //final 4 bit sum vector
    input wire [3:0] X, Y; //the 4 bit addends
    input wire Cin; //input carry!
    
    //routing wires
    wire[3:0] G;
    wire[3:0] P;
    wire[4:0] C;
    assign C[0] = Cin;
    assign Cout = C[4];
    
    //calling upon previously defined modules to function
    generate_propagate_unit GPU0(G, P, X, Y);
    summation_unit SU0(S,P,C[3:0]);
    carry_lookahead_unit CLU0(C[4:1], G, P, Cin);

endmodule