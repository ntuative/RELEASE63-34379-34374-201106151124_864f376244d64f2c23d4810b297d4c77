package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetPetCommandMessage extends RoomWidgetMessage
   {
      
      public static const const_901:String = "RWPCM_REQUEST_PET_COMMANDS";
      
      public static const const_497:String = "RWPCM_PET_COMMAND";
       
      
      private var var_1937:int = 0;
      
      private var var_190:String;
      
      public function RoomWidgetPetCommandMessage(param1:String, param2:int, param3:String = null)
      {
         super(param1);
         this.var_1937 = param2;
         this.var_190 = param3;
      }
      
      public function get method_2() : int
      {
         return this.var_1937;
      }
      
      public function get value() : String
      {
         return this.var_190;
      }
   }
}
