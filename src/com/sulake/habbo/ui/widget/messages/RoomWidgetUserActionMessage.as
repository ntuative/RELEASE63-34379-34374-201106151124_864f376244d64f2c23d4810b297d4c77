package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_658:String = "RWUAM_WHISPER_USER";
      
      public static const const_526:String = "RWUAM_IGNORE_USER";
      
      public static const const_580:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_454:String = "RWUAM_KICK_USER";
      
      public static const const_577:String = "RWUAM_BAN_USER";
      
      public static const const_645:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_527:String = "RWUAM_RESPECT_USER";
      
      public static const const_557:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_582:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_651:String = "RWUAM_START_TRADING";
      
      public static const const_935:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_520:String = "RWUAM_KICK_BOT";
      
      public static const const_523:String = "RWUAM_REPORT";
      
      public static const const_485:String = "RWUAM_PICKUP_PET";
      
      public static const const_1900:String = "RWUAM_TRAIN_PET";
      
      public static const const_558:String = " RWUAM_RESPECT_PET";
      
      public static const const_283:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_628:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
