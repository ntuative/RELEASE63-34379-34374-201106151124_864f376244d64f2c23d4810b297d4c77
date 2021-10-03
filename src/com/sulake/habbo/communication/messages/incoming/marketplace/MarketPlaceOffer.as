package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1368:int;
      
      private var _furniId:int;
      
      private var var_2247:int;
      
      private var var_2218:String;
      
      private var var_1695:int;
      
      private var var_425:int;
      
      private var var_2246:int = -1;
      
      private var var_2249:int;
      
      private var var_1696:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this.var_1368 = param1;
         this._furniId = param2;
         this.var_2247 = param3;
         this.var_2218 = param4;
         this.var_1695 = param5;
         this.var_425 = param6;
         this.var_2246 = param7;
         this.var_2249 = param8;
         this.var_1696 = param9;
      }
      
      public function get offerId() : int
      {
         return this.var_1368;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2247;
      }
      
      public function get stuffData() : String
      {
         return this.var_2218;
      }
      
      public function get price() : int
      {
         return this.var_1695;
      }
      
      public function get status() : int
      {
         return this.var_425;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2246;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2249;
      }
      
      public function get offerCount() : int
      {
         return this.var_1696;
      }
   }
}
