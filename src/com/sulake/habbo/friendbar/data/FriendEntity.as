package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
      
      private static var var_1328:int = 0;
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1118:int;
      
      private var var_827:Boolean;
      
      private var _allowFollow:Boolean;
      
      private var _figure:String;
      
      private var var_1623:int;
      
      private var var_1701:String;
      
      private var var_1700:String;
      
      private var var_1699:String;
      
      private var var_1101:Vector.<FriendNotification>;
      
      private var var_2800:int = -1;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1699 = param3;
         this.var_1701 = param4;
         this.var_1118 = param5;
         this.var_827 = param6;
         this._allowFollow = param7;
         this._figure = param8;
         this.var_1623 = param9;
         this.var_1700 = param10;
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
      
      public function get allowFollow() : Boolean
      {
         return this._allowFollow;
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
      
      public function get logEventId() : int
      {
         return this.var_2800;
      }
      
      public function get notifications() : Vector.<FriendNotification>
      {
         if(!this.var_1101)
         {
            this.var_1101 = new Vector.<FriendNotification>();
         }
         return this.var_1101;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_1118 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_827 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this._allowFollow = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1623 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1701 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1700 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1699 = param1;
      }
      
      public function set logEventId(param1:int) : void
      {
         this.var_2800 = param1;
      }
      
      public function getNextLogEventId() : int
      {
         return ++var_1328;
      }
   }
}
