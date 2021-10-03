package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_362:int;
      
      private var var_2485:int;
      
      private var var_2486:Boolean;
      
      private var var_2484:int;
      
      private var _ownerName:String;
      
      private var var_129:RoomData;
      
      private var var_870:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_362 = param1.readInteger();
         this.var_2485 = param1.readInteger();
         this.var_2486 = param1.readBoolean();
         this.var_2484 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_129 = new RoomData(param1);
         this.var_870 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_129 != null)
         {
            this.var_129.dispose();
            this.var_129 = null;
         }
         if(this.var_870 != null)
         {
            this.var_870.dispose();
            this.var_870 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_362;
      }
      
      public function get userCount() : int
      {
         return this.var_2485;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2486;
      }
      
      public function get ownerId() : int
      {
         return this.var_2484;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_129;
      }
      
      public function get event() : RoomData
      {
         return this.var_870;
      }
   }
}
