with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

procedure Ada_03_1 is

   type Post_Type1 is record
      W : Character;
      P : String (1 .. 4);
   end record;

   type Post_Type2_1 is record
      S : Float;
      Z : String (1 .. 4);
   end record;

   type Post_Type2 is record
      D, U : Post_Type2_1;
   end record;

   type Post_Type3_1 is record       
      Y, Q : Character;
   end record; 

   type Post_Type3_2 is record       
      T : Boolean;
      L : Character;
   end record; 

   type Post_Type3 is record
      J, B : Post_Type3_1;
      O    : Post_Type3_2;
   end record;

   -----------------------------------------------------------------------------
   procedure Put (Args : in Post_Type1) is
   
   begin
      Put(Args.W);  Put(" "); 
      Put(Args.P);  
      New_Line(2); 
   end Put;

   -----------------------------------------------------------------------------
   procedure Put (Args : in Post_Type2) is
   
   begin
      Put(Args.D.S, Fore => 0, Aft => 3, Exp => 0);  Put(" ");
      Put(Args.D.Z);                                 Put(" ");
      Put(Args.U.S, Fore => 0, Aft => 3, Exp => 0);  Put(" ");
      Put(Args.U.Z);                                  
      New_Line(2);
   end Put;

   -----------------------------------------------------------------------------
   procedure Put (Args : in Post_Type3) is
   
   begin
      Put(Args.J.Y);  Put(" ");
      Put(Args.J.Q);  Put(" ");
      Put(Args.B.Y);  Put(" ");
      Put(Args.B.Q);  Put(" ");
      if (Args.O.T) then
         Put("True ");
      else
         Put("False ");
      end if;
      Put(Args.O.L);
   end Put;

   -----------------------------------------------------------------------------
   procedure Get (DS: in out Post_Type1) is
      
      C : Character;

   begin
      Get(DS.W);    Get(C);  -- Get(C) -> whitespace
      Get(DS.P);
   end Get;

   -----------------------------------------------------------------------------
   procedure Get (DS : in out Post_Type2) is
   
      C : Character;

   begin
      Get(DS.D.S);  Get(C);  -- Get(C) -> whitespace
      Get(DS.D.Z);  Get(C);
      Get(DS.U.S);  Get(C);
      Get(DS.U.Z);
   end Get;

   -----------------------------------------------------------------------------
   procedure Get (DS: in out Post_Type3) is
      
      C : Character;

   begin
      Get(DS.J.Y);  Get(C); -- Get(C) -> whitespace
      Get(DS.J.Q);  Get(C);
      Get(DS.B.Y);  Get(C);
      Get(DS.B.Q);  Get(C);
      Get(C);
      if C = 'T' then
         DS.O.T := True;
      else
         DS.O.T := False;
      end if;
      Get(C);
      Get(DS.O.L);
   end Get;

   -----------------------------------------------------------------------------
   DS1   : Post_Type1;
   DS2   : Post_Type2;
   DS3   : Post_Type3;

begin

   Put_Line("För DS1:");
   Put("Mata in datamängd: ");  Get(DS1);
   Put("Inmatad datamängd: ");  Put(DS1);
   Skip_Line;

   Put_Line("För DS2:");
   Put("Mata in datamängd: ");  Get(DS2);
   Put("Inmatad datamängd: ");  Put(DS2);
   Skip_Line;

   Put_Line("För DS3:");
   Put("Mata in datamängd: ");  Get(DS3);
   Put("Inmatad datamängd: ");  Put(DS3);
   Skip_Line;

end Ada_03_1;
