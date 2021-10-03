package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_144:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_149:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1184:String;
      
      private var var_1516:Array;
      
      private var var_1146:Array;
      
      private var var_2165:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1184 = param2;
         this.var_1516 = param3;
         this.var_1146 = param4;
         if(this.var_1146 == null)
         {
            this.var_1146 = [];
         }
         this.var_2165 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1184;
      }
      
      public function get choices() : Array
      {
         return this.var_1516.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1146.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2165;
      }
   }
}
