package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1411:IHabboTracking;
      
      private var var_2153:Boolean = false;
      
      private var var_2775:int = 0;
      
      private var var_2011:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1411 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1411 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2153 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2775 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2153)
         {
            return;
         }
         ++this.var_2011;
         if(this.var_2011 <= this.var_2775)
         {
            this.var_1411.trackGoogle("toolbar",param1);
         }
      }
   }
}
