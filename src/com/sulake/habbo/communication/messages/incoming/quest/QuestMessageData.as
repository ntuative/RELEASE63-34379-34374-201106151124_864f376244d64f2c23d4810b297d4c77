package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1763:String;
      
      private var var_1759:int;
      
      private var var_1760:int;
      
      private var var_1786:int;
      
      private var _id:int;
      
      private var var_1758:Boolean;
      
      private var _type:String;
      
      private var var_2359:String;
      
      private var var_2361:int;
      
      private var var_1761:String;
      
      private var var_2358:int;
      
      private var var_2360:int;
      
      private var var_1452:int;
      
      private var var_1762:Date;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         this.var_1762 = new Date();
         super();
         this.var_1763 = param1.readString();
         this.var_1759 = param1.readInteger();
         this.var_1760 = param1.readInteger();
         this.var_1786 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1758 = param1.readBoolean();
         this._type = param1.readString();
         this.var_2359 = param1.readString();
         this.var_2361 = param1.readInteger();
         this.var_1761 = param1.readString();
         this.var_2358 = param1.readInteger();
         this.var_2360 = param1.readInteger();
         this.var_1452 = param1.readInteger();
      }
      
      public function get campaignCode() : String
      {
         return this.var_1763;
      }
      
      public function get localizationCode() : String
      {
         return this.var_1761;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_1759;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_1760;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1786;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_1758;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_2359;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_2361;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2358;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2360;
      }
      
      public function get waitPeriodSeconds() : int
      {
         if(this.var_1452 < 1)
         {
            return 0;
         }
         var _loc1_:Date = new Date();
         var _loc2_:int = _loc1_.getTime() - this.var_1762.getTime();
         return int(Math.max(0,this.var_1452 - Math.floor(_loc2_ / 1000)));
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1763;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_1761;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_1758 = param1;
      }
      
      public function get lastQuestInCampaign() : Boolean
      {
         return this.var_1759 >= this.var_1760;
      }
      
      public function get receiveTime() : Date
      {
         return this.var_1762;
      }
      
      public function set waitPeriodSeconds(param1:int) : void
      {
         this.var_1452 = param1;
      }
   }
}
