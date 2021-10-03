package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2410:int = 0;
      
      private var var_1427:String = "";
      
      private var var_1719:String = "";
      
      private var var_2296:String = "";
      
      private var var_2850:String = "";
      
      private var var_2077:int = 0;
      
      private var var_2851:int = 0;
      
      private var var_2853:int = 0;
      
      private var var_1429:int = 0;
      
      private var var_2852:int = 0;
      
      private var var_1426:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2410 = param1;
         this.var_1427 = param2;
         this.var_1719 = param3;
         this.var_2296 = param4;
         this.var_2850 = param5;
         if(param6)
         {
            this.var_2077 = 1;
         }
         else
         {
            this.var_2077 = 0;
         }
         this.var_2851 = param7;
         this.var_2853 = param8;
         this.var_1429 = param9;
         this.var_2852 = param10;
         this.var_1426 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2410,this.var_1427,this.var_1719,this.var_2296,this.var_2850,this.var_2077,this.var_2851,this.var_2853,this.var_1429,this.var_2852,this.var_1426];
      }
   }
}
