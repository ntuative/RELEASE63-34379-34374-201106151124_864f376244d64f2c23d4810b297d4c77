package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2338:int;
      
      private var var_2339:int;
      
      private var var_2340:int;
      
      private var var_2337:int;
      
      private var var_115:Array;
      
      private var var_252:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_115 = new Array();
         this.var_252 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2338 = param1.readInteger();
         this.var_2339 = param1.readInteger();
         this.var_2340 = param1.readInteger();
         this.var_2337 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_115.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_252.push(new FriendData(param1));
            _loc4_++;
         }
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2338;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2339;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2340;
      }
      
      public function get categories() : Array
      {
         return this.var_115;
      }
      
      public function get friends() : Array
      {
         return this.var_252;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2337;
      }
   }
}
