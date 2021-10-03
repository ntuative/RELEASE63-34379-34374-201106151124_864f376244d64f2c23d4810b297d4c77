package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2070:int = 1;
      
      public static const const_2234:int = 2;
      
      public static const const_2243:int = 3;
      
      public static const const_2077:int = 4;
      
      public static const const_1779:int = 5;
      
      public static const const_2124:int = 6;
      
      public static const const_1837:int = 7;
      
      public static const const_1966:int = 8;
      
      public static const const_2099:int = 9;
      
      public static const const_1799:int = 10;
      
      public static const const_1842:int = 11;
      
      public static const const_1964:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1774:int;
      
      private var var_643:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1774 = param1.readInteger();
         this.var_643 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1774;
      }
      
      public function get info() : String
      {
         return this.var_643;
      }
   }
}
