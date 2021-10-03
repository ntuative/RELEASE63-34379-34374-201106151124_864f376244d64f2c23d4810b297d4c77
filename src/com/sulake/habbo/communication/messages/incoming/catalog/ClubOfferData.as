package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1368:int;
      
      private var var_1846:String;
      
      private var var_1695:int;
      
      private var _upgrade:Boolean;
      
      private var var_2375:Boolean;
      
      private var var_2370:int;
      
      private var var_2374:int;
      
      private var var_2372:int;
      
      private var var_2371:int;
      
      private var var_2373:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1368 = param1.readInteger();
         this.var_1846 = param1.readString();
         this.var_1695 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2375 = param1.readBoolean();
         this.var_2370 = param1.readInteger();
         this.var_2374 = param1.readInteger();
         this.var_2372 = param1.readInteger();
         this.var_2371 = param1.readInteger();
         this.var_2373 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1368;
      }
      
      public function get productCode() : String
      {
         return this.var_1846;
      }
      
      public function get price() : int
      {
         return this.var_1695;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2375;
      }
      
      public function get periods() : int
      {
         return this.var_2370;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2374;
      }
      
      public function get year() : int
      {
         return this.var_2372;
      }
      
      public function get month() : int
      {
         return this.var_2371;
      }
      
      public function get day() : int
      {
         return this.var_2373;
      }
   }
}
