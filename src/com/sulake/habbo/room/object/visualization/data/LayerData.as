package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_774:String = "";
      
      public static const const_440:int = 0;
      
      public static const const_619:int = 255;
      
      public static const const_892:Boolean = false;
      
      public static const const_505:int = 0;
      
      public static const const_653:int = 0;
      
      public static const const_410:int = 0;
      
      public static const const_1187:int = 1;
      
      public static const const_1161:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2319:String = "";
      
      private var var_2114:int = 0;
      
      private var var_2353:int = 255;
      
      private var var_2355:Boolean = false;
      
      private var var_2356:int = 0;
      
      private var var_2352:int = 0;
      
      private var var_2354:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2319 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2319;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_2114 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_2114;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2353 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2353;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2355 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2355;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2356 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2356;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2352 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2352;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2354 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2354;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
