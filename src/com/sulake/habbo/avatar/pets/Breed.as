package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var _id:int;
      
      private var var_2306:String = "";
      
      private var var_1118:String;
      
      private var var_1413:Boolean;
      
      private var var_2666:Boolean = true;
      
      private var var_2968:int;
      
      private var var_2967:String;
      
      public function Breed(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         this.var_2968 = parseInt(param1.@pattern);
         this.var_1118 = String(param1.@gender);
         this.var_1413 = Boolean(parseInt(param1.@colorable));
         this.var_2306 = String(param1.@localizationKey);
         if(param1.@sellable && param1.@sellable == "0")
         {
            this.var_2666 = false;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get gender() : String
      {
         return this.var_1118;
      }
      
      public function get isColorable() : Boolean
      {
         return this.var_1413;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2666;
      }
      
      public function get patternId() : int
      {
         return this.var_2968;
      }
      
      public function get avatarFigureString() : String
      {
         return this.var_2967;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         this.var_2967 = param1;
      }
      
      public function get localizationKey() : String
      {
         return this.var_2306;
      }
   }
}
