package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_745:int = 1;
      
      public static const const_995:int = 2;
      
      public static const const_960:int = 3;
      
      public static const const_1322:int = 4;
      
      public static const const_966:int = 5;
      
      public static const const_1305:int = 6;
       
      
      private var _type:int;
      
      private var var_1174:int;
      
      private var var_2243:String;
      
      private var var_2242:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1174 = param2;
         this.var_2243 = param3;
         this.var_2242 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2243;
      }
      
      public function get time() : String
      {
         return this.var_2242;
      }
      
      public function get senderId() : int
      {
         return this.var_1174;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
