package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1118:int;
      
      private var var_827:Boolean;
      
      private var var_1698:Boolean;
      
      private var _figure:String;
      
      private var var_1623:int;
      
      private var var_1701:String;
      
      private var var_1700:String;
      
      private var var_1699:String;
      
      private var var_2905:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_1118 = param1.readInteger();
         this.var_827 = param1.readBoolean();
         this.var_1698 = param1.readBoolean();
         this._figure = param1.readString();
         this.var_1623 = param1.readInteger();
         this.var_1701 = param1.readString();
         this.var_1700 = param1.readString();
         this.var_1699 = param1.readString();
         this.var_2905 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_1118;
      }
      
      public function get online() : Boolean
      {
         return this.var_827;
      }
      
      public function get method_1() : Boolean
      {
         return this.var_1698;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get categoryId() : int
      {
         return this.var_1623;
      }
      
      public function get motto() : String
      {
         return this.var_1701;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1700;
      }
      
      public function get realName() : String
      {
         return this.var_1699;
      }
      
      public function get facebookId() : String
      {
         return this.var_2905;
      }
   }
}
