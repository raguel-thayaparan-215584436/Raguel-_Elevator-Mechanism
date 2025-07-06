module LED_Display_light(in,out);
input [3:0] in;
output [0:6] out;
assign out[0]= (~in[0]&~in[1]&~in[2]&in[3]) | (~in[0]&in[1]&~in[2]&~in[3]) | (in[0]&~in[1]&in[2]&in[3]) | (in[0]&in[1]&~in[2]&in[3]);
assign out[1]= (~in[0]&in[1]&~in[2]&in[3]) |(~in[0]&in[1]&in[2]&~in[3]) | (in[0]&~in[1]&in[2]&in[3]) | (in[0]&in[1]&~in[2]&~in[3])|(in[0]&in[1]&in[2]&~in[3]) | (in[0]&in[1]&in[2]&in[3]);
assign out[2]= (~in[0]&~in[1]&in[2]&~in[3]) |(in[0]&in[1]&~in[2]&~in[3]) | (in[0]&in[1]&in[2]&~in[3]) | (in[0]&in[1]&in[2]&in[3]);
assign out[3]= (~in[0]&~in[1]&~in[2]&in[3]) | (~in[0]&in[1]&~in[2]&~in[3]) | (~in[0]&in[1]&in[2]&in[3]) | (in[0]&~in[1]&in[2]&~in[3])|(in[0]&in[1]&in[2]&in[3]);
assign out[4]= (~in[0]&~in[1]&~in[2]&in[3]) | (~in[0]&~in[1]&in[2]&in[3]) | (~in[0]&in[1]&~in[2]&~in[3]) | (~in[0]&in[1]&~in[2]&in[3])|(~in[0]&in[1]&in[2]&in[3])|(in[0]&~in[1]&~in[2]&in[3]);
assign out[5]= (~in[0]&~in[1]&~in[2]&in[3]) | (~in[0]&~in[1]&in[2]&~in[3]) | (~in[0]&~in[1]&in[2]&in[3]) |(~in[0]&in[1]&in[2]&in[3])|(in[0]&in[1]&~in[2]&in[3]);
assign out[6]= (~in[0]&~in[1]&~in[2]) | (~in[0]&in[1]&in[2]&in[3]) | (in[0]&in[1]&~in[2]&~in[3]);

endmodule


