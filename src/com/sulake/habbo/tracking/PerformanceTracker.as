package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var _connection:IConnection = null;
      
      private var var_182:IHabboConfigurationManager = null;
      
      private var var_602:int = 0;
      
      private var var_516:Number = 0;
      
      private var var_3018:Array;
      
      private var var_1427:String = "";
      
      private var var_1719:String = "";
      
      private var var_2296:String = "";
      
      private var var_2850:String = "";
      
      private var var_2077:Boolean = false;
      
      private var var_1716:GarbageMonitor = null;
      
      private var var_1429:int = 0;
      
      private var var_2295:Boolean;
      
      private var var_1717:int = 1000;
      
      private var var_1426:int = 0;
      
      private var _reportInterval:int = 60;
      
      private var var_1720:int = 0;
      
      private var var_1718:int = 10;
      
      private var var_1428:int = 0;
      
      private var var_2299:Number = 0.15;
      
      private var var_2298:Boolean = true;
      
      private var var_2297:Number = 0;
      
      public function PerformanceTracker()
      {
         this.var_3018 = [];
         super();
         this.var_1719 = Capabilities.version;
         this.var_2296 = Capabilities.os;
         this.var_2077 = Capabilities.isDebugger;
         this.var_1427 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1427 == null)
         {
            this.var_1427 = "unknown";
         }
         this.var_1716 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_1720 = getTimer();
      }
      
      public function get flashVersion() : String
      {
         return this.var_1719;
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_516;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_1717 = param1;
      }
      
      public function set reportInterval(param1:int) : void
      {
         this._reportInterval = param1;
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_1718 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this.var_182 = param1;
         this._reportInterval = int(this.var_182.getKey("performancetest.interval","60"));
         this.var_1717 = int(this.var_182.getKey("performancetest.slowupdatelimit","1000"));
         this.var_1718 = int(this.var_182.getKey("performancetest.reportlimit","10"));
         this.var_2299 = Number(this.var_182.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_2298 = Boolean(int(this.var_182.getKey("performancetest.distribution.enabled","1")));
         this.var_2295 = Boolean(this.var_182.getKey("monitor.garbage.collection","0") == "1");
      }
      
      public function dispose() : void
      {
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_1716.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_1716.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function update(param1:uint, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Number = NaN;
         if(this.var_2295)
         {
            _loc4_ = this.updateGarbageMonitor();
            if(_loc4_ != null)
            {
               ++this.var_1429;
               Logger.log("Garbage collection");
            }
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_1717)
         {
            ++this.var_1426;
            _loc3_ = true;
         }
         else
         {
            ++this.var_602;
            if(this.var_602 <= 1)
            {
               this.var_516 = param1;
            }
            else
            {
               _loc5_ = Number(this.var_602);
               this.var_516 = this.var_516 * (_loc5_ - 1) / _loc5_ + Number(param1) / _loc5_;
            }
         }
         if(param2 - this.var_1720 > this._reportInterval * 1000 && this.var_1428 < this.var_1718)
         {
            _loc6_ = 0;
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_516 + "/s, system memory usage : " + _loc6_ + " bytes");
            _loc7_ = true;
            if(this.var_2298 && this.var_1428 > 0)
            {
               _loc8_ = this.differenceInPercents(this.var_2297,this.var_516);
               if(_loc8_ < this.var_2299)
               {
                  _loc7_ = false;
               }
            }
            this.var_1720 = param2;
            if(_loc7_ || _loc3_)
            {
               this.var_2297 = this.var_516;
               if(this.sendReport(param2))
               {
                  ++this.var_1428;
               }
            }
         }
      }
      
      private function sendReport(param1:int) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._connection != null)
         {
            _loc2_ = null;
            _loc3_ = param1 / 1000;
            _loc4_ = -1;
            _loc5_ = 0;
            _loc2_ = new PerformanceLogMessageComposer(_loc3_,this.var_1427,this.var_1719,this.var_2296,this.var_2850,this.var_2077,_loc5_,_loc4_,this.var_1429,this.var_516,this.var_1426);
            this._connection.send(_loc2_);
            this.var_1429 = 0;
            this.var_516 = 0;
            this.var_602 = 0;
            this.var_1426 = 0;
            return true;
         }
         return false;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
   }
}
