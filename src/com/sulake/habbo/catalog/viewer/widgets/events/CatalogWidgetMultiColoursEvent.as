package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetMultiColoursEvent extends Event
   {
       
      
      private var var_996:Array;
      
      private var var_2411:String;
      
      private var var_2413:String;
      
      private var var_2412:String;
      
      public function CatalogWidgetMultiColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,param5,param6);
         this.var_996 = param1;
         this.var_2411 = param2;
         this.var_2413 = param3;
         this.var_2412 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_996;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2411;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2413;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2412;
      }
   }
}
