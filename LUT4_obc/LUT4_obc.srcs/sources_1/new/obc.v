`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 10:49:07 AM
// Design Name: 
// Module Name: obc
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


module obc(clk,x1,x2,x3,x4,ar1,ar2,ar3,ar4,y1);
input clk;
input [7:0]x1,x2,x3,x4;
input [31:0]ar1,ar2,ar3,ar4;
output reg [31:0]y1;
reg [31:0]lout1;
reg [31:0]ACC_shift,ACC,m,off1;
reg w;
reg [2:0]i;
initial
begin 
   ACC=0;ACC_shift=0;i=0;
end 
always@(posedge clk)
    begin  
        case({x1[i]^x2[i],x1[i]^x3[i],x1[i]^x4[i]})
           0:lout1=ar1+ar2+ar3+ar4;
           1:lout1=ar1+ar2+ar3-ar4;                    
           2:lout1=ar1+ar2-ar3+ar4;       
           3:lout1=ar1+ar2-ar3-ar4;
           4:lout1=ar1-ar2+ar3+ar4;       
           5:lout1=ar1-ar2+ar3-ar4;
           6:lout1=ar1-ar2-ar3+ar4;
           7:lout1=ar1-ar2-ar3-ar4;      
       endcase
       off1=ar1+ar2+ar3+ar4;
       w=off1[31];
       off1=(off1>>8);
       off1[31:24]={8{w}};
       if(i==7)
        begin
          w=lout1[31];
          lout1=lout1>>1;
          lout1[31]=w;
          ACC=(x1[i]==1)?(ACC_shift)-lout1:(ACC_shift)-(~lout1);
          y1=ACC-off1;
          i=0;ACC=0;ACC_shift=0;
          end
        else if(i<7)
        begin
         w=lout1[31];
         lout1=lout1>>1;
         lout1[31]=w;
         ACC=(x1[i]==1)?(ACC_shift)+lout1:((ACC_shift)+(~lout1));
         w=ACC[31];
         ACC_shift=(ACC>>1);
         ACC_shift[31]=w;
         i=i+1;
         end
       end
endmodule