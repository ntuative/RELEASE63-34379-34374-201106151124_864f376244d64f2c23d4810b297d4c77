package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2249:int;
      
      private var var_2720:int;
      
      private var var_2719:int;
      
      private var _dayOffsets:Array;
      
      private var var_1977:Array;
      
      private var var_1976:Array;
      
      private var var_2721:int;
      
      private var var_2718:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2249 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2720 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2719 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1977 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1976 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2721 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2718 = param1;
      }
   }
}
