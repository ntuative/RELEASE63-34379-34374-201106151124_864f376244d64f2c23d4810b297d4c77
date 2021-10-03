package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetSellablePetBreedsEvent extends Event
   {
       
      
      private var var_1846:String;
      
      private var var_1553:Array;
      
      public function CatalogWidgetSellablePetBreedsEvent(param1:String, param2:Array, param3:Boolean = false, param4:Boolean = false)
      {
         super(WidgetEvent.CWE_SELLABLE_PET_BREEDS,param3,param4);
         this.var_1846 = param1;
         this.var_1553 = param2;
      }
      
      public function get productCode() : String
      {
         return this.var_1846;
      }
      
      public function get sellableBreeds() : Array
      {
         if(this.var_1553 != null)
         {
            return this.var_1553.slice();
         }
         return [];
      }
   }
}
