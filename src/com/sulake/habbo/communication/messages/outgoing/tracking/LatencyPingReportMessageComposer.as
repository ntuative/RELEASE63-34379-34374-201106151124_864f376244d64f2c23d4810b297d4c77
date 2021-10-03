package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2427:int;
      
      private var var_2429:int;
      
      private var var_2428:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2427 = param1;
         this.var_2429 = param2;
         this.var_2428 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2427,this.var_2429,this.var_2428];
      }
      
      public function dispose() : void
      {
      }
   }
}
