package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2848:int;
      
      private var var_2849:int;
      
      private var var_1186:int;
      
      private var var_1187:int;
      
      private var var_1786:int;
      
      private var var_2847:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2848 = param1.readInteger();
         this.var_2849 = param1.readInteger();
         this.var_1186 = param1.readInteger();
         this.var_1187 = param1.readInteger();
         this.var_1786 = param1.readInteger();
         this.var_2847 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2848;
      }
      
      public function get charges() : int
      {
         return this.var_2849;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1186;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1187;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2847;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1786;
      }
   }
}
