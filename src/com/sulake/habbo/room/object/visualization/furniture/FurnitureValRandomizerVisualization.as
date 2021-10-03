package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1028:int = 20;
      
      private static const const_674:int = 10;
      
      private static const const_1405:int = 31;
      
      private static const const_1406:int = 32;
      
      private static const const_675:int = 30;
       
      
      private var var_313:Array;
      
      private var var_791:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_313 = new Array();
         super();
         super.setAnimation(const_675);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_791)
            {
               this.var_791 = true;
               this.var_313 = new Array();
               this.var_313.push(const_1405);
               this.var_313.push(const_1406);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_674)
         {
            if(this.var_791)
            {
               this.var_791 = false;
               this.var_313 = new Array();
               if(direction == 2)
               {
                  this.var_313.push(const_1028 + 5 - param1);
                  this.var_313.push(const_674 + 5 - param1);
               }
               else
               {
                  this.var_313.push(const_1028 + param1);
                  this.var_313.push(const_674 + param1);
               }
               this.var_313.push(const_675);
               return;
            }
            super.setAnimation(const_675);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
