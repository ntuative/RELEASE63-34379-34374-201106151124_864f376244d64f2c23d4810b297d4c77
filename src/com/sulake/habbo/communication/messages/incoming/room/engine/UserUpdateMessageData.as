package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_185:Number = 0;
      
      private var var_186:Number = 0;
      
      private var var_2274:Number = 0;
      
      private var var_2272:Number = 0;
      
      private var var_2273:Number = 0;
      
      private var var_2276:Number = 0;
      
      private var var_435:int = 0;
      
      private var var_2271:int = 0;
      
      private var var_353:Array;
      
      private var var_2275:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_353 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_185 = param3;
         this.var_186 = param4;
         this.var_2274 = param5;
         this.var_435 = param6;
         this.var_2271 = param7;
         this.var_2272 = param8;
         this.var_2273 = param9;
         this.var_2276 = param10;
         this.var_2275 = param11;
         this.var_353 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_185;
      }
      
      public function get z() : Number
      {
         return this.var_186;
      }
      
      public function get localZ() : Number
      {
         return this.var_2274;
      }
      
      public function get targetX() : Number
      {
         return this.var_2272;
      }
      
      public function get targetY() : Number
      {
         return this.var_2273;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2276;
      }
      
      public function get dir() : int
      {
         return this.var_435;
      }
      
      public function get dirHead() : int
      {
         return this.var_2271;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2275;
      }
      
      public function get actions() : Array
      {
         return this.var_353.slice();
      }
   }
}
