package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_500:String = "RWTDUE_TEASER_DATA";
      
      public static const const_807:String = "RWTDUE_GIFT_DATA";
      
      public static const const_938:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_235:int;
      
      private var _data:String;
      
      private var var_425:int;
      
      private var var_194:String;
      
      private var var_2332:String;
      
      private var var_2333:Boolean;
      
      private var var_1489:int = 0;
      
      private var var_2745:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_235;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_425;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2332;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2333;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2745;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1489;
      }
      
      public function set status(param1:int) : void
      {
         this.var_425 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2332 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2333 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2745 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_235 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_194;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_194 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1489 = param1;
      }
   }
}
