package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2334:int;
      
      private var var_1605:String;
      
      private var _objId:int;
      
      private var var_2007:int;
      
      private var _category:int;
      
      private var var_2218:String;
      
      private var var_2664:Boolean;
      
      private var var_2665:Boolean;
      
      private var var_2663:Boolean;
      
      private var var_2666:Boolean;
      
      private var var_2667:int;
      
      private var var_1511:int;
      
      private var var_2156:String = "";
      
      private var var_1704:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2334 = param1;
         this.var_1605 = param2;
         this._objId = param3;
         this.var_2007 = param4;
         this._category = param5;
         this.var_2218 = param6;
         this.var_2664 = param7;
         this.var_2665 = param8;
         this.var_2663 = param9;
         this.var_2666 = param10;
         this.var_2667 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_2156 = param1;
         this.var_1511 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2334;
      }
      
      public function get itemType() : String
      {
         return this.var_1605;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_2007;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2218;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2664;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2665;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2663;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2666;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2667;
      }
      
      public function get slotId() : String
      {
         return this.var_2156;
      }
      
      public function get songId() : int
      {
         return this.var_1704;
      }
      
      public function get extra() : int
      {
         return this.var_1511;
      }
   }
}
