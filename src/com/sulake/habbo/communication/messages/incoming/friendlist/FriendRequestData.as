package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1222:int;
      
      private var var_2642:String;
      
      private var var_2643:int;
      
      private var var_2683:String;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1222 = param1.readInteger();
         this.var_2642 = param1.readString();
         this.var_2683 = param1.readString();
         this.var_2643 = this.var_1222;
      }
      
      public function get requestId() : int
      {
         return this.var_1222;
      }
      
      public function get requesterName() : String
      {
         return this.var_2642;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2643;
      }
      
      public function get figureString() : String
      {
         return this.var_2683;
      }
   }
}
