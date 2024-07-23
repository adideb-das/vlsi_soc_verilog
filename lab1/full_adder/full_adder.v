/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   full_adder.v   

Description :      One bit Full adder Design

Author Name :      Susmita

Version     : 	   1.0
*********************************************************************************************/
`include "half_adder.v"

module full_adder(a_in,b_in,c_in,sum_out,carry_out);
   //Step1 : Write down the directions for the ports	      
   input a_in,b_in,c_in;
   output sum_out,carry_out;
   //Step2 : Declare the internal wires 
   wire W1,W2,W3; 
   //Step3 : Instantiate the Half-Adders using name-based port mapping			 
   half_adder HA1(a_in,b_in,W1,W2);
   half_adder HA2(c_in,W1,sum_out,W3);
   //Step4 : Instantiate the OR gate
   assign carry_out= W2 | W3;

endmodule
