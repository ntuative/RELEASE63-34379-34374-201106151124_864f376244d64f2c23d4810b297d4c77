package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_407:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1153:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1292:String = "RWOCM_PIXELS";
      
      public static const const_1333:String = "RWOCM_CREDITS";
       
      
      private var var_2969:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_407);
         this.var_2969 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2969;
      }
   }
}
