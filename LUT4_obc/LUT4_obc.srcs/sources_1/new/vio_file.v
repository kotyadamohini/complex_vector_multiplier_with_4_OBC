`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 11:20:04 AM
// Design Name: 
// Module Name: vio_file
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


module vio_file(
    input clk
    );
    wire [7:0]xre1,xre2,xre3,xre4,xim1,xim2,xim3,xim4;
    wire [31:0]are1,are2,are3,are4,aim1,aim2,aim3,aim4,yre,yim;
    complex_multiplier c1(clk,xre1,xre2,xre3,xre4,xim1,xim2,xim3,xim4,are1,are2,are3,are4,aim1,aim2,aim3,aim4,yre,yim);
    vio_0 complex_multiplier (
      .clk(clk),                  // input wire clk
      .probe_in0(yre),      // input wire [31 : 0] probe_in0
      .probe_in1(yim),      // input wire [31 : 0] probe_in1
      .probe_out0(xre1),    // output wire [7 : 0] probe_out0
      .probe_out1(xre2),    // output wire [7 : 0] probe_out1
      .probe_out2(xre3),    // output wire [7 : 0] probe_out2
      .probe_out3(xre4),    // output wire [7 : 0] probe_out3
      .probe_out4(xim1),    // output wire [7 : 0] probe_out4
      .probe_out5(xim2),    // output wire [7 : 0] probe_out5
      .probe_out6(xim3),    // output wire [7 : 0] probe_out6
      .probe_out7(xim4),    // output wire [7 : 0] probe_out7
      .probe_out8(are1),    // output wire [31 : 0] probe_out8
      .probe_out9(are2),    // output wire [31 : 0] probe_out9
      .probe_out10(are3),  // output wire [31 : 0] probe_out10
      .probe_out11(are4),  // output wire [31 : 0] probe_out11
      .probe_out12(aim1),  // output wire [31 : 0] probe_out12
      .probe_out13(aim2),  // output wire [31 : 0] probe_out13
      .probe_out14(aim3),  // output wire [31 : 0] probe_out14
      .probe_out15(aim4)  // output wire [31 : 0] probe_out15
    );
endmodule
