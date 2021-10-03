package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_969:String = "RWFUAM_ROTATE";
      
      public static const const_307:String = "RWFAM_MOVE";
      
      public static const const_751:String = "RWFAM_PICKUP";
      
      public static const const_869:String = "RWFAM_USE";
      
      public static const const_897:String = "RWFAM_OPEN_WELCOME_GIFT";
      
      public static const const_1216:String = "RWFAM_SAVE_STUFF_DATA";
       
      
      private var _furniId:int = 0;
      
      private var var_2402:int = 0;
      
      private var var_2403:String;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int, param4:String = null)
      {
         super(param1);
         this._furniId = param2;
         this.var_2402 = param3;
         this.var_2403 = param4;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniCategory() : int
      {
         return this.var_2402;
      }
      
      public function get objectData() : String
      {
         return this.var_2403;
      }
   }
}
