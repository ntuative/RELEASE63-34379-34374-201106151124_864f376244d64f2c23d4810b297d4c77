package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2249:int;
      
      private var var_2720:int;
      
      private var var_2719:int;
      
      private var _dayOffsets:Array;
      
      private var var_1977:Array;
      
      private var var_1976:Array;
      
      private var var_2721:int;
      
      private var var_2718:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2249;
      }
      
      public function get offerCount() : int
      {
         return this.var_2720;
      }
      
      public function get historyLength() : int
      {
         return this.var_2719;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1977;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1976;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2721;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2718;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2249 = param1.readInteger();
         this.var_2720 = param1.readInteger();
         this.var_2719 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1977 = [];
         this.var_1976 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1977.push(param1.readInteger());
            this.var_1976.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2718 = param1.readInteger();
         this.var_2721 = param1.readInteger();
         return true;
      }
   }
}
