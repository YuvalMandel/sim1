// 4->1 multiplexer template
module mux4 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic d2,          // Data input 2
    input logic d3,          // Data input 3
    input logic [1:0] sel,   // Select input
    output logic z           // Output
);

parameter nand_tpd = 10;

logic d0_d1_selected;
logic d2_d3_selected;

mux2 #(
	.nand_tpd(nand_tpd)
) mux2_d0_d1_instance (
	.d0(d0),
	.d1(d1),
	.sel(sel[0]),
	.z(d0_d1_selected)
);

mux2 #(
	.nand_tpd(nand_tpd)
) mux2_d2_d3_instance (
	.d0(d2),
	.d1(d3),
	.sel(sel[0]),
	.z(d2_d3_selected)
);

mux2 #(
	.nand_tpd(nand_tpd)
) final_mux2_instance (
	.d0(d0_d1_selected),
	.d1(d2_d3_selected),
	.sel(sel[1]),
	.z(z)
);

endmodule
