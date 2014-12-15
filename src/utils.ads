with Config; use Config;

package Utils is
   type Frequency is new Float;
   type Sample_Period is new Natural;
   type Period is new Float;
   type Sample is new Float;

   subtype Millisecond is Natural;
   type Scale is new Float range 0.0 .. 1.0;

   type Scale_Degree_T is (A, A_Sh, B, C, C_Sh, D, D_Sh, E, F, F_Sh, G, G_Sh);
   type Octave_T is range -1 .. 10;

   type Note_T is record
      Scale_Degree : Scale_Degree_T;
      Octave : Octave_T;
   end record;

   function Note_Img (N : Note_T) return String is
      (N.Scale_Degree'Img & " " & N.Octave'Img);

   No_Note : constant Note_T := (A, -1);

   function Note_To_Freq
     (N : Note_T; Rel_Pitch : Integer := 0) return Frequency;

   function Period_In_Samples (Rate_In_Hertz : Frequency) return Period
   is (Period (SAMPLE_RATE / Rate_In_Hertz));

   function Saturate (S : Sample) return Sample is
     (if S > 1.0 then 1.0
      elsif S < -1.0 then -1.0
      else S);

   generic
      type Int_T is range <>;
   function Sample_To_Int (S : Sample) return Int_T;

   generic
      type UInt_T is mod <>;
   function Sample_To_UInt (S : Sample) return UInt_T;

   function Msec_To_Period (Ms : Millisecond) return Sample_Period is
     (Sample_Period (Float (Ms) / 1000.0 * Float (SAMPLE_RATE)));

   function Sin (N : Float) return Float;

   function Filter_Tan (Freq : Natural) return Float;

   Pi : constant :=
     3.14159_26535_89793_23846_26433_83279_50288_41971_69399_37511;

end Utils;
