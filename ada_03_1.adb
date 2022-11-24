-- eribo549: Samarbetat med Omiaz320, Omid Azimi, samma program 

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;

-- Re: Rättning 2022-11-23
--
-- Fick underkännt på föregåened inlämningen med följande motiveringar
-- 1. Flera satser på samma rad
-- 2. Parametrar i underprogram har felaktig mod
-- 3. Skapa en Get/Put för varje datatyp, även inre
-- 
-- Eftersom ovanstående anlendningar inte motiverades på något sätt vill jag 
-- uttrycka mina synpunkter på varför jag anser att rättningen är fel
--
-- 1. Flera satser på samma rad
-- I koden förekommer flera satser på en rad bara då satserna i fråga printar 
-- eller tar inmatning från konsollen upprepade gånger och där efterföljande satser
-- på samma rad på något sätt relaterar till föregående sats. Detta är okej enligt
-- stilguiden för ADA 95, som jag hänvisat till på rad 62, som anser det vara ett 
-- undantag för regeln om statements-per-rad med följande motivering:     
--      
--          "grouping of closely related statements on the same line 
--          makes the structural relationship between the groups clear."
--
-- Jag anser att min kod följt denna motivering på alla förutom två ställen 
-- (New_Line på R68, R79) som nu justerats. Faktum är att jag ändrat strukturen
-- i koden ytterligare och förbättrat både läsbarheten och navigeringen genom att
-- flytta Get()-anrop som bara hämtar in kvarhängande mellanslag efter inmatningsargument 
-- till samma rad som det huvudsakliga Get()-anropet. Detta förtydligar att varje rad 
-- med ett Get()-anrop motsvarar ett inhämtat argument och att varje rad där Get() anropas
-- har betydelse för programmet. 
--
-- Vill påpeka att jag är väl medveten att kursens stilguide uppmanar till att inte
-- sätta fler statements på samma rad oavsett specialfall, vilket jag generellt håller med
-- om. Men, kursens stilguide rekommenderar även raduppdelade parameterlistor i alla fall  
-- där antalet funktions-och/eller-procedurparametrar överskrider 2, vilket inte är fallet 
-- i de flesta konventionella språk där praxis oftast är att dessa endast delas upp på olika
-- rader om radlängden överskrider någon satt längd. Detta - och faktumet att det är ADA-kod 
-- vi skriver - leder mig till slutsatsen att kursen tillämpar ADAs stilguide och därför 
-- också följer >både< dess regler >och< undantag. Man kan inte ha kakan och äta den med.
-- 
-- Om detta inte är fallet borde kursens stilguide vara formaterad för att vara så generell
-- som möjligt och reflekterat detta genom att inte underkänna arbeten som bryter mot ett   
-- specifikt språks standarder. 
--
-- 
-- 2. Parametrar i underprogram har felaktig mod
-- Det är omöjligt att veta vad exakt som är felet om det inte pekas ut, men låt mig 
-- förklara hur jag tänkt: Samtliga Put-procedurer gör inga som helst modifikationer på
-- in-datan i någon form annat än när outputten i vissa fall formateras, i dessa fall 
-- används ADAs egna Put-procedurer - vars parametrar är formaterade på exakt samma sätt. 
-- Se: https://www.adaic.org/resources/add_content/standards/05rm/html/RM-A-10-1.html
--
-- Get-procedurerna utför modifikationer på in-datan genom att tilldela värden till in-datan
-- med hjälp av ADAs egna Get-procedurer och returna, out-a, dessa till anroparen. Alltså, 
-- data tas in, modifieras, och skickas tillbaka - rimligen ett fall där parametermoddarna
-- borde sättas till in out. Om inte detta så måste proceduren själv skapa objektet att 
-- lagra det hämtade värdet i, men uppgiftsbeskrivningen specificerar att Get-procedurerna 
-- endast ska ha en parameter och att den parametern ska vara den aktuella datastrukturen. 
-- Förklara gärna vad det är jag har missat.
--
--
-- 3. Skapa en Get/Put för varje datatyp, även inre
-- Uppgiftsbeskrivningen säger följande gällande antalet Get-procedurer: 
--    "Du ska alltså skapa (som minst) tre olika "Get" i denna uppgift."
-- Vice versa för Put-procedurer. Jag ser tre stycken Get-procedurer och tre stycken 
-- Put-procedurer i min kod vilket betyder att jag följt uppgiftsbeskrivningen till fullo.
-- Förklara, på vilket sätt har jag inte följt uppgiftsbeskrivningens krav på antalet Get och Puts?
--
-- Vidare säger uppgiftsbeskrivningen ingenting om separata procedurer för att hantera inre datatyper 
-- och därför anser jag heller inte att det är riktigt att underkänna min kod på den punkten.
--
--
-- Jag har full förståelse för att rättningsarbetet alltid i viss grad sker 
-- genom ett subjektivt perspektiv, att det säkert på många sätt är både tråkigt 
-- och monotont och att ni som rättar säkert har fått direktiv att vara 
-- "petiga" - i brist på bättre ord. Vad jag inte har full förståelse för är 
-- inkonsekvent rättning där olika saker tycks gälla vid olika rättningar, och 
-- ännu mindre, rättning som är godtycklig och i vissa fall helt fel. 
-- Vid fall då uppgifter blivit underkända pga saker som inte är helt 
-- självklara, eller där utrymme för tolkning finns, så borde alltid en 
-- motivering också ges. Det blir lätt väldigt otydligt annars.
-- 

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
      Put(Args.W);  Put(" ");  -- Ok enl: https://www.adaic.org/resources/add_content/docs/95style/95style.pdf S.30
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
