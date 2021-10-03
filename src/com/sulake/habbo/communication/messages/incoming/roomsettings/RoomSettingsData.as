package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_566:int = 0;
      
      public static const const_232:int = 1;
      
      public static const const_132:int = 2;
      
      public static const const_896:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1840:String;
      
      private var var_2581:int;
      
      private var var_1623:int;
      
      private var var_2765:int;
      
      private var var_2957:int;
      
      private var var_922:Array;
      
      private var var_2760:Array;
      
      private var var_2958:int;
      
      private var var_2587:Boolean;
      
      private var var_2764:Boolean;
      
      private var var_2763:Boolean;
      
      private var var_2761:Boolean;
      
      private var var_2762:int;
      
      private var var_2766:int;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2587;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2587 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2764;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2764 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2763;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2763 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2761;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2761 = param1;
      }
      
      public function get wallThickness() : int
      {
         return this.var_2762;
      }
      
      public function set wallThickness(param1:int) : void
      {
         this.var_2762 = param1;
      }
      
      public function get floorThickness() : int
      {
         return this.var_2766;
      }
      
      public function set floorThickness(param1:int) : void
      {
         this.var_2766 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1840;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1840 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2581;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2581 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1623;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1623 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2765;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2765 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2957;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2957 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_922;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_922 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2760;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2760 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2958;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2958 = param1;
      }
   }
}
