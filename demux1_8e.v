module demux1_8e(y,d,e,s);
	output [7:0] y;
	input d,e;
	input [2:0] s;
	
	reg [7:0] y;
	
	always @(*)
	begin
		case({e,s})
		4'h8:y={7'b000_0000,d};
		4'h9:y={6'b00_0000,d,1'b0};
		4'ha:y={5'b0_0000,d,2'b00};
		4'hb:y={4'b0000,d,3'b000};
		4'hc:y={3'b000,d,4'b0000};
		4'hd:y={2'b00,d,5'b0_0000};
		4'he:y={1'b0,d,6'b00_0000};
		4'hf:y={d,7'b000_0000};
		default y=8'b0000_0000;
		endcase
	
	end
endmodule
