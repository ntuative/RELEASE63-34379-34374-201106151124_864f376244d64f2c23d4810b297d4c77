package com.sulake.core.window.components
{
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IMargins;
   import com.sulake.core.window.utils.PropertyDefaults;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.TextFieldCache;
   import com.sulake.core.window.utils.TextMargins;
   import com.sulake.core.window.utils.TextStyle;
   import com.sulake.core.window.utils.TextStyleManager;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class TextLabelController extends WindowController implements ILabelWindow, ILocalizable
   {
       
      
      private var var_410:Object = null;
      
      private var var_461:String = "regular";
      
      private var _text:String = "";
      
      private var var_142:Boolean = false;
      
      private var var_44:TextMargins;
      
      private var var_2916:Number = 0;
      
      private var var_2915:Number = 0;
      
      private var var_1630:Boolean = false;
      
      public function TextLabelController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         TextStyleManager.events.addEventListener(Event.CHANGE,this.onTextStyleChanged);
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function get antiAliasType() : String
      {
         return this.textField.antiAliasType;
      }
      
      public function get autoSize() : String
      {
         return this.textField.autoSize;
      }
      
      public function get bold() : Boolean
      {
         return this.textField.defaultTextFormat.bold;
      }
      
      public function get border() : Boolean
      {
         return this.textField.border;
      }
      
      public function get borderColor() : uint
      {
         return this.textField.borderColor;
      }
      
      public function get defaultTextFormat() : TextFormat
      {
         return this.textField.defaultTextFormat;
      }
      
      public function get embedFonts() : Boolean
      {
         return this.textField.embedFonts;
      }
      
      public function get fontFace() : String
      {
         return this.textField.defaultTextFormat.font;
      }
      
      public function get fontSize() : uint
      {
         return this.textField.defaultTextFormat.size == null ? 12 : uint(uint(this.textField.defaultTextFormat.size));
      }
      
      public function get gridFitType() : String
      {
         return this.textField.gridFitType;
      }
      
      public function get italic() : Boolean
      {
         return this.textField.defaultTextFormat.italic;
      }
      
      public function get kerning() : Boolean
      {
         return this.textField.defaultTextFormat.kerning;
      }
      
      public function get length() : int
      {
         return this._text.length;
      }
      
      public function get margins() : IMargins
      {
         if(!this.var_44)
         {
            this.var_44 = new TextMargins(0,0,0,0,this.setTextMargins);
         }
         return this.var_44;
      }
      
      public function get maxChars() : int
      {
         return this.textField.maxChars;
      }
      
      public function get sharpness() : Number
      {
         return this.textField.sharpness;
      }
      
      public function get spacing() : Number
      {
         return Number(this.textField.defaultTextFormat.letterSpacing);
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get textColor() : uint
      {
         return uint(this.var_410);
      }
      
      public function get textBackground() : Boolean
      {
         return background;
      }
      
      public function get textBackgroundColor() : uint
      {
         return color;
      }
      
      public function get textHeight() : Number
      {
         return this.var_2916;
      }
      
      public function get textWidth() : Number
      {
         return this.var_2915;
      }
      
      public function get textStyle() : TextStyle
      {
         return TextStyleManager.getStyle(this.var_461);
      }
      
      public function get thickness() : Number
      {
         return this.textField.thickness;
      }
      
      public function get underline() : Boolean
      {
         return this.textField.defaultTextFormat.underline;
      }
      
      public function get drawOffsetX() : int
      {
         return !!this.var_44 ? int(this.var_44.left) : 0;
      }
      
      public function get drawOffsetY() : int
      {
         return !!this.var_44 ? int(this.var_44.top) : 0;
      }
      
      public function get hasTextColor() : Boolean
      {
         return this.var_410 != null;
      }
      
      protected function get textField() : TextField
      {
         var _loc1_:TextField = TextFieldCache.getTextFieldByStyleName(this.var_461);
         if(_loc1_)
         {
            _loc1_.text = this._text;
            if(this.var_410 != null)
            {
               _loc1_.textColor = uint(this.var_410);
            }
         }
         return _loc1_;
      }
      
      public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_142)
         {
            context.removeLocalizationListener(var_19.slice(2,var_19.indexOf("}")),this);
            this.var_142 = false;
         }
         var_19 = param1;
         if(var_19.charAt(0) == "$" && var_19.charAt(1) == "{")
         {
            context.registerLocalizationListener(var_19.slice(2,var_19.indexOf("}")),this);
            this.var_142 = true;
         }
         else
         {
            this._text = param1;
            this.refresh();
         }
      }
      
      override public function set caption(param1:String) : void
      {
         this.text = param1;
      }
      
      public function set localization(param1:String) : void
      {
         if(param1 != null)
         {
            this._text = param1;
            this.refresh();
         }
      }
      
      public function set textStyle(param1:TextStyle) : void
      {
         if(this.var_461 != param1.name)
         {
            this.var_461 = param1.name;
            this.refresh();
         }
      }
      
      public function set textColor(param1:uint) : void
      {
         if(param1 != this.var_410)
         {
            this.var_410 = param1;
            this.refresh();
         }
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            TextStyleManager.events.removeEventListener(Event.CHANGE,this.onTextStyleChanged);
            if(this.var_142)
            {
               this.var_142 = false;
               context.removeLocalizationListener(var_19.slice(2,var_19.indexOf("}")),this);
            }
            if(this.var_44)
            {
               this.var_44.dispose();
               this.var_44 = null;
            }
            super.dispose();
         }
      }
      
      private function refresh(param1:Boolean = false) : void
      {
         var _loc9_:* = null;
         if(this.var_1630)
         {
            return;
         }
         this.var_1630 = true;
         var _loc2_:TextField = this.textField;
         if(!_loc2_)
         {
            this.var_1630 = false;
            return;
         }
         this.var_2915 = _loc2_.textWidth;
         this.var_2916 = _loc2_.textHeight;
         var _loc3_:int = !!this.var_44 ? int(this.var_44.left + this.var_44.right) : 0;
         var _loc4_:int = !!this.var_44 ? int(this.var_44.top + this.var_44.bottom) : 0;
         var _loc5_:int = 0 - _loc3_;
         var _loc6_:int = 0 - _loc4_;
         var _loc7_:int = Math.floor(_loc2_.width) + (!!_loc2_.border ? 1 : 0);
         var _loc8_:Boolean = false;
         if(_loc7_ != _loc5_)
         {
            setRectangle(var_11.x,var_11.y,_loc7_ + _loc3_,Math.floor(_loc2_.height) + _loc4_);
            _loc8_ = true;
         }
         if(_loc2_.height + (!!_loc2_.border ? 1 : 0) < _loc6_)
         {
            _loc2_.height = _loc6_ - (!!_loc2_.border ? 1 : 0);
         }
         else if(_loc2_.height + (!!_loc2_.border ? 1 : 0) > _loc6_)
         {
            setRectangle(var_11.x,var_11.y,_loc7_ + _loc3_,Math.floor(_loc2_.height) + _loc4_);
            _loc8_ = true;
         }
         this.var_1630 = false;
         _context.invalidate(this,var_11,WindowRedrawFlag.const_62);
         if(!_loc8_ && !param1)
         {
            _loc9_ = WindowEvent.allocate(WindowEvent.const_42,this,null);
            _events.dispatchEvent(_loc9_);
            _loc9_.recycle();
         }
      }
      
      private function setTextMargins(param1:IMargins) : void
      {
         if(param1 && param1 != this.var_44)
         {
            if(this.var_44)
            {
               this.var_44.assign(param1.left,param1.top,param1.right,param1.bottom,this.setTextMargins);
            }
            else
            {
               this.var_44 = new TextMargins(param1.left,param1.top,param1.right,param1.bottom,this.setTextMargins);
            }
         }
         this.refresh();
      }
      
      private function onTextStyleChanged(param1:Event) : void
      {
         this.refresh();
      }
      
      private function setTextMarginMap(param1:Map) : void
      {
         if(this.var_44)
         {
            this.var_44.assign(int(param1["left"]),int(param1["top"]),int(param1["right"]),int(param1["bottom"]),this.setTextMargins);
         }
         else
         {
            this.var_44 = new TextMargins(int(param1["left"]),int(param1["top"]),int(param1["right"]),int(param1["bottom"]),this.setTextMargins);
         }
         this.refresh();
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         var _loc2_:TextStyle = TextStyleManager.getStyle(this.var_461);
         _loc1_.push(this.var_461 != TextStyleManager.const_221 ? new PropertyStruct(PropertyDefaults.const_431,this.var_461,PropertyStruct.const_52,true,PropertyDefaults.const_806) : PropertyDefaults.const_1342);
         _loc1_.push((_loc2_.color != null ? this.var_410 != _loc2_.color : this.var_410 != null && this.var_410 != PropertyDefaults.const_1011) ? new PropertyStruct(PropertyDefaults.const_441,this.var_410,PropertyStruct.const_145,true) : PropertyDefaults.const_1194);
         if(this.var_44)
         {
            if(this.var_44.left != PropertyDefaults.const_953)
            {
               _loc1_.push(new PropertyStruct(PropertyDefaults.const_285,this.var_44.left,PropertyStruct.const_40,true));
            }
            else
            {
               _loc1_.push(PropertyDefaults.const_891);
            }
            if(this.var_44.top != PropertyDefaults.const_972)
            {
               _loc1_.push(new PropertyStruct(PropertyDefaults.const_308,this.var_44.top,PropertyStruct.const_40,true));
            }
            else
            {
               _loc1_.push(PropertyDefaults.const_914);
            }
            if(this.var_44.right != PropertyDefaults.const_856)
            {
               _loc1_.push(new PropertyStruct(PropertyDefaults.const_279,this.var_44.right,PropertyStruct.const_40,true));
            }
            else
            {
               _loc1_.push(PropertyDefaults.const_971);
            }
            if(this.var_44.bottom != PropertyDefaults.const_758)
            {
               _loc1_.push(new PropertyStruct(PropertyDefaults.const_306,this.var_44.bottom,PropertyStruct.const_40,true));
            }
            else
            {
               _loc1_.push(PropertyDefaults.const_919);
            }
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_891);
            _loc1_.push(PropertyDefaults.const_914);
            _loc1_.push(PropertyDefaults.const_971);
            _loc1_.push(PropertyDefaults.const_919);
         }
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case PropertyDefaults.const_431:
                  this.textStyle = TextStyleManager.getStyle(_loc2_.value as String);
                  break;
               case PropertyDefaults.const_441:
                  this.var_410 = _loc2_.value as uint;
                  break;
               case PropertyDefaults.const_285:
                  if(this.var_44 || _loc2_.valid)
                  {
                     this.margins.left = _loc2_.value as int;
                  }
                  break;
               case PropertyDefaults.const_308:
                  if(this.var_44 || _loc2_.valid)
                  {
                     this.margins.top = _loc2_.value as int;
                  }
                  break;
               case PropertyDefaults.const_279:
                  if(this.var_44 || _loc2_.valid)
                  {
                     this.margins.right = _loc2_.value as int;
                  }
                  break;
               case PropertyDefaults.const_306:
                  if(this.var_44 || _loc2_.valid)
                  {
                     this.margins.bottom = _loc2_.value as int;
                  }
                  break;
               case "margins":
                  this.setTextMarginMap(_loc2_.value as Map);
                  break;
            }
         }
         super.properties = param1;
      }
   }
}
