package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_3026:uint;
      
      private var _root:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_667:IWindowContext;
      
      private var var_1193:IMouseDraggingService;
      
      private var var_1196:IMouseScalingService;
      
      private var var_1195:IMouseListenerService;
      
      private var var_1191:IFocusManagerService;
      
      private var var_1194:IToolTipAgentService;
      
      private var var_1192:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_3026 = 0;
         this._root = param2;
         this.var_667 = param1;
         this.var_1193 = new WindowMouseDragger(param2);
         this.var_1196 = new WindowMouseScaler(param2);
         this.var_1195 = new WindowMouseListener(param2);
         this.var_1191 = new FocusManager(param2);
         this.var_1194 = new WindowToolTipAgent(param2);
         this.var_1192 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1193 != null)
         {
            this.var_1193.dispose();
            this.var_1193 = null;
         }
         if(this.var_1196 != null)
         {
            this.var_1196.dispose();
            this.var_1196 = null;
         }
         if(this.var_1195 != null)
         {
            this.var_1195.dispose();
            this.var_1195 = null;
         }
         if(this.var_1191 != null)
         {
            this.var_1191.dispose();
            this.var_1191 = null;
         }
         if(this.var_1194 != null)
         {
            this.var_1194.dispose();
            this.var_1194 = null;
         }
         if(this.var_1192 != null)
         {
            this.var_1192.dispose();
            this.var_1192 = null;
         }
         this._root = null;
         this.var_667 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1193;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1196;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1195;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1191;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1194;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1192;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
