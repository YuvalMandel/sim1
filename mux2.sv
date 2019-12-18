// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

parameter nand_tpd = 1;

logic d1_selected;
logic d0_selected;
logic not_sel;

NAND2 #(
	.Tpdlh(nand_tpd),
	.Tpdhl(nand_tpd)
) d1_nand (
	.A(sel),
	.B(d1),
	.Z(d1_selected)
);

NAND2 #(
	.Tpdlh(nand_tpd),
	.Tpdhl(nand_tpd)
) sel_not (
	.A(sel),
	.B(sel),
	.Z(not_sel)
);

NAND2 #(
	.Tpdlh(nand_tpd),
	.Tpdhl(nand_tpd)
) d0_nand (
	.A(not_sel),
	.B(d0),
	.Z(d0_selected)
);

NAND2 #(
	.Tpdlh(nand_tpd),
	.Tpdhl(nand_tpd)
) final_nand (
	.A(d0_selected),
	.B(d1_selected),
	.Z(z)
);

endmodule
