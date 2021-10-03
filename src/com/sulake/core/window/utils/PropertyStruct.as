package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_145:String = "hex";
      
      public static const const_40:String = "int";
      
      public static const const_282:String = "uint";
      
      public static const const_138:String = "Number";
      
      public static const const_37:String = "Boolean";
      
      public static const const_52:String = "String";
      
      public static const const_295:String = "Point";
      
      public static const const_280:String = "Rectangle";
      
      public static const const_153:String = "Array";
      
      public static const const_264:String = "Map";
       
      
      private var var_610:String;
      
      private var var_190:Object;
      
      private var _type:String;
      
      private var var_2285:Boolean;
      
      private var var_3016:Boolean;
      
      private var var_2286:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_610 = param1;
         this.var_190 = param2;
         this._type = param3;
         this.var_2285 = param4;
         this.var_3016 = param3 == const_264 || param3 == const_153 || param3 == const_295 || param3 == const_280;
         this.var_2286 = param5;
      }
      
      public function get key() : String
      {
         return this.var_610;
      }
      
      public function get value() : Object
      {
         return this.var_190;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2285;
      }
      
      public function get range() : Array
      {
         return this.var_2286;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_145:
               return "0x" + uint(this.var_190).toString(16);
            case const_37:
               return Boolean(this.var_190) == true ? "HabboRoomUICom_pet_command" : "QuestsList";
            case const_295:
               return "Point(" + Point(this.var_190).x + ", " + Point(this.var_190).y + ")";
            case const_280:
               return "Rectangle(" + Rectangle(this.var_190).x + ", " + Rectangle(this.var_190).y + ", " + Rectangle(this.var_190).width + ", " + Rectangle(this.var_190).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_264:
               _loc3_ = this.var_190 as Map;
               _loc1_ = "<var key=\"" + this.var_610 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_153:
               _loc4_ = this.var_190 as Array;
               _loc1_ = "<var key=\"" + this.var_610 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_295:
               _loc5_ = this.var_190 as Point;
               _loc1_ = "<var key=\"" + this.var_610 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_280:
               _loc6_ = this.var_190 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_610 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_40 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_145:
               _loc1_ = "<var key=\"" + this.var_610 + "\" value=\"" + "0x" + uint(this.var_190).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_610 + "\" value=\"" + this.var_190 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
