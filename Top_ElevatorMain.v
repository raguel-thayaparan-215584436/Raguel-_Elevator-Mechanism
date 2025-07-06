module Top_ElevatorMain(input_floor,reset,in_floor,out_current_floor,direction,delay,CLK,door);

input [8:1] input_floor;                               
input CLK; 
input reset;     
output reg[0:6] out_current_floor;                                                         
reg[8:1] request_floor;                              
input in_floor;                                       
reg[8:1] current_floor;                               
output reg delay; 



output reg [0:13] direction;
output reg [0:13] door;   

reg [27:0] c_clock;                                										
                               										
        

parameter UP=14'b0011000_1000001;//direction==UP
parameter DOWN=14'b1101010_1000010;// direction==DOWN
parameter Stay=14'b11111111111111;
parameter OP=14'b0011000_0000001; //open==door
parameter CL=14'b1110001_0110001; // close==door


always @ (posedge in_floor) 
	casex(request_floor)
		4'bxxxx:if(input_floor[1]) 
					request_floor=4'b0001;     								
		else if(input_floor[2]) 
		request_floor=4'b0010;        							 	
		else if(input_floor[3])
		request_floor=4'b0011;        								
		else if (input_floor[4]) 
		request_floor=4'b0100;        								
		else if(input_floor[5])
		request_floor=4'b0101;     									
		else if(input_floor[6])
		request_floor=4'b0110;        							 	
		else if (input_floor[7]) 
		request_floor=4'b0111;        								
		else if (input_floor[8])
		request_floor=4'b1000;  
	endcase
		
always @ (current_floor)
	begin
		case(current_floor)
			4'b0001:out_current_floor=7'b0100001;         // display G
			4'b0010:out_current_floor=7'b1001111;         // display 1
			4'b0011:out_current_floor=7'b0010010;         // display 2
			4'b0100:out_current_floor=7'b0000110;         // display 3
			4'b0101:out_current_floor=7'b1001100;			//display4
			4'b0110:out_current_floor =7'b0100100;			//display5
			4'b0111:out_current_floor= 7'b0100000;			//display6
			4'b1000:out_current_floor = 7'b0001111;		//display7
		endcase
	end
	
	
                     										
	
	
always @(posedge CLK)											 										 
begin
			if(!reset)begin 
			
				if (request_floor>current_floor)             										 
				 begin
				  direction=UP;      							                              
				  out_current_floor<=out_current_floor;
				  delay=1'b0;
				  end                                                     
		
					else if(request_floor<current_floor)
					begin
					direction=DOWN; 					
					out_current_floor=out_current_floor;
					delay=1'b0;
					end 
					else if(request_floor == current_floor)                                 
					begin
					direction=Stay; 
					delay=1'b1;
					
					end
				end
	
	
			
			 if (request_floor>current_floor)             										
				 begin
				  direction=UP;      							                            
				  door=CL;
				  c_clock=c_clock+1'b1;								 										
					delay=c_clock[27];                											
				  
				  if(delay)										
				  begin

				  current_floor <= current_floor+4'b1;
				  door= CL;
				  c_clock=1'b0;
				  
				  end
				 end
		 
			 else if(request_floor<current_floor)
				begin
				  direction=DOWN;                                                      
				  door=CL;
				  c_clock=c_clock+1'b1;								 										
				  delay=c_clock[27];                										
				  
				  if(delay)
				  begin
				  
				  current_floor <= current_floor-4'b1; 
				  door=CL;
				  c_clock=1'b0;                                                     
				  end
				end
			 
			 else if(request_floor == current_floor)                                 
				 begin
				  door=OP;
				  direction=Stay;
				  delay=c_clock-1'b1;
																											
				 end
		end 
		
		
	endmodule 

