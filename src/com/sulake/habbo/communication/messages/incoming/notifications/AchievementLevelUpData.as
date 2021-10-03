package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1305:int;
      
      private var var_1917:int;
      
      private var var_2450:int;
      
      private var var_2449:int;
      
      private var var_2515:int;
      
      private var var_1841:int;
      
      private var var_2864:String = "";
      
      private var var_2865:String = "";
      
      private var var_2866:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1305 = param1.readInteger();
         this.var_1841 = param1.readInteger();
         this.var_2864 = param1.readString();
         this.var_1917 = param1.readInteger();
         this.var_2450 = param1.readInteger();
         this.var_2449 = param1.readInteger();
         this.var_2515 = param1.readInteger();
         this.var_2866 = param1.readInteger();
         this.var_2865 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1305;
      }
      
      public function get points() : int
      {
         return this.var_1917;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2450;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2449;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_2515;
      }
      
      public function get badgeId() : int
      {
         return this.var_1841;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2864;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2865;
      }
      
      public function get achievementID() : int
      {
         return this.var_2866;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
