package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_365:int = 1;
      
      public static const const_200:int = 2;
      
      public static const const_271:int = 3;
      
      public static const const_349:int = 4;
      
      public static const const_226:int = 5;
      
      public static const const_425:int = 1;
      
      public static const const_824:int = 2;
      
      public static const const_809:int = 3;
      
      public static const const_915:int = 4;
      
      public static const const_275:int = 5;
      
      public static const const_923:int = 6;
      
      public static const const_825:int = 7;
      
      public static const const_304:int = 8;
      
      public static const const_415:int = 9;
      
      public static const const_2165:int = 10;
      
      public static const const_795:int = 11;
      
      public static const const_554:int = 12;
       
      
      private var var_476:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_476 = new Array();
         this.var_476.push(new Tab(this._navigator,const_365,const_554,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_571));
         this.var_476.push(new Tab(this._navigator,const_200,const_425,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_571));
         this.var_476.push(new Tab(this._navigator,const_349,const_795,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1242));
         this.var_476.push(new Tab(this._navigator,const_271,const_275,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_571));
         this.var_476.push(new Tab(this._navigator,const_226,const_304,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_773));
         this.setSelectedTab(const_365);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_349;
      }
      
      public function get tabs() : Array
      {
         return this.var_476;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_476)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_476)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_476)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
