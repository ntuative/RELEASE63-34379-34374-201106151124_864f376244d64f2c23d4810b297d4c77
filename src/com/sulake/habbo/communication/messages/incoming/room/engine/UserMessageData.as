package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1276:String = "M";
      
      public static const const_1713:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_185:Number = 0;
      
      private var var_186:Number = 0;
      
      private var var_435:int = 0;
      
      private var _name:String = "";
      
      private var var_1682:int = 0;
      
      private var var_1031:String = "";
      
      private var _figure:String = "";
      
      private var var_2632:String = "";
      
      private var var_2394:int;
      
      private var var_2634:int = 0;
      
      private var var_2630:String = "";
      
      private var var_2629:int = 0;
      
      private var var_2631:int = 0;
      
      private var var_2633:String = "";
      
      private var var_196:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_196 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_196)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_185;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_196)
         {
            this.var_185 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_186;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_196)
         {
            this.var_186 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_435;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_435 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_196)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1682;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_1682 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_1031;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_196)
         {
            this.var_1031 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_196)
         {
            this._figure = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2632;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_196)
         {
            this.var_2632 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2394;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_2394 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2634;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_2634 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2630;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_196)
         {
            this.var_2630 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2629;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_2629 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2631;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_196)
         {
            this.var_2631 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2633;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_196)
         {
            this.var_2633 = param1;
         }
      }
   }
}
