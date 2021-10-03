package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_63:String = "i";
      
      public static const const_70:String = "s";
      
      public static const const_180:String = "e";
       
      
      private var var_1613:String;
      
      private var var_2793:int;
      
      private var var_1090:String;
      
      private var var_1612:int;
      
      private var var_2080:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1613 = param1.readString();
         this.var_2793 = param1.readInteger();
         this.var_1090 = param1.readString();
         this.var_1612 = param1.readInteger();
         this.var_2080 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1613;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2793;
      }
      
      public function get extraParam() : String
      {
         return this.var_1090;
      }
      
      public function get productCount() : int
      {
         return this.var_1612;
      }
      
      public function get expiration() : int
      {
         return this.var_2080;
      }
   }
}
