package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_84:ITextFieldWindow;
      
      private var var_645:Boolean;
      
      private var var_1625:String = "";
      
      private var var_1890:int;
      
      private var var_1889:Function;
      
      private var var_2601:String = "";
      
      private var var_151:IWindowContainer;
      
      private var var_2602:Boolean;
      
      private var _orgTextBackgroundColor:uint;
      
      private var var_2600:uint;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_84 = param2;
         this.var_1890 = param3;
         this.var_1889 = param4;
         if(param5 != null)
         {
            this.var_645 = true;
            this.var_1625 = param5;
            this.var_84.text = param5;
         }
         Util.setProcDirectly(this.var_84,this.onInputClick);
         this.var_84.addEventListener(WindowKeyboardEvent.const_193,this.checkEnterPress);
         this.var_84.addEventListener(WindowEvent.const_116,this.checkMaxLen);
         this.var_2602 = this.var_84.textBackground;
         this._orgTextBackgroundColor = this.var_84.textBackgroundColor;
         this.var_2600 = this.var_84.textColor;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         this.var_84.textBackground = this.var_2602;
         this.var_84.textBackgroundColor = this._orgTextBackgroundColor;
         this.var_84.textColor = this.var_2600;
      }
      
      public function displayError(param1:String) : void
      {
         this.var_84.textBackground = true;
         this.var_84.textBackgroundColor = 4294021019;
         this.var_84.textColor = 4278190080;
         if(this.var_151 == null)
         {
            this.var_151 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_151,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_84.parent).addChild(this.var_151);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_151.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_151.findChildByName("border").width = _loc2_.width + 15;
         this.var_151.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_84.method_8(_loc3_);
         this.var_151.x = _loc3_.x;
         this.var_151.y = _loc3_.y - this.var_151.height + 3;
         var _loc4_:IWindow = this.var_151.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_151.width / 2 - _loc4_.width / 2;
         this.var_151.x += (this.var_84.width - this.var_151.width) / 2;
         this.var_151.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1625 != null)
         {
            this.var_84.text = this.var_1625;
            this.var_645 = true;
         }
         else
         {
            this.var_84.text = "";
            this.var_645 = false;
         }
      }
      
      public function getText() : String
      {
         if(this.var_645)
         {
            return this.var_2601;
         }
         return this.var_84.text;
      }
      
      public function setText(param1:String) : void
      {
         this.var_645 = false;
         this.var_84.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_151 != null)
         {
            this.var_151.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_84;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_645 && Util.trim(this.getText()).length > 2;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_319)
         {
            return;
         }
         if(!this.var_645)
         {
            return;
         }
         this.var_84.text = this.var_2601;
         this.var_645 = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:WindowKeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.ENTER)
         {
            if(this.var_1889 != null)
            {
               this.var_1889();
            }
         }
      }
      
      private function checkMaxLen(param1:WindowEvent) : void
      {
         var _loc2_:String = this.var_84.text;
         if(_loc2_.length > this.var_1890)
         {
            this.var_84.text = _loc2_.substring(0,this.var_1890);
         }
      }
   }
}
