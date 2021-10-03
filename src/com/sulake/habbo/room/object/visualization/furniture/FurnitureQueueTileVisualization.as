package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1406:int = 3;
      
      private static const const_1663:int = 2;
      
      private static const const_1662:int = 1;
      
      private static const const_1664:int = 15;
       
      
      private var var_313:Array;
      
      private var var_1355:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_313 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1663)
         {
            this.var_313 = new Array();
            this.var_313.push(const_1662);
            this.var_1355 = const_1664;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1355 > 0)
         {
            --this.var_1355;
         }
         if(this.var_1355 == 0)
         {
            if(this.var_313.length > 0)
            {
               super.setAnimation(this.var_313.shift());
            }
         }
         return super.updateAnimation(param1);
      }
      
      override protected function usesAnimationResetting() : Boolean
      {
         return true;
      }
   }
}
