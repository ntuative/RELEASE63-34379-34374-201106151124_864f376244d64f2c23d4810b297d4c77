package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1368:int;
      
      private var var_1787:String;
      
      private var var_1186:int;
      
      private var var_1187:int;
      
      private var var_1786:int;
      
      private var var_1783:int;
      
      private var var_1354:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1368 = param1.readInteger();
         this.var_1787 = param1.readString();
         this.var_1186 = param1.readInteger();
         this.var_1187 = param1.readInteger();
         this.var_1786 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1354 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1354.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
         this.var_1783 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1368;
      }
      
      public function get localizationId() : String
      {
         return this.var_1787;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1186;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1187;
      }
      
      public function get products() : Array
      {
         return this.var_1354;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1786;
      }
      
      public function get clubLevel() : int
      {
         return this.var_1783;
      }
   }
}
