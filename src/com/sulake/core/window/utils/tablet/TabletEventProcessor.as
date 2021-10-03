package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_3066:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_95 = param1.desktop;
         var_71 = param1.var_1383 as WindowController;
         var_189 = param1.var_1385 as WindowController;
         var_175 = param1.renderer;
         var_915 = param1.var_1384;
         param2.begin();
         param2.end();
         param1.desktop = var_95;
         param1.var_1383 = var_71;
         param1.var_1385 = var_189;
         param1.renderer = var_175;
         param1.var_1384 = var_915;
      }
   }
}
