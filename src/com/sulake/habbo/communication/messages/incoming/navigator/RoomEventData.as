package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1944:Boolean;
      
      private var var_2688:int;
      
      private var var_2690:String;
      
      private var var_362:int;
      
      private var var_2692:int;
      
      private var var_1998:String;
      
      private var var_2691:String;
      
      private var var_2689:String;
      
      private var var_922:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_922 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1944 = false;
            return;
         }
         this.var_1944 = true;
         this.var_2688 = int(_loc2_);
         this.var_2690 = param1.readString();
         this.var_362 = int(param1.readString());
         this.var_2692 = param1.readInteger();
         this.var_1998 = param1.readString();
         this.var_2691 = param1.readString();
         this.var_2689 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_922.push(_loc5_);
            _loc4_++;
         }
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
      
      public function get ownerAvatarId() : int
      {
         return this.var_2688;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2690;
      }
      
      public function get flatId() : int
      {
         return this.var_362;
      }
      
      public function get eventType() : int
      {
         return this.var_2692;
      }
      
      public function get eventName() : String
      {
         return this.var_1998;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2691;
      }
      
      public function get creationTime() : String
      {
         return this.var_2689;
      }
      
      public function get tags() : Array
      {
         return this.var_922;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1944;
      }
   }
}
