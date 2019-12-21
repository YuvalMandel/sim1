// 64-bit ALU test bench template
module alu1bit_test;

	logic  a; // Input bit a
	logic b; // Input bit b
	logic cin; // Carry in
	logic [1:0] op; // Operation
	logic  s; // Output S
	logic cout; // Carry out

	parameter nand_tpd = 0;
	parameter or_tpd = 0;
	parameter xnor_tpd = 0;

	alu1bit #(
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
	
		a = 64'b1;
		b = 64'b1;
		cin = 1'b1;
		op = 2'b11;

		for(int i = 0; i < 2; i++) begin

			op[1] <= !op[1];

			for(int i = 0; i < 2; i++) begin

				op[0] <= !op[0];

				for(int i = 0; i < 2; i++) begin

					cin <= !cin;

					for(int i = 0; i < 2; i++) begin

						b <= !b;

						for(int i = 0; i < 2; i++) begin

							a <= !a;
							#100ns;

						end

					end

				end

			end

		end


	end;

endmodule
