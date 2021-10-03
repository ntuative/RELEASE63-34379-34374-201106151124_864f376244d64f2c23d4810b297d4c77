package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1305:int;
      
      private var var_1841:String;
      
      private var var_1830:int;
      
      private var var_2450:int;
      
      private var var_2449:int;
      
      private var var_1831:int;
      
      private var var_1829:Boolean;
      
      private var _category:String;
      
      private var var_2448:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1305 = param1.readInteger();
         this.var_1841 = param1.readString();
         this.var_1830 = Math.max(1,param1.readInteger());
         this.var_2450 = param1.readInteger();
         this.var_2449 = param1.readInteger();
         this.var_1831 = param1.readInteger();
         this.var_1829 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2448 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_1841;
      }
      
      public function get level() : int
      {
         return this.var_1305;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1830;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2450;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2449;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1831;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1829;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2448;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1305 > 1 || this.var_1829;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1831 = this.var_1830;
      }
   }
}
