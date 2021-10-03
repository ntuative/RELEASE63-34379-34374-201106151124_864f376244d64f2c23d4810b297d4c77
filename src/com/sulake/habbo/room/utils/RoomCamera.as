package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1540:Number = 12;
       
      
      private var var_2702:int = -1;
      
      private var var_2706:int = -2;
      
      private var var_227:Vector3d = null;
      
      private var var_1268:Number = 0;
      
      private var var_1554:Number = 0;
      
      private var var_1951:Boolean = false;
      
      private var var_199:Vector3d = null;
      
      private var var_1954:Vector3d;
      
      private var var_2709:Boolean = false;
      
      private var var_2700:Boolean = false;
      
      private var var_2704:Boolean = false;
      
      private var var_2703:Boolean = false;
      
      private var var_2707:int = 0;
      
      private var var_2705:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2701:int = 0;
      
      private var var_2708:int = 0;
      
      private var var_1711:int = -1;
      
      private var var_1952:int = 0;
      
      private var var_1953:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1954 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_199;
      }
      
      public function get targetId() : int
      {
         return this.var_2702;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2706;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1954;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2709;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2700;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2704;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2703;
      }
      
      public function get screenWd() : int
      {
         return this.var_2707;
      }
      
      public function get screenHt() : int
      {
         return this.var_2705;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2701;
      }
      
      public function get roomHt() : int
      {
         return this.var_2708;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1711;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_227 != null && this.var_199 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2702 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1954.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2706 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2709 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2700 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2704 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2703 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2707 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2705 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1953 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2701 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2708 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1711 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_227 == null)
         {
            this.var_227 = new Vector3d();
         }
         if(this.var_227.x != param1.x || this.var_227.y != param1.y || this.var_227.z != param1.z)
         {
            this.var_227.assign(param1);
            this.var_1952 = 0;
            _loc2_ = Vector3d.dif(this.var_227,this.var_199);
            this.var_1268 = _loc2_.length;
            this.var_1951 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_227 = null;
         this.var_199 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_199 != null)
         {
            return;
         }
         this.var_199 = new Vector3d();
         this.var_199.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_199 == null)
         {
            this.var_199 = new Vector3d();
         }
         this.var_199.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_227 != null && this.var_199 != null)
         {
            ++this.var_1952;
            if(this.var_1953)
            {
               this.var_1953 = false;
               this.var_199 = this.var_227;
               this.var_227 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_227,this.var_199);
            if(_loc3_.length > this.var_1268)
            {
               this.var_1268 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_199 = this.var_227;
               this.var_227 = null;
               this.var_1554 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1268);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1268 / const_1540;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_1951)
               {
                  if(_loc7_ < this.var_1554)
                  {
                     _loc7_ = this.var_1554;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_1951 = false;
                  }
               }
               this.var_1554 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_199 = Vector3d.sum(this.var_199,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1711 = -1;
      }
   }
}
