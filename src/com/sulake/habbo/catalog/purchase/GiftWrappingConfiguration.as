package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1660:Boolean = false;
      
      private var var_1695:int;
      
      private var var_2008:Array;
      
      private var var_897:Array;
      
      private var var_896:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1660 = _loc2_.isWrappingEnabled;
         this.var_1695 = _loc2_.wrappingPrice;
         this.var_2008 = _loc2_.stuffTypes;
         this.var_897 = _loc2_.boxTypes;
         this.var_896 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1660;
      }
      
      public function get price() : int
      {
         return this.var_1695;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_2008;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_897;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_896;
      }
   }
}
