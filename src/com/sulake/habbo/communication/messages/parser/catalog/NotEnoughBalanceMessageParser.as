package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1819:int = 0;
      
      private var var_1818:int = 0;
      
      private var var_1786:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1819;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1818;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1786;
      }
      
      public function flush() : Boolean
      {
         this.var_1819 = 0;
         this.var_1818 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1819 = param1.readInteger();
         this.var_1818 = param1.readInteger();
         this.var_1786 = param1.readInteger();
         return true;
      }
   }
}
