// Full Adder/Subtractor test bench template
module fas_test;

	logic a; // Input bit a
	logic b; // Input bit b
	logic cin; // Carry in
	logic a_ns; // A_nS (add/not subtract) control
	logic s; // Output S
	logic cout; // Carry out
	
	logic[1:0] result;

	parameter nand_tpd = 10;
	parameter xnor_tpd = 9;
	parameter or_tpd = 8;

	fas #(
		.nand_tpd(nand_tpd),
		.or_tpd(or_tpd),
		.xnor_tpd(xnor_tpd)
	) fas_instance (
		.a(a),
		.b(b),
		.cin(cin),
		.a_ns(a_ns),
		.s(s),
		.cout(cout)
	);
	
	always_comb begin
		result = {cout, s};
	end

	initial begin

		// set all parameters for shortest time.
		a = 1'b1;
		b = 1'b0;
		cin = 1'b0;
		a_ns = 1'b0;
		
		#100ns;
		
		// chane a to 0
		a = 1'b0;
		
		#100ns;
		
		// set all parameters for shortest time.
		a = 1'b0;
		b = 1'b0;
		cin = 1'b1;
		a_ns = 1'b1;
		
		#100ns;
		
		// chane a to 1
		a = 1'b1;
		
		#100ns;
		
		//
	
//		for(int i = 0; i < 2; i++) begin
//			
//			a_ns <= !a_ns;
//		
//			for(int i = 0; i < 2; i++) begin
//		
//				cin <= !cin;
//				
//				for(int i = 0; i < 2; i++) begin
//		
//					b <= !b;
//					
//					for(int i = 0; i < 2; i++) begin
//		
//						a <= !a;
//						#40ns;
//		
//					end
//		
//				end
//		
//			end
//		
//		end

	end;

endmodule
