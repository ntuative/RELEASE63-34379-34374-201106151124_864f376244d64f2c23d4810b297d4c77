package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2401:Number = 0.0;
      
      private var var_2399:Number = 0.0;
      
      private var var_2398:Number = 0.0;
      
      private var var_2400:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2401 = param1;
         this.var_2399 = param2;
         this.var_2398 = param3;
         this.var_2400 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2401;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2399;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2398;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2400;
      }
   }
}
