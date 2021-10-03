package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_534:QuestsList;
      
      private var var_444:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_372:QuestTracker;
      
      private var var_629:NextQuestTimer;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_372 = new QuestTracker(this._questEngine);
         this.var_534 = new QuestsList(this._questEngine);
         this.var_444 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_629 = new NextQuestTimer(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_534.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_534.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_372.onQuest(param1);
         this.var_444.onQuest(param1);
         this._questCompleted.onQuest(param1);
         this.var_629.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_372.onQuestCompleted(param1);
         this.var_444.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_372.onQuestCancelled();
         this.var_444.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
         this.var_629.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_372.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_534.onRoomExit();
         this.var_372.onRoomExit();
         this.var_444.onRoomExit();
         this.var_629.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_372.update(param1);
         this.var_629.update(param1);
         this.var_534.update(param1);
         this.var_444.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_534)
         {
            this.var_534.dispose();
            this.var_534 = null;
         }
         if(this.var_372)
         {
            this.var_372.dispose();
            this.var_372 = null;
         }
         if(this.var_444)
         {
            this.var_444.dispose();
            this.var_444 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_629)
         {
            this.var_629.dispose();
            this.var_629 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_534;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_444;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_372;
      }
   }
}
