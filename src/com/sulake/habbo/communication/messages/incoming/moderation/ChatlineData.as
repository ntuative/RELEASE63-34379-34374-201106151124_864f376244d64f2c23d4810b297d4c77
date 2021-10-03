package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2921:int;
      
      private var var_2924:int;
      
      private var var_2923:int;
      
      private var var_2922:String;
      
      private var var_1835:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2921 = param1.readInteger();
         this.var_2924 = param1.readInteger();
         this.var_2923 = param1.readInteger();
         this.var_2922 = param1.readString();
         this.var_1835 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2921;
      }
      
      public function get minute() : int
      {
         return this.var_2924;
      }
      
      public function get chatterId() : int
      {
         return this.var_2923;
      }
      
      public function get chatterName() : String
      {
         return this.var_2922;
      }
      
      public function get msg() : String
      {
         return this.var_1835;
      }
   }
}
