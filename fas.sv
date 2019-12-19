// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

	parameter nand_tpd = 1;
	parameter or_tpd = 1;
	parameter xnor_tpd = 1;

	logic d;
	logic e;
	logic f;
	logic g;
	logic i;
	

	
	// This is the logic for cout
	NAND2 #(
		.Tpdlh(nand_tpd),
		.Tpdhl(nand_tpd)
	) NAND2_instance (
		.A(b),
		.B(cin),
		.Z(d)
	);
	
	
	OR2 #(
		.Tpdlh(or_tpd),
		.Tpdhl(or_tpd)
	) OR2_instance (
		.A(b),
		.B(cin),
		.Z(e)
	);
	
	XNOR2 #(
		.Tpdlh(xnor_tpd),
		.Tpdhl(xnor_tpd)
	) XNOR2_instance (
		.A(a),
		.B(a_ns),
		.Z(f)
	);
	
	NAND2 #(
		.Tpdlh(nand_tpd),
		.Tpdhl(nand_tpd)
	) NAND2_Binstance (
		.A(e),
		.B(f),
		.Z(g)
	);
	
	NAND2 #(
		.Tpdlh(nand_tpd),
		.Tpdhl(nand_tpd)
	) NAND2_Cinstance (
		.A(d),
		.B(g),
		.Z(cout)
	);
	
	XNOR2 #(
		.Tpdlh(xnor_tpd),
		.Tpdhl(xnor_tpd)
	) XNOR2_A (
		.A(b),
		.B(cin),
		.Z(i)
	);
	
	XNOR2 #(
		.Tpdlh(xnor_tpd),
		.Tpdhl(xnor_tpd)
	) XNOR2_B (
		.A(a),
		.B(i),
		.Z(s)
	);
	// This is the logic for s

endmodule
