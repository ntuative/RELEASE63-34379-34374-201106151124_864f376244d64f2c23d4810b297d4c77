package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1848:String = "WE_DESTROY";
      
      public static const const_346:String = "WE_DESTROYED";
      
      public static const const_1830:String = "WE_OPEN";
      
      public static const const_1796:String = "WE_OPENED";
      
      public static const const_1740:String = "WE_CLOSE";
      
      public static const const_1899:String = "WE_CLOSED";
      
      public static const const_1729:String = "WE_FOCUS";
      
      public static const const_319:String = "WE_FOCUSED";
      
      public static const const_1753:String = "WE_UNFOCUS";
      
      public static const const_1846:String = "WE_UNFOCUSED";
      
      public static const const_1851:String = "WE_ACTIVATE";
      
      public static const const_591:String = "WE_ACTIVATED";
      
      public static const const_1927:String = "WE_DEACTIVATE";
      
      public static const const_605:String = "WE_DEACTIVATED";
      
      public static const const_361:String = "WE_SELECT";
      
      public static const const_48:String = "WE_SELECTED";
      
      public static const const_486:String = "WE_UNSELECT";
      
      public static const const_551:String = "WE_UNSELECTED";
      
      public static const const_1908:String = "WE_LOCK";
      
      public static const const_1843:String = "WE_LOCKED";
      
      public static const const_1723:String = "WE_UNLOCK";
      
      public static const const_1922:String = "WE_UNLOCKED";
      
      public static const const_772:String = "WE_ENABLE";
      
      public static const const_309:String = "WE_ENABLED";
      
      public static const const_808:String = "WE_DISABLE";
      
      public static const const_290:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_396:String = "WE_RELOCATED";
      
      public static const const_1168:String = "WE_RESIZE";
      
      public static const const_42:String = "WE_RESIZED";
      
      public static const const_1801:String = "WE_MINIMIZE";
      
      public static const const_1824:String = "WE_MINIMIZED";
      
      public static const const_1832:String = "WE_MAXIMIZE";
      
      public static const const_1909:String = "WE_MAXIMIZED";
      
      public static const const_1731:String = "WE_RESTORE";
      
      public static const const_1835:String = "WE_RESTORED";
      
      public static const const_495:String = "WE_CHILD_ADDED";
      
      public static const const_443:String = "WE_CHILD_REMOVED";
      
      public static const const_202:String = "WE_CHILD_RELOCATED";
      
      public static const const_159:String = "WE_CHILD_RESIZED";
      
      public static const const_376:String = "WE_CHILD_ACTIVATED";
      
      public static const const_660:String = "WE_PARENT_ADDED";
      
      public static const const_1757:String = "WE_PARENT_REMOVED";
      
      public static const const_1969:String = "WE_PARENT_RELOCATED";
      
      public static const const_800:String = "WE_PARENT_RESIZED";
      
      public static const const_1235:String = "WE_PARENT_ACTIVATED";
      
      public static const const_181:String = "WE_OK";
      
      public static const const_552:String = "WE_CANCEL";
      
      public static const const_116:String = "WE_CHANGE";
      
      public static const const_564:String = "WE_SCROLL";
      
      public static const const_117:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_741:IWindow;
      
      protected var var_1136:Boolean;
      
      protected var var_509:Boolean;
      
      protected var var_166:Boolean;
      
      protected var var_740:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_741 = param3;
         _loc5_.var_509 = param4;
         _loc5_.var_166 = false;
         _loc5_.var_740 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_741;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_509;
      }
      
      public function recycle() : void
      {
         if(this.var_166)
         {
            throw new Error("Event already recycled!");
         }
         this.var_741 = null;
         this._window = null;
         this.var_166 = true;
         this.var_1136 = false;
         this.var_740.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1136;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1136 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1136;
      }
      
      public function stopPropagation() : void
      {
         this.var_1136 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1136 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_509 + " window: " + this._window + " }";
      }
   }
}
