package com.sulake.habbo.inventory.trading
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAcceptEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAlreadyOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCloseEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCompletedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingConfirmationEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingNotOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOtherNotAllowedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingYouAreNotAllowedEvent;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.AcceptTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.AddItemToTradeComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.CloseTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.ConfirmAcceptTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.ConfirmDeclineTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.OpenTradingComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.RemoveItemFromTradeComposer;
   import com.sulake.habbo.communication.messages.outgoing.inventory.trading.UnacceptTradingComposer;
   import com.sulake.habbo.inventory.HabboInventory;
   import com.sulake.habbo.inventory.IInventoryModel;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class TradingModel implements IInventoryModel, IGetImageListener
   {
      
      public static const const_1759:uint = 9;
      
      public static const const_222:uint = 0;
      
      public static const const_204:uint = 1;
      
      public static const const_438:uint = 2;
      
      public static const const_356:uint = 3;
      
      public static const const_649:uint = 4;
      
      public static const const_244:uint = 5;
      
      public static const TRADING_STATE_CANCELLED:uint = 6;
       
      
      private var var_13:HabboInventory;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _roomEngine:IRoomEngine;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _soundManager:IHabboSoundManager;
      
      private var var_58:TradingView;
      
      private var _disposed:Boolean = false;
      
      private var var_791:Boolean = false;
      
      private var _state:uint = 0;
      
      private var var_801:int = -1;
      
      private var var_2480:String = "";
      
      private var var_280:Map;
      
      private var var_802:Boolean = false;
      
      private var var_2566:Boolean = false;
      
      private var var_1512:int = -1;
      
      private var var_2567:String = "";
      
      private var var_995:Map;
      
      private var var_1231:Boolean = false;
      
      private var var_1908:Boolean = false;
      
      public function TradingModel(param1:HabboInventory, param2:IHabboWindowManager, param3:IHabboCommunicationManager, param4:IAssetLibrary, param5:IRoomEngine, param6:IHabboLocalizationManager, param7:IHabboSoundManager)
      {
         super();
         this.var_13 = param1;
         this._communication = param3;
         this._assetLibrary = param4;
         this._roomEngine = param5;
         this._localization = param6;
         this._soundManager = param7;
         this.var_58 = new TradingView(this,param2,param4,param5,param6,param7);
      }
      
      public function get running() : Boolean
      {
         return this._state != const_222;
      }
      
      public function get state() : uint
      {
         return this._state;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownUserId() : int
      {
         return this.var_801;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2480;
      }
      
      public function get ownUserItems() : Map
      {
         return this.var_280;
      }
      
      public function get ownUserAccepts() : Boolean
      {
         return this.var_802;
      }
      
      public function get ownUserCanTrade() : Boolean
      {
         return this.var_2566;
      }
      
      public function get otherUserId() : int
      {
         return this.var_1512;
      }
      
      public function get otherUserName() : String
      {
         return this.var_2567;
      }
      
      public function get otherUserItems() : Map
      {
         return this.var_995;
      }
      
      public function get otherUserAccepts() : Boolean
      {
         return this.var_1231;
      }
      
      public function get otherUserCanTrade() : Boolean
      {
         return this.var_1908;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_58 && !this.var_58.disposed)
            {
               this.var_58.dispose();
               this.var_58 = null;
            }
            this.var_13 = null;
            this._communication = null;
            this._assetLibrary = null;
            this._roomEngine = null;
            this._localization = null;
            this._disposed = true;
         }
      }
      
      public function startTrading(param1:int, param2:String, param3:Boolean, param4:int, param5:String, param6:Boolean) : void
      {
         this.var_801 = param1;
         this.var_2480 = param2;
         this.var_280 = new Map();
         this.var_802 = false;
         this.var_2566 = param3;
         this.var_1512 = param4;
         this.var_2567 = param5;
         this.var_995 = new Map();
         this.var_1231 = false;
         this.var_1908 = param6;
         this.var_791 = true;
         this.state = const_204;
         this.var_58.setup(param1,param3,param4,param6);
         this.var_58.updateItemList(this.var_801);
         this.var_58.updateItemList(this.var_1512);
         this.var_58.updateUserInterface();
         this.var_58.clearItemLists();
         this.var_13.toggleInventoryPage(InventoryCategory.const_76);
         this.var_13.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_TRADING));
      }
      
      public function close() : void
      {
         if(this.var_791)
         {
            if(this._state != const_222 && this._state != const_244)
            {
               this.requestCancelTrading();
               this.state = TradingModel.TRADING_STATE_CANCELLED;
            }
            this.state = const_222;
            this.var_13.toggleInventorySubPage(InventorySubCategory.const_50);
            this.var_791 = false;
         }
         this.var_58.setMinimized(false);
      }
      
      public function categorySwitch(param1:String) : void
      {
         this.var_58.setMinimized(param1 != InventoryCategory.const_76);
         this.var_13.updateSubView();
      }
      
      public function set state(param1:uint) : void
      {
         Logger.log("OLD STATE: " + this._state + " NEW STATE: " + param1 + " OWN: " + this.var_802 + " OTHER: " + this.var_1231);
         var _loc2_:Boolean = false;
         if(this._state == param1)
         {
            return;
         }
         switch(this._state)
         {
            case const_222:
               if(param1 == const_204 || param1 == const_244)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               break;
            case const_204:
               if(param1 == const_438)
               {
                  this._state = param1;
                  _loc2_ = true;
                  this.startConfirmCountdown();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  this._state = param1;
                  this.var_58.setMinimized(false);
                  _loc2_ = true;
               }
               break;
            case const_438:
               if(param1 == const_356)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  this._state = param1;
                  this.var_58.setMinimized(false);
                  _loc2_ = true;
               }
               else if(param1 == const_204)
               {
                  this._state = param1;
                  _loc2_ = true;
                  this.cancelConfirmCountdown();
               }
               break;
            case const_356:
               if(param1 == const_649)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               else if(param1 == const_244)
               {
                  this._state = param1;
                  _loc2_ = true;
                  this.close();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  this._state = param1;
                  this.var_58.setMinimized(false);
                  _loc2_ = true;
                  this.close();
               }
               break;
            case const_649:
               if(param1 == const_244)
               {
                  this._state = param1;
                  this.var_58.setMinimized(false);
                  _loc2_ = true;
                  this.close();
               }
               else if(param1 == TRADING_STATE_CANCELLED)
               {
                  this._state = param1;
                  this.var_58.setMinimized(false);
                  _loc2_ = true;
                  this.close();
               }
               break;
            case const_244:
               if(param1 == const_222)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               break;
            case TRADING_STATE_CANCELLED:
               if(param1 == const_222)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               else if(param1 == const_204)
               {
                  this._state = param1;
                  _loc2_ = true;
               }
               break;
            default:
               throw new Error("Unknown trading progress state: \"" + this._state + "\"");
         }
         if(_loc2_)
         {
            this.var_58.updateUserInterface();
            return;
         }
         throw new Error("Error assigning trading process status!");
      }
      
      public function getFurniInventoryModel() : FurniModel
      {
         return this.var_13.furniModel;
      }
      
      public function updateItemGroupMaps(param1:int, param2:Map, param3:int, param4:Map) : void
      {
         if(this.var_13 == null)
         {
            return;
         }
         if(this.var_280 != null)
         {
            this.var_280.dispose();
         }
         if(this.var_995 != null)
         {
            this.var_995.dispose();
         }
         if(param1 == this.var_801)
         {
            this.var_280 = param2;
            this.var_995 = param4;
         }
         else
         {
            this.var_280 = param4;
            this.var_995 = param2;
         }
         this.var_802 = false;
         this.var_1231 = false;
         this.var_58.updateItemList(this.var_801);
         this.var_58.updateItemList(this.var_1512);
         this.var_58.updateUserInterface();
         var _loc5_:FurniModel = this.var_13.furniModel;
         if(_loc5_ != null)
         {
            _loc5_.updateItemLocks();
         }
      }
      
      public function getOwnItemIdsInTrade() : Array
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc5_:int = 0;
         var _loc1_:Array = new Array();
         if(this.var_280 == null || this.var_280.disposed)
         {
            return _loc1_;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.var_280.length)
         {
            _loc2_ = this.var_280.getWithIndex(_loc4_) as GroupItem;
            if(_loc2_ != null)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc2_.getTotalCount())
               {
                  _loc3_ = _loc2_.getAt(_loc5_);
                  if(_loc3_ != null)
                  {
                     _loc1_.push(_loc3_.ref);
                  }
                  _loc5_++;
               }
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return this.var_58.getWindowContainer();
      }
      
      public function requestInitialization(param1:int = 0) : void
      {
      }
      
      public function subCategorySwitch(param1:String) : void
      {
         if(this.var_791)
         {
            if(this._state != const_222)
            {
               this.requestCancelTrading();
            }
         }
      }
      
      public function closingInventoryView() : void
      {
         if(this.var_791)
         {
            this.close();
         }
      }
      
      public function startConfirmCountdown() : void
      {
         this.var_58.startConfirmCountdown();
      }
      
      public function cancelConfirmCountdown() : void
      {
         this.var_58.cancelConfirmCountdown();
      }
      
      public function confirmCountdownReady() : void
      {
         if(this._state == const_438)
         {
            this.state = const_356;
         }
      }
      
      public function getItemImage(param1:IItem) : BitmapData
      {
         var _loc2_:* = null;
         if(param1 is FloorItem)
         {
            _loc2_ = this._roomEngine.getFurnitureImage(param1.type,new Vector3d(180,0,0),64,this,0,String(param1.extra));
         }
         else
         {
            _loc2_ = this._roomEngine.getWallItemImage(param1.type,new Vector3d(180,0,0),64,this,0,param1.stuffData);
         }
         return _loc2_.data as BitmapData;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         this.var_58.updateItemImage(param1,param2);
      }
      
      public function handleMessageEvent(param1:IMessageEvent) : void
      {
         var _loc2_:* = null;
         if(param1 is TradingAlreadyOpenEvent)
         {
            Logger.log("TRADING::TradingAlreadyOpenEvent");
            this.var_58.alertPopup(TradingView.const_1268);
         }
         else if(param1 is TradingAcceptEvent)
         {
            Logger.log("TRADING::TradingAcceptEvent");
            if(TradingAcceptEvent(param1).userID == this.var_801)
            {
               this.var_802 = TradingAcceptEvent(param1).userAccepts != 0;
            }
            else
            {
               this.var_1231 = TradingAcceptEvent(param1).userAccepts != 0;
            }
            this.var_58.updateUserInterface();
         }
         else if(param1 is TradingConfirmationEvent)
         {
            Logger.log("TRADING::TradingConfirmationEvent");
            this.state = const_438;
         }
         else if(param1 is TradingCompletedEvent)
         {
            Logger.log("TRADING::TradingCompletedEvent");
            this.state = const_244;
         }
         else if(param1 is TradingCloseEvent)
         {
            Logger.log("TRADING::TradingCloseEvent");
            if(!this.var_791)
            {
               Logger.log("Received TradingCloseEvent, but trading already stopped!!!");
               return;
            }
            _loc2_ = param1 as TradingCloseEvent;
            if(_loc2_.userID != this.var_801)
            {
               this.var_58.alertPopup(TradingView.const_1335);
            }
            this.close();
         }
         else if(param1 is TradingNotOpenEvent)
         {
            Logger.log("TRADING::TradingNotOpenEvent");
         }
         else if(param1 is TradingOtherNotAllowedEvent)
         {
            this.var_58.showOtherUserNotification("${inventory.trading.warning.others_account_disabled}");
         }
         else if(param1 is TradingYouAreNotAllowedEvent)
         {
            this.var_58.showOwnUserNotification("${inventory.trading.warning.own_account_disabled}");
         }
         else
         {
            Logger.log("TRADING/Unknown message event: " + param1);
         }
      }
      
      public function requestFurniViewOpen() : void
      {
         this.var_13.toggleInventoryPage(InventoryCategory.const_76);
      }
      
      public function requestOpenTrading(param1:int) : void
      {
         this._communication.getHabboMainConnection(null).send(new OpenTradingComposer(param1));
      }
      
      public function requestAddItemToTrading(param1:int, param2:int, param3:int, param4:Boolean, param5:String = "") : Boolean
      {
         var _loc6_:* = null;
         if(this.var_802)
         {
            return false;
         }
         if(this.var_280 == null)
         {
            return false;
         }
         if(this.var_280.length < const_1759)
         {
            this._communication.getHabboMainConnection(null).send(new AddItemToTradeComposer(param1));
         }
         else
         {
            if(!param4)
            {
               return false;
            }
            _loc6_ = String(param2);
            if(param3 == FurniCategory.const_201)
            {
               _loc6_ = String(param2) + "poster" + param5;
            }
            if(this.var_280.getValue(_loc6_) == null)
            {
               return false;
            }
            this._communication.getHabboMainConnection(null).send(new AddItemToTradeComposer(param1));
         }
         return true;
      }
      
      public function requestRemoveItemFromTrading(param1:int) : void
      {
         var _loc3_:* = null;
         if(this.var_802)
         {
            return;
         }
         var _loc2_:GroupItem = this.ownUserItems.getWithIndex(param1);
         if(_loc2_)
         {
            _loc3_ = _loc2_.peek();
            if(_loc3_)
            {
               this._communication.getHabboMainConnection(null).send(new RemoveItemFromTradeComposer(_loc3_.id));
            }
         }
      }
      
      public function requestAcceptTrading() : void
      {
         this._communication.getHabboMainConnection(null).send(new AcceptTradingComposer());
      }
      
      public function requestUnacceptTrading() : void
      {
         this._communication.getHabboMainConnection(null).send(new UnacceptTradingComposer());
      }
      
      public function requestConfirmAcceptTrading() : void
      {
         this.state = const_649;
         this._communication.getHabboMainConnection(null).send(new ConfirmAcceptTradingComposer());
      }
      
      public function requestConfirmDeclineTrading() : void
      {
         this._communication.getHabboMainConnection(null).send(new ConfirmDeclineTradingComposer());
      }
      
      public function requestCancelTrading() : void
      {
         this._communication.getHabboMainConnection(null).send(new CloseTradingComposer());
      }
   }
}
