// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

	parameter nand_tpd = 1;
	parameter or_tpd = 1;
	parameter xnor_tpd = 1;

logic xor_result;
logic xnor_result;
logic fas_result;
logic a_ns;

XNOR2 #(
	.Tpdlh(xnor_tpd),
	.Tpdhl(xnor_tpd)
) XNOR2_instance (
	.A(a),
	.B(b),
	.Z(xnor_result)
);

NAND2 #(
	.Tpdlh(nand_tpd),
	.Tpdhl(nand_tpd)
) NAND_xor (
	.A(a),
	.B(b),
	.Z(xor_result)
);

NAND2 #(
	.Tpdlh(nand_tpd),
	.Tpdhl(nand_tpd)
) NAND_a_ns (
	.A(op[0]),
	.B(op[0]),
	.Z(a_ns)
);

fas #(
	.nand_tpd(nand_tpd),
	.or_tpd(or_tpd),
	.xnor_tpd(xnor_tpd)
) fas_instance (
	.a(a),
	.b(b),
	.cin(cin),
	.a_ns(a_ns),
	.s(fas_result),
	.cout(cout)
);

mux4 #(
	.nand_tpd(nand_tpd)
) mux4_instance (
	.d0(xor_result),
	.d1(xnor_result),
	.d2(fas_result),
	.d3(fas_result),
	.sel(op),
	.z(s)
);

endmodule
