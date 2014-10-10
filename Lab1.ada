------------------------------------
--- PP-2                         ---
--- Lab 1: Packages in Ada       ---
--- F1: C = A + SORT(B) *(MA*MZ) ---
--- F2: MD = MIN(MA)*MB*MC       ---
--- F3: A = MB*MC+ MM            ---
--- Borisov Olexander            ---
--- IP-22                        ---
--- 15.09.2014                   ---
------------------------------------

with Data;
package Data_3 is new Data(3);
with Ada.Text_IO, Data_3, Ada.Integer_Text_IO;
use Ada.Text_IO, Data_3, Ada.Integer_Text_IO;

procedure Main is
	
	package Int_IO is new Integer_IO (Integer);
	task T1 is		
		pragma priority(1);
		Pragma Storage_Size(10000000);
		--pragma CPU(1)
	end T1;
	task T2 is		
		pragma priority(20);
		Pragma Storage_Size(10000000);
		--pragma CPU(2)
	end T2;
	task T3 is
		pragma priority(10);
		Pragma Storage_Size(10000000);
		--pragma CPU(3)
	end T3;

	task body T1 is
		A, B, func1_result : vector;
		MA, MZ : Matrix;
	begin	
		Put_Line("Task T1 started");
		Put_Line("");
		Put_Line("Enter the vector A:");
		Get_Vector(A);
		Put_Line("Enter the vector B:");
		Get_Vector(B);
		Put_Line("Enter the matrix MA:");
		Get_Matrix(MA);
		Put_Line("Enter the matrix MZ:");
		Get_Matrix(MZ);
		delay (1.0);
		Func1(A, B, MA, MZ, Func1_Result);
		Put_Line("Func1 Result:");
		Print_Vector(Func1_Result);
		Put_Line("");
		Put_Line("Task T1 finished");
	end T1;
	
	task body T2 is
		MA, MB, MC, Func2_Result : Matrix;
	begin		
		Put_Line("Task T2 started");
		Put_Line("");
		Put_Line("Enter the matrix MA:");
		Get_Matrix(MA);
		Put_Line("Enter the matrix MB:");
		Get_Matrix(MB);
		Put_Line("Enter the matrix MC:");
		Get_Matrix(MC);
 		delay(3.0);
		Func2(MA, MB, MC, Func2_Result);
		Put_Line("Func2 Result:");
		Print_Vector(Func2_Result);
		Put_Line("");
		Put_Line("Task T2 finished");
	end t2;

	task body T3 is
		MB, MC, MM, func3_Result : Matrix;
	begin		
		Put_Line("Task T3 started");
		Put_Line("");
		Get_Matrix(MB);
		Put_Line("Enter the matrix MC:");
		Get_Matrix(MC);
		Put_Line("Enter the matrix MM:");
		Get_Matrix(MM);
		delay(5.0);
		Func3(MB, MC, MM, Func3_Result);
		Put_Line("Func3 Result:");
		Print_Vector(Func3_Result);
		Put_Line("");
		Put_Line("Task T3 finished");
	end t3;
begin	
	null;
end Main;



	task body T3 is
		MB, MC, MM, func3_Result : Matrix;
	begin		
		Put_Line("Task T3 started");
		Put_Line("");
		Put_Line("Enter the matrix MB:");
		Get_Matrix(MB);
		Put_Line("Enter the matrix MC:");
		Get_Matrix(MC);
		Put_Line("Enter the matrix MM:");
		Get_Matrix(MM);
		delay(5.0);
		Func3(MB, MC, MM, Func3_Result);
		Put_Line("Func3 Result:");
		Print_Vector(Func3_Result);
		Put_Line("");
		Put_Line("Task T3 finished");
	end t3;




		task body T1 is
		A, B, func1_result : vector;
		MA, MZ : Matrix;
	begin	
		Put_Line("Task T1 started");
		Put_Line("");
		Put_Line("Enter the vector A:");
		Get_Vector(A);
		Put_Line("Enter the vector B:");
		Get_Vector(B);
		Put_Line("Enter the matrix MA:");
		Get_Matrix(MA);
		Put_Line("Enter the matrix MZ:");
		Get_Matrix(MZ);
		delay (1.0);
		Func1(A, B, MA, MZ, Func1_Result);
		Put_Line("Func1 Result:");
		Print_Vector(Func1_Result);
		Put_Line("");
		Put_Line("Task T1 finished");
	end T1;




		task T3 is
		pragma priority(1);
		Pragma Storage_Size(10000000);
		--pragma CPU(3)
	end T3;


		task T1 is		
		pragma priority(7);
		Pragma Storage_Size(10000000);
		--pragma CPU(1)
	end T1;
