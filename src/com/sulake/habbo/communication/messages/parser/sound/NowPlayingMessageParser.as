package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1947:int;
      
      private var _currentPosition:int;
      
      private var var_1946:int;
      
      private var var_1945:int;
      
      private var var_1948:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1947;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1946;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1945;
      }
      
      public function get syncCount() : int
      {
         return this.var_1948;
      }
      
      public function flush() : Boolean
      {
         this.var_1947 = -1;
         this._currentPosition = -1;
         this.var_1946 = -1;
         this.var_1945 = -1;
         this.var_1948 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1947 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1946 = param1.readInteger();
         this.var_1945 = param1.readInteger();
         this.var_1948 = param1.readInteger();
         return true;
      }
   }
}
