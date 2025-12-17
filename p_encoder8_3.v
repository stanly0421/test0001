module p_encoder8_3(y,v,d);
	output [2:0] y;
	output v;
	
	input [7:0] d;
	reg [2:0] y;
	reg v;
	always @(*) begin
		casex(d)
		8'b0000_0000:begin
			y=3'd0;
			v=0;
		end
		8'b0000_0001:begin
			y=3'd0;
			v=1;
		end
		8'b0000_001x:begin
			y=3'd1;
			v=1;
		end
		8'b0000_01xx:begin
			y=3'd2;
			v=1;
		end
		8'b0000_1xxx:begin
			y=3'd3;
			v=1;
		end
		8'b0001_xxxx:begin
			y=3'd4;
			v=1;
		end
		8'b001x_xxxx:begin
			y=3'd5;
			v=1;
		end
		8'b01xx_xxxx:begin
			y=3'd6;
			v=1;
		end
		8'b1xxx_xxxx:begin
			y=3'd7;
			v=1;
		end
		endcase
	
	end
endmodule
