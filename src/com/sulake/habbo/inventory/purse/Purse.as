package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2163:int = 0;
      
      private var var_2164:int = 0;
      
      private var var_2943:int = 0;
      
      private var var_2944:Boolean = false;
      
      private var var_2595:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2163 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2164 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2943 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2944 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2595 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2163;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2164;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2943;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2944;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2595;
      }
   }
}
