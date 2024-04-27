`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 08:47:56 PM
// Design Name: 
// Module Name: carry_lookahead_16bit
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

module summation_unit(S, P, C);

    /*ports are wires because we will use dataflow*/
    output wire [15:0] S; //sum vector
    input wire [15:0] P, C; //propagate and carry vectors
    assign S = P ^ C; //Assign S with 2ns delay to P to the C
    
endmodule

module generate_propagate_unit(G, P, X, Y);

    /*ports are wires as we will use dataflow*/
    output wire [15:0] G, P;
    input wire [15:0] X, Y;
    assign G = X & Y;
    assign P = X ^ Y;
    
endmodule

module block_carry_lookahead_unit(G_star, P_star, C, G, P, C0);

    /*ports are wires because we will use dataflow*/
    output wire G_star, P_star; //block generate and propagate
    output wire [3:1] C; //C3, C2, C1
    input wire [3:0] G, P; //generates and propagates
    input wire C0; //input carry
    
    //wiring of the schematic
    assign C[1] = G[0] | (P[0] & C0);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C0);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C0);
    assign G_star = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
    assign P_star = P[3] & P[2] & P[1] & P[0];
    
endmodule

module carry_lookahead_16bit(Cout, S, X, Y, Cin);

    /*ports are wires as we will use structural*/
    output wire Cout; //C_16 for a 16 bit adder
    output wire [15:0] S; //final 16 bit sum vector
    input wire [15:0] X, Y; //the 16 bit addends
    input wire Cin; //input carry!
    
    /*intermediate nets*/
    wire [16:0] C; //5 bit carry vector
    wire [15:0] P, G; //generate and propagate vectors
    wire [3:0] P_star, G_star; //block gens and props
    
    /*hook up input and output carry*/
    assign C[0] = Cin;
    assign Cout = C[16];
    
    /*instantiate sub modules*/
    generate_propagate_unit GPU(G, P, X, Y);
    
    /*for the more complicated module instantiations you will probably find this form easier to read*/
    block_carry_lookahead_unit BCLAU0(
        /*since we are being explicit with our ports, the order does not matter!*/
        .G_star (G_star[0]),
        .P_star (P_star[0]),
        .C (C[3:1]),
        .G (G[3:0]), 
        .P (P[3:0]),
        .C0 (C[0])
    );// a little more verbose, but much easier to follow!
    
    block_carry_lookahead_unit BCLAU1(
        //THIS BCLAU MODULE AND THE TWO FOLLOWING BOTH HAVE BEEN MODIFIED TO MATCH THE INPUTS OF OUTPUTS OF THE DIFFERENT BCLAUS IN FIGURE 2
        /*since we are being explicit with our ports, the order does not matter!*/
        .G_star (G_star[1]),
        .P_star (P_star[1]),
        .C (C[7:5]),
        .G (G[7:4]),
        .P (P[7:4]),
        .C0 (C[4])
    );// a little more verbose, but much easier to follow!
    
    block_carry_lookahead_unit BCLAU2(
        /*since we are being explicit with our ports, the order does not matter!*/
        .G_star (G_star[2]),
        .P_star (P_star[2]),
        .C (C[11:9]),
        .G (G[11:8]),
        .P (P[11:8]),
        .C0 (C[8])
    );// a little more verbose, but much easier to follow!
    
    block_carry_lookahead_unit BCLAU3(
        /*since we are being explicit with our ports, the order does not matter!*/
        .G_star (G_star[3]),
        .P_star (P_star[3]),
        .C (C[15:13]),
        .G (G[15:12]),
        .P (P[15:12]),
        .C0 (C[12])
    );// a little more verbose, but much easier to follow!
    
    /*we will use the same form for this one too*/
    carry_lookahead_unit CLAU(
        /*okay s0 we will need to use some fancy concatenation syntax to create the carry vector connected to this module...*/
        .C ({C[16], C[12], C[8], C[4]}),
        .G (G_star [3:0]),
        .P (P_star [3:0]),
        .C0 (C[0])
        
    );
    
    summation_unit SU(
    .S (S[15:0]),
    .P (P[15:0]),
    .C (C[15:0]));
    
endmodule
