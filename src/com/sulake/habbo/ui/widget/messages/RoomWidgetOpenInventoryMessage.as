package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_926:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1933:String = "inventory_effects";
      
      public static const const_1328:String = "inventory_badges";
      
      public static const const_1804:String = "inventory_clothes";
      
      public static const const_1865:String = "inventory_furniture";
       
      
      private var var_2815:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_926);
         this.var_2815 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2815;
      }
   }
}
