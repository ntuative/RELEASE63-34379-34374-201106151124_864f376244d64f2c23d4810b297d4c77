package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1028:int = 20;
      
      private static const const_674:int = 9;
      
      private static const const_1406:int = -1;
       
      
      private var var_313:Array;
      
      private var var_791:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_313 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_791)
            {
               this.var_791 = true;
               this.var_313 = new Array();
               this.var_313.push(const_1406);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_791)
            {
               this.var_791 = false;
               this.var_313 = new Array();
               this.var_313.push(const_1028);
               this.var_313.push(const_674 + param1);
               this.var_313.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
         {
            if(this.var_313.length > 0)
            {
               super.setAnimation(this.var_313.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
