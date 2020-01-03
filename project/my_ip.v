// sample.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module sample (
		input  wire [7:0]   avs_s0_address,     // avs_s0.address
		input  wire         avs_s0_read,        //       .read
		output reg  [127:0] avs_s0_readdata,    //       .readdata
		input  wire         avs_s0_write,       //       .write
		input  wire [127:0] avs_s0_writedata,   //       .writedata
		output wire         avs_s0_waitrequest, //       .waitrequest
		input  wire         clock_clk,          //  clock.clk
		input  wire         reset_reset,        //  reset.reset
        output reg  [7:0]   led                 // led output
    );

    always @(posedge clock_clk)
    begin
        avs_s0_readdata <= {120'b0, led};
    end

    always @(posedge clock_clk)
    begin
        if(reset_reset)
            led <= 8'b0;
        else if(avs_s0_write)
            led <= avs_s0_writedata[7:0];
        else
            led <= led;
    end
endmodule
