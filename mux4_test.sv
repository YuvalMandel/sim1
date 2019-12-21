// 4->1 multiplexer test bench template
module mux4_test;

	logic d0;
	logic d1;
	logic d2;
	logic d3;
	logic[1:0] sel;
	logic z;
	
	parameter nand_tpd = 10;
	
	mux4 #(
		.nand_tpd(nand_tpd)
	) mux4_instance (
		.d0(d0),
		.d1(d1),
		.d2(d2),
		.d3(d3),
		.sel(sel),
		.z(z)
	);
	
	initial begin
	
		// set all parameters for shortest time.
		d0 = 1'b0;
		d1 = 1'b0;
		d2 = 1'b1;
		d3 = 1'b1;
		sel = 2'b01;
		
		// change for shortest time.
		#100ns;
		sel[1] = 1'b1;
		
		// return to original.
		#100ns;
		// set all parameters for longest time.
		d0 = 1'b0;
		d1 = 1'b0;
		d2 = 1'b1;
		d3 = 1'b0;
		sel = 2'b11;
		
		// change for longest time.
		#100ns;
		sel[0] = 1'b0;
		
	end


endmodule
