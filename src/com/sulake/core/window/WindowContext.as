package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_596:uint = 0;
      
      public static const const_1977:uint = 1;
      
      public static const const_2257:int = 0;
      
      public static const const_2069:int = 1;
      
      public static const const_2246:int = 2;
      
      public static const const_2179:int = 3;
      
      public static const const_1952:int = 4;
      
      public static const const_458:int = 5;
      
      public static var var_421:IEventQueue;
      
      private static var var_696:IEventProcessor;
      
      private static var var_2030:uint = const_596;
      
      private static var stage:Stage;
      
      private static var var_175:IWindowRenderer;
       
      
      private var var_2798:EventProcessorState;
      
      private var var_2797:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_145:DisplayObjectContainer;
      
      protected var var_3051:Boolean = true;
      
      protected var var_1387:Error;
      
      protected var var_2223:int = -1;
      
      protected var var_1401:IInternalWindowServices;
      
      protected var var_1677:IWindowParser;
      
      protected var var_2999:IWindowFactory;
      
      protected var var_95:IDesktopWindow;
      
      protected var var_1678:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_595:Boolean = false;
      
      private var var_2799:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_175 = param2;
         this._localization = param4;
         this.var_145 = param5;
         this.var_1401 = new ServiceManager(this,param5);
         this.var_2999 = param3;
         this.var_1677 = new WindowParser(this);
         this.var_2797 = param7;
         if(!stage)
         {
            if(this.var_145 is Stage)
            {
               stage = this.var_145 as Stage;
            }
            else if(this.var_145.stage)
            {
               stage = this.var_145.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_95 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_95.limits.maxWidth = param6.width;
         this.var_95.limits.maxHeight = param6.height;
         this.var_145.addChild(this.var_95.getDisplayObject());
         this.var_145.doubleClickEnabled = true;
         this.var_145.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2798 = new EventProcessorState(var_175,this.var_95,this.var_95,null,this.var_2797);
         inputMode = const_596;
         this.var_1678 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_2030;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_421)
         {
            if(var_421 is IDisposable)
            {
               IDisposable(var_421).dispose();
            }
         }
         if(var_696)
         {
            if(var_696 is IDisposable)
            {
               IDisposable(var_696).dispose();
            }
         }
         switch(value)
         {
            case const_596:
               var_421 = new MouseEventQueue(stage);
               var_696 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1977:
               var_421 = new TabletEventQueue(stage);
               var_696 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_596;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_145.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_145.removeChild(IGraphicContextHost(this.var_95).getGraphicContext(true) as DisplayObject);
            this.var_95.destroy();
            this.var_95 = null;
            this.var_1678.destroy();
            this.var_1678 = null;
            if(this.var_1401 is IDisposable)
            {
               IDisposable(this.var_1401).dispose();
            }
            this.var_1401 = null;
            this.var_1677.dispose();
            this.var_1677 = null;
            var_175 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1387;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2223;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1387 = param2;
         this.var_2223 = param1;
         if(this.var_3051)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1387 = null;
         this.var_2223 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1401;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1677;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2999;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_95;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_95.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1952,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1678;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_95,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_95)
         {
            this.var_95 = null;
         }
         if(param1.state != WindowState.const_488)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_175.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_595 = true;
         if(this.var_1387)
         {
            throw this.var_1387;
         }
         var_696.process(this.var_2798,var_421);
         this.var_595 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2799 = true;
         var_175.update(param1);
         this.var_2799 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_95 != null && !this.var_95.disposed)
         {
            if(this.var_145 is Stage)
            {
               this.var_95.limits.maxWidth = Stage(this.var_145).stageWidth;
               this.var_95.limits.maxHeight = Stage(this.var_145).stageHeight;
               this.var_95.width = Stage(this.var_145).stageWidth;
               this.var_95.height = Stage(this.var_145).stageHeight;
            }
            else
            {
               this.var_95.limits.maxWidth = this.var_145.width;
               this.var_95.limits.maxHeight = this.var_145.height;
               this.var_95.width = this.var_145.width;
               this.var_95.height = this.var_145.height;
            }
         }
      }
   }
}
