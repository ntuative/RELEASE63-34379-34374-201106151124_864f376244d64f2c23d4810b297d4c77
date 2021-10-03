package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_1003:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_235:int = -1;
      
      private var var_1407:String;
      
      private var _text:String;
      
      private var var_354:String;
      
      private var var_28:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         this.var_235 = param2;
         this.var_1407 = param3;
         this._text = param4;
         this.var_354 = param5;
         this.var_28 = param6;
      }
      
      public function get objectId() : int
      {
         return this.var_235;
      }
      
      public function get objectType() : String
      {
         return this.var_1407;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get colorHex() : String
      {
         return this.var_354;
      }
      
      public function get controller() : Boolean
      {
         return this.var_28;
      }
   }
}
