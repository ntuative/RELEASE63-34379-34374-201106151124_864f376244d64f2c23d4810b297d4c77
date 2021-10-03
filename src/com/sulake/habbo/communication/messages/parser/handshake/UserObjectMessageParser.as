package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      private var var_1031:String;
      
      private var var_2886:String;
      
      private var var_1699:String;
      
      private var var_2885:int;
      
      private var var_2883:String;
      
      private var var_2887:int;
      
      private var var_2884:int;
      
      private var var_2379:int;
      
      private var var_1182:int;
      
      private var var_765:int;
      
      private var var_2377:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this._figure = param1.readString();
         this.var_1031 = param1.readString();
         this.var_2886 = param1.readString();
         this.var_1699 = param1.readString();
         this.var_2885 = param1.readInteger();
         this.var_2883 = param1.readString();
         this.var_2887 = param1.readInteger();
         this.var_2884 = param1.readInteger();
         this.var_2379 = param1.readInteger();
         this.var_1182 = param1.readInteger();
         this.var_765 = param1.readInteger();
         this.var_2377 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get sex() : String
      {
         return this.var_1031;
      }
      
      public function get customData() : String
      {
         return this.var_2886;
      }
      
      public function get realName() : String
      {
         return this.var_1699;
      }
      
      public function get tickets() : int
      {
         return this.var_2885;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2883;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2887;
      }
      
      public function get directMail() : int
      {
         return this.var_2884;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2379;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1182;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_765;
      }
      
      public function get identityId() : int
      {
         return this.var_2377;
      }
   }
}
