// 64-bit ALU test bench template
module alu64bit_test;

	logic [63:0] a; // Input bit a
	logic [63:0] b; // Input bit b
	logic cin; // Carry in
	logic [1:0] op; // Operation
	logic [63:0] s; // Output S
	logic cout; // Carry out
	
	parameter nand_tpd = 0;
	parameter or_tpd = 0;
	parameter xnor_tpd = 0;

	alu64bit #(
		.nand_tpd(nand_tpd),
		.or_tpd(or_tpd),
		.xnor_tpd(xnor_tpd)
	) alu64bit_instance (
		.a(a),
		.b(b),
		.cin(cin),
		.op(op),
		.s(s),
		.cout(cout)
	);
	
	initial begin

		// set all parameters for shortest time.
		a = 64'b0;
		b = 64'b0;
		cin = 1'b0;
		op = 2'b00;
		
		#40ns;
		
		// check xor
		op = 2'b00;
		cin = 1'b0;
		a = {{32{1'b0}}, {32{1'b1}}};
		b = {{16{1'b0}}, {16{1'b1}}, {16{1'b0}}, {16{1'b1}}};
		
		#40ns;
		cin = 1'b1;
		
		#40ns;
		

	end;

endmodule
