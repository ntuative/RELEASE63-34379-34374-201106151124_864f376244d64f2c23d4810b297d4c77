package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_362:int;
      
      private var var_870:Boolean;
      
      private var var_967:String;
      
      private var _ownerName:String;
      
      private var var_2581:int;
      
      private var var_2485:int;
      
      private var var_2583:int;
      
      private var var_1840:String;
      
      private var var_2586:int;
      
      private var var_2582:Boolean;
      
      private var var_880:int;
      
      private var var_1623:int;
      
      private var var_2585:String;
      
      private var var_922:Array;
      
      private var var_2588:RoomThumbnailData;
      
      private var var_2587:Boolean;
      
      private var var_2584:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_922 = new Array();
         super();
         this.var_362 = param1.readInteger();
         this.var_870 = param1.readBoolean();
         this.var_967 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2581 = param1.readInteger();
         this.var_2485 = param1.readInteger();
         this.var_2583 = param1.readInteger();
         this.var_1840 = param1.readString();
         this.var_2586 = param1.readInteger();
         this.var_2582 = param1.readBoolean();
         this.var_880 = param1.readInteger();
         this.var_1623 = param1.readInteger();
         this.var_2585 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_922.push(_loc4_);
            _loc3_++;
         }
         this.var_2588 = new RoomThumbnailData(param1);
         this.var_2587 = param1.readBoolean();
         this.var_2584 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_922 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_362;
      }
      
      public function get event() : Boolean
      {
         return this.var_870;
      }
      
      public function get roomName() : String
      {
         return this.var_967;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2581;
      }
      
      public function get userCount() : int
      {
         return this.var_2485;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2583;
      }
      
      public function get description() : String
      {
         return this.var_1840;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2586;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2582;
      }
      
      public function get score() : int
      {
         return this.var_880;
      }
      
      public function get categoryId() : int
      {
         return this.var_1623;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2585;
      }
      
      public function get tags() : Array
      {
         return this.var_922;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2588;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2587;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2584;
      }
   }
}
