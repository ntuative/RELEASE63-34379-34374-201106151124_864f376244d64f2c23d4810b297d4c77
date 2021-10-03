package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2713:String;
      
      private var var_1960:String;
      
      private var var_2714:String;
      
      private var var_1959:Boolean;
      
      private var var_1958:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2713 = String(param1["set-type"]);
         this.var_1960 = String(param1["flipped-set-type"]);
         this.var_2714 = String(param1["remove-set-type"]);
         this.var_1959 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1958 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1958;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1958 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2713;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1960;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2714;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1959;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1959 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1960 = param1;
      }
   }
}
