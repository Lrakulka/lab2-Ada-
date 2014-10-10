------------------------------------
--- PP-1                         ---
--- Lab 1: Packages in Ada       ---
--- F1: C = A + SORT(B) *(MA*MZ) ---
--- F2: MD = MIN(MA)*MB*MC       ---
--- F3: A = MB*MC+ MM            ---
--- Borisov Olexander            ---
--- IP-22                        ---
--- 08.09.2014                   ---
------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

generic 
	N : Integer;

package Data IS
	type vector is private; 
    type matrix is private;

    procedure func1(A, B : in Vector; MA, MZ : in Matrix; C : out vector);
    procedure func2(MA, MB, MC : in Matrix; MD : out Matrix);
    procedure func3(MB, MC, MM : in Matrix; A : out Matrix);

	procedure Get_Vector(V : out Vector);
	procedure Get_Matrix(M : out Matrix);
	procedure Print_Vector(V : in Vector);
	procedure print_matrix(M : in matrix);
	procedure Print_Vector(M : in Matrix); -- For Func3

	private
	type vector is array (1..N) of Integer;
	type Matrix is array (1..N) of Vector;
end Data;

package body Data is
	function Multiply_Matrix(M1, M2 : in Matrix) return Matrix is
		Result : Matrix;	
	begin	
		for i in 1..N loop
			Result(i) := (others => 0);
		end loop;
		for i in 1..N loop
			for j in 1..N loop
				for K in 1..N loop
					Result(i)(j) := result(i)(j) + M1(I)(K) * M2(K)(J);
				end loop;
			end loop;
		end loop;
		return Result;
	end Multiply_Matrix;

	function Multiply_Vector_And_Matrix(V : in Vector; M : in Matrix) return Vector is
		Result : Vector := (others => 0);
	begin
		for i in 1..N loop
			for j in 1..N loop
				Result(i) := Result(I) + V(J) * M(J)(I);
			end loop;
		end loop;
		return Result;
	end Multiply_Vector_And_Matrix;

	function sum_vector(V1, v2: in Vector) return Vector is
		Result : Vector := (others => 0);
	begin
		for i in 1..N loop
			Result(i) := V1(i) + v2(i);
		end loop;
		return result;
	end Sum_Vector;

	function sum_Matrix(M1, M2 : in Matrix) return Matrix is
		Result : Matrix;
	begin
		for i in 1..N loop
			Result(i) := (others => 0);
		end loop;
		for i in 1..N loop
			for j in 1..N loop
				Result(i)(j) := M1(i)(j) + M2(i)(j);
			end loop;
		end loop;
		return result;
	end sum_Matrix;

	function Sort_Vector(V : in Vector) return Vector is
		Result : Vector := V;
		P : Integer;
	begin
		for i in 1..N loop
			for J in 2..N loop
				if v(i) > V(J)
					then p := Result(i);
				 		Result(i) := Result(j);
						Result(J) := p;
				end if;
			end loop;
		end loop;
		return Result;
	end Sort_Vector;

	function Min_matrix(M : in Matrix) return Integer is
		Result : Integer := 0;
	begin
		Result := M(1)(1);
		for i in 1..N loop
			for j in 1..N loop
				if M(i)(j) > Result 
					Then Result := M(i)(j); 
				end if;
			end loop;
		end loop;
		return Result;
	end min_matrix;

	function Multiply_Number_and_Matrix(num : in Integer; M : in Matrix) return Matrix is
		Result : Matrix;
	begin
		for i in 1..N loop
			for j in 1..N loop
				result(i)(j) := num * m(i)(j);
			end loop;
		end loop;
		return Result;
	end Multiply_Number_and_Matrix;

	procedure Get_Vector(V : out Vector) is
	begin
		for i in 1..N loop
		    Get(V(i));
		end loop;
	end Get_Vector;

	procedure Get_Matrix(M: out Matrix) is
	begin
		for i in 1..N loop
			Get_Vector(M(i));
		end loop;
	end Get_Matrix;

	procedure Print_Vector(V: in Vector) is
	begin
		for i in 1..N loop
		    Put(V(i), 4);
		    Put(" ");
		end loop;
		Put_Line("");
	end Print_Vector;

	procedure print_matrix(M: in matrix) is
	begin
		for i in 1..N loop
			Print_Vector(M(i));
		end loop;
	end print_matrix;

	procedure print_Vector(M: in matrix) is
	begin
		for i in 1..N loop
			for J in 1..N loop
		    Put(M(i)(j), 4);
		    Put(" ");
			end loop;
		end loop;
	end print_vector;

	procedure func1(A, B : in Vector; MA, MZ : in Matrix; C : out vector) is
	begin
		C := sum_vector(A, Multiply_Vector_And_Matrix(Sort_Vector(B), Multiply_Matrix(MA, MZ)));
	end Func1;
	
	procedure func2(MA, MB, MC : in Matrix; MD : out Matrix) is
	begin
		MD := Multiply_Matrix(Multiply_Number_and_Matrix(Min_matrix(MA), MB), MC);
	end Func2;

    procedure func3(MB, MC, MM : in Matrix; A : out Matrix) is
	begin
		A := sum_Matrix(Multiply_Matrix(MB, MC), MM);
	end Func3;

end Data;
