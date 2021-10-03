package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1751:int;
      
      private var var_2342:int;
      
      private var var_1569:int;
      
      private var var_2341:int;
      
      private var var_129:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1751 = param1.readInteger();
         this.var_2342 = param1.readInteger();
         this.var_1569 = param1.readInteger();
         this.var_2341 = param1.readInteger();
         this.var_129 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1751);
      }
      
      public function get callId() : int
      {
         return this.var_1751;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2342;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1569;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2341;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_129;
      }
   }
}
