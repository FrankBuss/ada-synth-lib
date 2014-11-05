with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

package body Utils is

   function Sample_To_Int (S : Sample) return Int_T is
   begin
      return Int_T
        (Saturate (S)
         * Sample
           (Int_T'Last - 1));
   end Sample_To_Int;

   A_Const : constant Float := 2.0 ** (1.0 / 12.0);

   function Distance_From_A4 (N : Note_T) return Integer
   is
      Scale_Dist : Integer :=
        Scale_Degree_T'Pos(N.Scale_Degree) - Scale_Degree_T'Pos(A);
   begin
      return Scale_Dist + ((Integer (N.Octave) - 4) * 12);
   end Distance_From_A4;

   function Note_To_Freq (N : Note_T) return Frequency
   is
   begin
      return Frequency (440.0 * (A_Const ** Distance_From_A4 (N)));
   end Note_To_Freq;

end Utils;