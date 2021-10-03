package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_31;
      
      private static var var_158:Stage;
      
      private static var var_347:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_888:Boolean = true;
      
      private static var var_138:DisplayObject;
      
      private static var var_1622:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_158 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_138)
            {
               var_158.removeChild(var_138);
               var_158.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_158.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_158.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_158.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_888 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_347;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_347 = param1;
         if(var_347)
         {
            if(var_138)
            {
               var_138.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_138)
         {
            var_138.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_888)
         {
            _loc1_ = var_1622[_type];
            if(_loc1_)
            {
               if(var_138)
               {
                  var_158.removeChild(var_138);
               }
               else
               {
                  var_158.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_158.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_158.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_158.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_138 = _loc1_;
               var_158.addChild(var_138);
            }
            else
            {
               if(var_138)
               {
                  var_158.removeChild(var_138);
                  var_158.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_158.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_158.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_158.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_138 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_31:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_322:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_792:
                  case MouseCursorType.const_307:
                  case MouseCursorType.const_1736:
                  case MouseCursorType.const_1841:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_888 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1622[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_138)
         {
            var_138.x = param1.stageX - 2;
            var_138.y = param1.stageY;
            if(_type == MouseCursorType.const_31)
            {
               var_347 = false;
               Mouse.show();
            }
            else
            {
               var_347 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_138 && _type != MouseCursorType.const_31)
         {
            Mouse.hide();
            var_347 = false;
         }
      }
   }
}
