package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2137:int = 16777215;
      
      public static const const_1167:int = 8191;
      
      public static const const_1296:int = 8191;
      
      public static const const_2076:int = 1;
      
      public static const const_1156:int = 1;
      
      public static const const_1155:int = 1;
      
      private static var var_553:uint = 0;
      
      private static var var_554:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1167)
         {
            param2 = const_1167;
         }
         else if(param2 < const_1156)
         {
            param2 = const_1156;
         }
         if(param3 > const_1296)
         {
            param3 = const_1296;
         }
         else if(param3 < const_1155)
         {
            param3 = const_1155;
         }
         super(param2,param3,param4,param5);
         ++var_553;
         var_554 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_553;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_554;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_554 -= width * height * 4;
            --var_553;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
