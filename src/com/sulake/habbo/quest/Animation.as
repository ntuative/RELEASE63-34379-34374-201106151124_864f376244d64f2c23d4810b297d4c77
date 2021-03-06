package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   
   public class Animation implements IDisposable
   {
       
      
      private var var_96:IBitmapWrapperWindow;
      
      private var var_1023:int;
      
      private var var_1266:Boolean;
      
      private var var_216:Array;
      
      public function Animation(param1:IBitmapWrapperWindow)
      {
         this.var_216 = new Array();
         super();
         this.var_96 = param1;
         this.var_96.visible = false;
         if(param1.bitmap == null)
         {
            param1.bitmap = new BitmapData(param1.width,param1.height,true,0);
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         this.var_96 = null;
         if(this.var_216)
         {
            for each(_loc1_ in this.var_216)
            {
               _loc1_.dispose();
            }
            this.var_216 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_96 == null;
      }
      
      public function addObject(param1:AnimationObject) : void
      {
         this.var_216.push(param1);
      }
      
      public function stop() : void
      {
         this.var_1266 = false;
         this.var_96.visible = false;
      }
      
      public function restart() : void
      {
         var _loc1_:* = null;
         this.var_1023 = 0;
         this.var_1266 = true;
         for each(_loc1_ in this.var_216)
         {
            _loc1_.onAnimationStart();
         }
         this.draw();
         this.var_96.visible = true;
      }
      
      public function update(param1:uint) : void
      {
         if(this.var_1266)
         {
            this.var_1023 += param1;
            this.draw();
         }
      }
      
      private function draw() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:* = null;
         var _loc3_:* = null;
         this.var_96.bitmap.fillRect(this.var_96.bitmap.rect,0);
         if(this.var_1266)
         {
            _loc1_ = false;
            for each(_loc2_ in this.var_216)
            {
               if(!_loc2_.isFinished(this.var_1023))
               {
                  _loc1_ = true;
                  _loc3_ = _loc2_.getBitmap(this.var_1023);
                  if(_loc3_ != null)
                  {
                     this.var_96.bitmap.copyPixels(_loc3_,_loc3_.rect,_loc2_.getPosition(this.var_1023));
                  }
               }
            }
         }
         this.var_96.invalidate(this.var_96.rectangle);
         this.var_1266 = _loc1_;
      }
   }
}
