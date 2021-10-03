package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1368:int;
      
      private var var_2564:Boolean;
      
      private var var_2475:Boolean;
      
      private var var_2563:int;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1368 = param1.readInteger();
         this.var_2564 = param1.readBoolean();
         this.var_2563 = param1.readInteger();
         this.var_2475 = param1.readBoolean();
      }
      
      public function get offerId() : int
      {
         return this.var_1368;
      }
      
      public function get isVip() : Boolean
      {
         return this.var_2564;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2475;
      }
      
      public function get daysRequired() : int
      {
         return this.var_2563;
      }
   }
}
