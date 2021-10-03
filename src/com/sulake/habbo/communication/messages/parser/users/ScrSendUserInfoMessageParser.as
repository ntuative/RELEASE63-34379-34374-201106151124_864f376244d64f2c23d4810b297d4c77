package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2203:int = 1;
      
      public static const const_1743:int = 2;
       
      
      private var var_956:String;
      
      private var var_2591:int;
      
      private var var_2590:int;
      
      private var var_2593:int;
      
      private var var_2599:int;
      
      private var var_2597:Boolean;
      
      private var var_2595:Boolean;
      
      private var var_2592:int;
      
      private var var_2598:int;
      
      private var var_2596:Boolean;
      
      private var var_2594:int;
      
      private var var_2589:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_956 = param1.readString();
         this.var_2591 = param1.readInteger();
         this.var_2590 = param1.readInteger();
         this.var_2593 = param1.readInteger();
         this.var_2599 = param1.readInteger();
         this.var_2597 = param1.readBoolean();
         this.var_2595 = param1.readBoolean();
         this.var_2592 = param1.readInteger();
         this.var_2598 = param1.readInteger();
         this.var_2596 = param1.readBoolean();
         this.var_2594 = param1.readInteger();
         this.var_2589 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_956;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2591;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2590;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2593;
      }
      
      public function get responseType() : int
      {
         return this.var_2599;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2597;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2595;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2592;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2598;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2596;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2594;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2589;
      }
   }
}
