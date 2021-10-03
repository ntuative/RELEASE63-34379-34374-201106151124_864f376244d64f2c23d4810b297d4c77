package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_316:String = "RWFIUE_FURNI";
       
      
      private var _id:int = 0;
      
      private var _category:int = 0;
      
      private var _name:String = "";
      
      private var var_1840:String = "";
      
      private var var_47:BitmapData = null;
      
      private var var_2677:Boolean = false;
      
      private var var_2676:Boolean = false;
      
      private var var_2142:Boolean = false;
      
      private var var_2140:Boolean = false;
      
      private var var_2675:Boolean = false;
      
      private var var_2080:int = -1;
      
      private var var_2284:int = -1;
      
      private var var_1368:int = -1;
      
      private var var_1090:String = "";
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1840 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1840;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_47 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_47;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         this.var_2677 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return this.var_2677;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         this.var_2676 = param1;
      }
      
      public function get isStickie() : Boolean
      {
         return this.var_2676;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_2142 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_2142;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_2140 = param1;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_2140;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         this.var_2675 = param1;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_2675;
      }
      
      public function set expiration(param1:int) : void
      {
         this.var_2080 = param1;
      }
      
      public function get expiration() : int
      {
         return this.var_2080;
      }
      
      public function set catalogPageId(param1:int) : void
      {
         this.var_2284 = param1;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2284;
      }
      
      public function set offerId(param1:int) : void
      {
         this.var_1368 = param1;
      }
      
      public function get offerId() : int
      {
         return this.var_1368;
      }
      
      public function set extraParam(param1:String) : void
      {
         this.var_1090 = param1;
      }
      
      public function get extraParam() : String
      {
         return this.var_1090;
      }
   }
}
