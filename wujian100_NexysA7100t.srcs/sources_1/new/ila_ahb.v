`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/02/28 22:20:15
// Design Name: 
// Module Name: ila_ahb
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


module ila_ahb(
  haddr,
  hclk,
  hprot,
  hrdata,
  hready,
  hresp,
  hrst_b,
  hsel,
  hsize,
  htrans,
  hwdata,
  hwrite,
  intr,
  CLK100MHZ
);
input   [31:0]  haddr;    
input           hclk;      
input   [3 :0]  hprot;        
input           hrst_b;       
input           hsel;      
input   [2 :0]  hsize;       
input   [1 :0]  htrans;     
input   [31:0]  hwdata;   
input           hwrite;   
output  [31:0]  hrdata;    
output          hready;  
output  [1 :0]  hresp;    
output		intr;    
input       CLK100MHZ;
wire  [31:0]  hrdata;       
wire          hready;  
wire  [1 :0]  hresp;    
wire          intr;
assign hrdata[31:0] = 32'b0;       
assign hready = 1'b1;  
assign hresp[1:0] = 2'b0;    
assign intr = 1'b0;     

reg    [31:0]  haddr_r;    
reg            hclk_r;              
reg            hsel_r;      
reg    [2 :0]  hsize_r;       
reg    [1 :0]  htrans_r;     
reg    [31:0]  hwdata_r;   
reg            hwrite_r;   
reg    [31:0]  hrdata_r;    
reg            hready_r;  

always @(posedge CLK100MHZ) begin
    haddr_r <= haddr;    
    hclk_r <= hclk;              
    hsel_r <= hsel;      
    hsize_r <= hsize;       
    htrans_r <= htrans;     
    hwdata_r <= hwdata;   
    hwrite_r <= hwrite;   
    hrdata_r <= hrdata;    
    hready_r <= hready; 
end

ila_1 x_ila_1(
    CLK100MHZ,
    hclk_r,            
    haddr_r,
    hsel_r,   
    hsize_r,      
    htrans_r,
    hwdata_r,   
    hwrite_r,   
    hrdata_r,    
    hready_r  
);

endmodule

