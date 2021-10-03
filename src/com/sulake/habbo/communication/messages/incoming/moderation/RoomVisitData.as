package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_2059:Boolean;
      
      private var _roomId:int;
      
      private var var_967:String;
      
      private var var_2734:int;
      
      private var var_2733:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2059 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_967 = param1.readString();
         this.var_2734 = param1.readInteger();
         this.var_2733 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_2059;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_967;
      }
      
      public function get enterHour() : int
      {
         return this.var_2734;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2733;
      }
   }
}
