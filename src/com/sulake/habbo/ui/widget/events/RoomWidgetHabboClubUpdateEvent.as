package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_265:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2301:int = 0;
      
      private var var_2304:int = 0;
      
      private var var_2302:int = 0;
      
      private var var_2303:Boolean = false;
      
      private var var_1783:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_265,param6,param7);
         this.var_2301 = param1;
         this.var_2304 = param2;
         this.var_2302 = param3;
         this.var_2303 = param4;
         this.var_1783 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2301;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2304;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2302;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2303;
      }
      
      public function get clubLevel() : int
      {
         return this.var_1783;
      }
   }
}
