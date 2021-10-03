package com.sulake.habbo.advertisement.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class AdEvent extends Event
   {
      
      public static const const_822:String = "AE_ROOM_AD_IMAGE_LOADED";
      
      public static const const_1192:String = "AE_ROOM_AD_IMAGE_LOADING_FAILED";
      
      public static const const_514:String = "AE_ROOM_AD_SHOW";
       
      
      private var var_47:BitmapData;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var _imageUrl:String;
      
      private var var_1213:String;
      
      private var var_2660:BitmapData;
      
      private var var_2659:BitmapData;
      
      private var var_235:int;
      
      private var var_2395:int;
      
      public function AdEvent(param1:String, param2:int, param3:int, param4:BitmapData = null, param5:String = "", param6:String = "", param7:BitmapData = null, param8:BitmapData = null, param9:int = -1, param10:int = -1, param11:Boolean = false, param12:Boolean = false)
      {
         super(param1,param11,param12);
         this.var_47 = param4;
         this._roomId = param2;
         this._roomCategory = param3;
         this._imageUrl = param5;
         this.var_1213 = param6;
         this.var_2660 = param7;
         this.var_2659 = param8;
         this.var_235 = param9;
         this.var_2395 = param10;
      }
      
      public function get image() : BitmapData
      {
         return this.var_47;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get imageUrl() : String
      {
         return this._imageUrl;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1213;
      }
      
      public function get adWarningL() : BitmapData
      {
         return this.var_2660;
      }
      
      public function get adWarningR() : BitmapData
      {
         return this.var_2659;
      }
      
      public function get objectId() : int
      {
         return this.var_235;
      }
      
      public function get objectCategory() : int
      {
         return this.var_2395;
      }
   }
}
