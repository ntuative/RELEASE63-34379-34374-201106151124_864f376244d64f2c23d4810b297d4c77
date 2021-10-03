package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_2020:String = "";
      
      private var var_1689:String = "";
      
      private var var_2610:String = "";
      
      private var var_2890:Number = 0;
      
      private var var_2889:Number = 0;
      
      private var var_2867:Number = 0;
      
      private var var_2871:Number = 0;
      
      private var var_2652:Boolean = false;
      
      private var var_2651:Boolean = false;
      
      private var var_2654:Boolean = false;
      
      private var var_2653:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_2020 = param2;
         this.var_1689 = param3;
         this.var_2610 = param4;
         this.var_2890 = param5;
         this.var_2889 = param6;
         this.var_2867 = param7;
         this.var_2871 = param8;
         this.var_2652 = param9;
         this.var_2651 = param10;
         this.var_2654 = param11;
         this.var_2653 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_2020;
      }
      
      public function get canvasId() : String
      {
         return this.var_1689;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2610;
      }
      
      public function get screenX() : Number
      {
         return this.var_2890;
      }
      
      public function get screenY() : Number
      {
         return this.var_2889;
      }
      
      public function get localX() : Number
      {
         return this.var_2867;
      }
      
      public function get localY() : Number
      {
         return this.var_2871;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2652;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2651;
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
