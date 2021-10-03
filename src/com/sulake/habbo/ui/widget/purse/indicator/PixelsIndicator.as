package com.sulake.habbo.ui.widget.purse.indicator
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.widget.IRoomWidgetMessageListener;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetOpenCatalogMessage;
   import com.sulake.habbo.ui.widget.purse.ICurrencyIndicator;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   
   public class PixelsIndicator implements ICurrencyIndicator
   {
       
      
      private const const_2322:uint = 4.285767869E9;
      
      private const const_2323:uint = 4.28366404E9;
      
      private var _view:IWindowContainer;
      
      private var var_2834:IRoomWidgetMessageListener;
      
      private var var_2113:int;
      
      private var _disposed:Boolean = false;
      
      public function PixelsIndicator(param1:IHabboWindowManager, param2:IAssetLibrary)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         super();
         var _loc3_:XmlAsset = param2.getAssetByName("purse_indicator_pixels") as XmlAsset;
         if(_loc3_)
         {
            this._view = param1.buildFromXML(_loc3_.content as XML,1) as IWindowContainer;
            this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPixelsClick);
            this._view.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onBlueMouseOver);
            this._view.addEventListener(WindowMouseEvent.const_25,this.onBlueMouseOut);
            _loc4_ = [];
            if(this._view.groupChildrenWithTag("ICON",_loc4_,true) == 1)
            {
               _loc5_ = _loc4_[0] as IBitmapWrapperWindow;
               _loc6_ = param2.getAssetByName("pixel_icon").content as BitmapData;
               if(_loc5_)
               {
                  _loc5_.bitmap = _loc6_.clone();
                  _loc5_.width = _loc6_.width;
                  _loc5_.height = _loc6_.height;
               }
            }
         }
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function set widgetMessageListener(param1:IRoomWidgetMessageListener) : void
      {
         this.var_2834 = param1;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         this._disposed = true;
      }
      
      public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_112,this.onPixelBalance);
      }
      
      public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_112,this.onPixelBalance);
      }
      
      private function onPixelBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         this.var_2113 = param1.balance;
         if(this._view)
         {
            this._view.findChildByName("pixels").caption = this.var_2113.toString();
            this._view.findChildByName("pixels_shadow").caption = this.var_2113.toString();
         }
      }
      
      private function onPixelsClick(param1:WindowMouseEvent) : void
      {
         this.var_2834.processWidgetMessage(new RoomWidgetOpenCatalogMessage(RoomWidgetOpenCatalogMessage.const_1292));
      }
      
      private function onBlueMouseOver(param1:WindowMouseEvent) : void
      {
         this._view.color = this.const_2323;
      }
      
      private function onBlueMouseOut(param1:WindowMouseEvent) : void
      {
         this._view.color = this.const_2322;
      }
   }
}
