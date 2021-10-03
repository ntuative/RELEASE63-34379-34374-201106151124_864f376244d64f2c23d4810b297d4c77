package com.sulake.habbo.communication.messages.parser.inventory.trading
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TradingOpenParser implements IMessageParser
   {
       
      
      private var _userID:int;
      
      private var var_1909:Boolean;
      
      private var var_1910:int;
      
      private var var_1908:Boolean;
      
      public function TradingOpenParser()
      {
         super();
      }
      
      public function get userID() : int
      {
         return this._userID;
      }
      
      public function get userCanTrade() : Boolean
      {
         return this.var_1909;
      }
      
      public function get otherUserID() : int
      {
         return this.var_1910;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return this.var_1908;
      }
      
      public function flush() : Boolean
      {
         this._userID = -1;
         this.var_1909 = false;
         this.var_1910 = -1;
         this.var_1908 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._userID = param1.readInteger();
         this.var_1909 = param1.readInteger() == 1;
         this.var_1910 = param1.readInteger();
         this.var_1908 = param1.readInteger() == 1;
         return true;
      }
   }
}
