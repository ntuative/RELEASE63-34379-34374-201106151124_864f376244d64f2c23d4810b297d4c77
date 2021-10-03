package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_2054:int = 0;
      
      private var var_1668:Dictionary;
      
      private var var_2163:int = 0;
      
      private var var_2164:int = 0;
      
      private var var_2595:Boolean = false;
      
      private var var_2592:int = 0;
      
      private var var_2598:int = 0;
      
      public function Purse()
      {
         this.var_1668 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2054;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2054 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2163;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2163 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2164;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2164 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_2163 > 0 || this.var_2164 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2595;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2595 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2592;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2592 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2598;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2598 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1668;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1668 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1668[param1];
      }
   }
}
