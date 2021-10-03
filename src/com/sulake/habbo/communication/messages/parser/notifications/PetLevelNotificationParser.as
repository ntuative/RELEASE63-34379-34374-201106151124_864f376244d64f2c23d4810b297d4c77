package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1937:int;
      
      private var var_2615:String;
      
      private var var_1305:int;
      
      private var var_1188:int;
      
      private var var_1791:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1937 = param1.readInteger();
         this.var_2615 = param1.readString();
         this.var_1305 = param1.readInteger();
         this.var_1188 = param1.readInteger();
         this.var_1791 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get method_2() : int
      {
         return this.var_1937;
      }
      
      public function get petName() : String
      {
         return this.var_2615;
      }
      
      public function get level() : int
      {
         return this.var_1305;
      }
      
      public function get petType() : int
      {
         return this.var_1188;
      }
      
      public function get breed() : int
      {
         return this.var_1791;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
