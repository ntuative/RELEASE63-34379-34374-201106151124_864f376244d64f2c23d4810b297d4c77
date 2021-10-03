package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1247:int = 1;
      
      public static const const_968:int = 2;
      
      public static const const_739:int = 3;
      
      public static const const_1692:int = 4;
       
      
      private var _index:int;
      
      private var var_2607:String;
      
      private var var_2606:String;
      
      private var var_2603:Boolean;
      
      private var var_2604:String;
      
      private var var_1099:String;
      
      private var var_2605:int;
      
      private var var_2485:int;
      
      private var _type:int;
      
      private var var_2319:String;
      
      private var var_1005:GuestRoomData;
      
      private var var_1006:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2607 = param1.readString();
         this.var_2606 = param1.readString();
         this.var_2603 = param1.readInteger() == 1;
         this.var_2604 = param1.readString();
         this.var_1099 = param1.readString();
         this.var_2605 = param1.readInteger();
         this.var_2485 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1247)
         {
            this.var_2319 = param1.readString();
         }
         else if(this._type == const_739)
         {
            this.var_1006 = new PublicRoomData(param1);
         }
         else if(this._type == const_968)
         {
            this.var_1005 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1005 != null)
         {
            this.var_1005.dispose();
            this.var_1005 = null;
         }
         if(this.var_1006 != null)
         {
            this.var_1006.dispose();
            this.var_1006 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2607;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2606;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2603;
      }
      
      public function get picText() : String
      {
         return this.var_2604;
      }
      
      public function get picRef() : String
      {
         return this.var_1099;
      }
      
      public function get folderId() : int
      {
         return this.var_2605;
      }
      
      public function get tag() : String
      {
         return this.var_2319;
      }
      
      public function get userCount() : int
      {
         return this.var_2485;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1005;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1006;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1247)
         {
            return 0;
         }
         if(this.type == const_968)
         {
            return this.var_1005.maxUserCount;
         }
         if(this.type == const_739)
         {
            return this.var_1006.maxUsers;
         }
         return 0;
      }
   }
}
