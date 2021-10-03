package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2218:String;
      
      protected var var_1511:Number;
      
      protected var var_3004:Boolean;
      
      protected var var_3005:Boolean;
      
      protected var var_2511:Boolean;
      
      protected var var_2821:Boolean;
      
      protected var var_3006:int;
      
      protected var var_2513:int;
      
      protected var var_2514:int;
      
      protected var var_2509:int;
      
      protected var var_2156:String;
      
      protected var var_1704:int;
      
      protected var var_931:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2511 = param5;
         this.var_3005 = param6;
         this.var_3004 = param7;
         this.var_2821 = param8;
         this.var_2218 = param9;
         this.var_1511 = param10;
         this.var_3006 = param11;
         this.var_2513 = param12;
         this.var_2514 = param13;
         this.var_2509 = param14;
         this.var_2156 = param15;
         this.var_1704 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2218;
      }
      
      public function get extra() : Number
      {
         return this.var_1511;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_3004;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_3005;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2511;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2821;
      }
      
      public function get expires() : int
      {
         return this.var_3006;
      }
      
      public function get creationDay() : int
      {
         return this.var_2513;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2514;
      }
      
      public function get creationYear() : int
      {
         return this.var_2509;
      }
      
      public function get slotId() : String
      {
         return this.var_2156;
      }
      
      public function get songId() : int
      {
         return this.var_1704;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_931 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_931;
      }
   }
}
