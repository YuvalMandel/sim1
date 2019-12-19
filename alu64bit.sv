// 64-bit ALU template
module alu64bit (
	input logic [63:0] a, // Input bit a
	input logic [63:0] b, // Input bit b
	input logic cin, // Carry in
	input logic [1:0] op, // Operation
	output logic [63:0] s, // Output S
	output logic cout // Carry out
);

	parameter nand_tpd = 1;
	parameter or_tpd = 1;
	parameter xnor_tpd = 1;

	logic[64:0] carry_arr;

	assign carry_arr[0] = cin;

	genvar alu_num;
	generate
		for (alu_num = 0; alu_num < 64; alu_num = alu_num + 1) begin : block

			alu1bit #(
				.nand_tpd(nand_tpd),
				.or_tpd(or_tpd),
				.xnor_tpd(xnor_tpd)
			) alu1bit_instance (
				.a(a[alu_num]),
				.b(b[alu_num]),
				.cin(carry_arr[alu_num]),
				.op(op),
				.s(s[alu_num]),
				.cout(carry_arr[alu_num + 1])
			);

		end
	endgenerate

	assign cout = carry_arr[64];

endmodule
