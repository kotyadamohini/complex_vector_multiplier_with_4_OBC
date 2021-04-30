`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 10:48:26 AM
// Design Name: 
// Module Name: compiex_multiplier
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


module complex_multiplier(clk,xre1,xre2,xre3,xre4,xim1,xim2,xim3,xim4,are1,are2,are3,are4,aim1,aim2,aim3,aim4,yre,yim);
input clk;
input [7:0]xre1,xre2,xre3,xre4,xim1,xim2,xim3,xim4;
input [31:0]are1,are2,are3,are4,aim1,aim2,aim3,aim4;
output [31:0]yre,yim;
wire [31:0]arxr,aixi,xrai,xiar;
obc d1(clk,xre1,xre2,xre3,xre4,are1,are2,are3,are4,arxr);
obc d2(clk,xim1,xim2,xim3,xim4,aim1,aim2,aim3,aim4,aixi);
obc d3(clk,xre1,xre2,xre3,xre4,aim1,aim2,aim3,aim4,xrai);
obc d4(clk,xim1,xim2,xim3,xim4,are1,are2,are3,are4,xiar);
assign yre=(arxr-aixi);
assign yim=(xrai+xiar);
endmodule
