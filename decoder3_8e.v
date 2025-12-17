module decoder3_8e(d,a,e);
	output [7:0] d;
	input [2:0] a;
	input e;
	
	reg [7:0] d;
	
	always @(*) begin	
		case({e,a})
			4'b1000:d=8'b0000_0001;
			4'b1001:d=8'b0000_0010;
			4'b1010:d=8'b0000_0100;
			4'b1011:d=8'b0000_1000;
			
			4'b1100:d=8'b0001_0000;
			4'b1101:d=8'b0010_0000;
			4'b1110:d=8'b0100_0000;
			4'b1111:d=8'b1000_0000;
			
			default:d=8'b0000_0000;
			endcase
			
		end
		
		
endmodule

