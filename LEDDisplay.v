/*
module LEDDisplay(in,out);
input [3:0] in;
output [0:6] out;
assign out[0]= (~in[0]&~in[1]&~in[2]&in[3]) | (~in[0]&in[1]&~in[2]&~in[3]) | (in[0]&~in[1]&in[2]&in[3]) | (in[0]&in[1]&~in[2]&in[3]);
assign out[1]= (~in[0]&in[1]&~in[2]&in[3]) |(~in[0]&in[1]&in[2]&~in[3]) | (in[0]&~in[1]&in[2]&in[3]) | (in[0]&in[1]&~in[2]&~in[3])|(in[0]&in[1]&in[2]&~in[3]) | (in[0]&in[1]&in[2]&in[3]);
assign out[2]= (~in[0]&~in[1]&in[2]&~in[3]) |(in[0]&in[1]&~in[2]&~in[3]) | (in[0]&in[1]&in[2]&~in[3]) | (in[0]&in[1]&in[2]&in[3]);
assign out[3]= (~in[0]&~in[1]&~in[2]&in[3]) | (~in[0]&in[1]&~in[2]&~in[3]) | (~in[0]&in[1]&in[2]&in[3]) | (in[0]&~in[1]&in[2]&~in[3])|(in[0]&in[1]&in[2]&in[3]);
assign out[4]= (~in[0]&~in[1]&~in[2]&in[3]) | (~in[0]&~in[1]&in[2]&in[3]) | (~in[0]&in[1]&~in[2]&~in[3]) | (~in[0]&in[1]&~in[2]&in[3])|(~in[0]&in[1]&in[2]&in[3])|(in[0]&~in[1]&~in[2]&in[3]);
assign out[5]= (~in[0]&~in[1]&~in[2]&in[3]) | (~in[0]&~in[1]&in[2]&~in[3]) | (~in[0]&~in[1]&in[2]&in[3]) |(~in[0]&in[1]&in[2]&in[3])|(in[0]&in[1]&~in[2]&in[3]);
assign out[6]= (~in[0]&~in[1]&~in[2]) | (~in[0]&in[1]&in[2]&in[3]) | (in[0]&in[1]&~in[2]&~in[3]);


endmodule */

// This code is credited to Jaspal Singh the EECS technician 
//jaspal@cse.yorku.ca


//module hex7seg (inp, display);
module LEDDisplay (inp, display);

	input 	[3:0] inp;
	output 	[0:6] display;

	reg 		[0:6] display;

	/*
	 *       0  
	 *      ---  
	 *     |   |
	 *    5|   |1
	 *     | 6 |
	 *      ---  
	 *     |   |
	 *    4|   |2
	 *     |   |
	 *      ---  
	 *       3  
	 */
	always @ (inp)
		case (inp)
			0: display = 7'b000_0001;        //order is [0:6] 
			1: display = 7'b100_1111;
			2: display = 7'b001_0010;
			3: display = 7'b000_0110;
			4: display = 7'b100_1100;
			5: display = 7'b010_0100;
			6: display = 7'b010_0000;
			7: display = 7'b000_1111;
			8: display = 7'b000_0000;
			9: display = 7'b000_1100;
			10:display = 7'b000_1000;       
			11:display = 7'b110_0000;
			12:display = 7'b011_0001;
			13:display = 7'b100_0010;
			14:display = 7'b011_0000;
			15:display = 7'b011_1000;
		endcase
endmodule
