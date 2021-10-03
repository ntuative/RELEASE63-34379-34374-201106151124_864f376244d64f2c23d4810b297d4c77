package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_142:String = "ROE_MOUSE_CLICK";
      
      public static const const_187:String = "ROE_MOUSE_ENTER";
      
      public static const const_666:String = "ROE_MOUSE_MOVE";
      
      public static const const_190:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2198:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_499:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2020:String = "";
      
      private var var_2651:Boolean;
      
      private var var_2652:Boolean;
      
      private var var_2654:Boolean;
      
      private var var_2653:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_2020 = param2;
         this.var_2651 = param5;
         this.var_2652 = param6;
         this.var_2654 = param7;
         this.var_2653 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_2020;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2651;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2652;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2654;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2653;
      }
   }
}
