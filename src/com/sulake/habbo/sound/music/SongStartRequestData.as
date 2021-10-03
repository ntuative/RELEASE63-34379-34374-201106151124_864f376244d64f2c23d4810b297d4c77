package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1704:int;
      
      private var var_1802:Number;
      
      private var var_2391:Number;
      
      private var var_2390:int;
      
      private var var_2388:Number;
      
      private var var_2389:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1704 = param1;
         this.var_1802 = param2;
         this.var_2391 = param3;
         this.var_2388 = param4;
         this.var_2389 = param5;
         this.var_2390 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1704;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1802 < 0)
         {
            return 0;
         }
         return this.var_1802 + (getTimer() - this.var_2390) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2391;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2388;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2389;
      }
   }
}
