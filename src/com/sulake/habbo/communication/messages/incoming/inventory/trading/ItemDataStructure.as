package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2331:int;
      
      private var var_1605:String;
      
      private var var_2510:int;
      
      private var var_2512:int;
      
      private var _category:int;
      
      private var var_2218:String;
      
      private var var_1511:int;
      
      private var var_2508:int;
      
      private var var_2513:int;
      
      private var var_2514:int;
      
      private var var_2509:int;
      
      private var var_2511:Boolean;
      
      private var var_3054:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2331 = param1;
         this.var_1605 = param2;
         this.var_2510 = param3;
         this.var_2512 = param4;
         this._category = param5;
         this.var_2218 = param6;
         this.var_1511 = param7;
         this.var_2508 = param8;
         this.var_2513 = param9;
         this.var_2514 = param10;
         this.var_2509 = param11;
         this.var_2511 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2331;
      }
      
      public function get itemType() : String
      {
         return this.var_1605;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2510;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2512;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2218;
      }
      
      public function get extra() : int
      {
         return this.var_1511;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2508;
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
      
      public function get groupable() : Boolean
      {
         return this.var_2511;
      }
      
      public function get songID() : int
      {
         return this.var_1511;
      }
   }
}
