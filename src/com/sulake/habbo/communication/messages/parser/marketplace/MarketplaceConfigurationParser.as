package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1660:Boolean;
      
      private var var_2288:int;
      
      private var var_1713:int;
      
      private var var_1712:int;
      
      private var var_2287:int;
      
      private var var_2290:int;
      
      private var var_2289:int;
      
      private var var_2254:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1660;
      }
      
      public function get commission() : int
      {
         return this.var_2288;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1713;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1712;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2290;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2287;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2289;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2254;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1660 = param1.readBoolean();
         this.var_2288 = param1.readInteger();
         this.var_1713 = param1.readInteger();
         this.var_1712 = param1.readInteger();
         this.var_2290 = param1.readInteger();
         this.var_2287 = param1.readInteger();
         this.var_2289 = param1.readInteger();
         this.var_2254 = param1.readInteger();
         return true;
      }
   }
}
