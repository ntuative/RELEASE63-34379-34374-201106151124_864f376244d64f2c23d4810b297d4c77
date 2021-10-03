package com.sulake.habbo.session
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.room.session.RoomReadyMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
   import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.session.RoomReadyMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.events.UserNameUpdateEvent;
   import com.sulake.habbo.session.facebook.FaceBookSession;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.IProductDataListener;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class SessionDataManager extends Component implements ISessionDataManager
   {
       
      
      private var _communication:IHabboCommunicationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_16:IRoomSessionManager;
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      private var var_1118:String;
      
      private var var_1699:String;
      
      private var var_2379:int = 0;
      
      private var var_1182:int = 0;
      
      private var var_765:int = 0;
      
      private var var_3025:Array;
      
      private var var_1780:GroupDetailsView;
      
      private var var_2376:Boolean;
      
      private var var_2378:Boolean;
      
      private var var_1354:Dictionary;
      
      private var var_619:ProductDataParser;
      
      private var var_526:Map;
      
      private var _wallItems:Map;
      
      private var var_527:Map;
      
      private var var_318:FurnitureDataParser;
      
      private var var_1784:UserTagManager;
      
      private var var_1183:BadgeImageManager;
      
      private var var_1181:HabboGroupInfoManager;
      
      private var var_963:IgnoredUsersManager;
      
      private var var_182:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_1781:Boolean = false;
      
      private var var_1180:Array;
      
      private var var_962:Array;
      
      private var var_1783:int;
      
      private var var_1782:int;
      
      private var var_2377:int;
      
      private var var_1179:FaceBookSession;
      
      public function SessionDataManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_3025 = [];
         this.var_1784 = new UserTagManager(events);
         this.var_1181 = new HabboGroupInfoManager(this,events);
         this.var_963 = new IgnoredUsersManager(this);
         this.var_1179 = new FaceBookSession();
         this.var_1354 = new Dictionary();
         this.var_1180 = [];
         this.var_962 = [];
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      override public function dispose() : void
      {
         if(this.var_526)
         {
            this.var_526.dispose();
            this.var_526 = null;
         }
         if(this.var_527)
         {
            this.var_527.dispose();
            this.var_527 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_16)
         {
            this.var_16.release(new IIDHabboRoomSessionManager());
            this.var_16 = null;
         }
         if(this.var_182)
         {
            this.var_182.release(new IIDHabboConfigurationManager());
            this.var_182 = null;
         }
         if(this._localization)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         this.var_962 = null;
         if(this.var_318)
         {
            this.var_318.removeEventListener(FurnitureDataParser.const_136,this.onFurnitureReady);
            this.var_318.dispose();
            this.var_318 = null;
         }
         if(this.var_619)
         {
            this.var_619.removeEventListener(ProductDataParser.const_136,this.onProductsReady);
            this.var_619.dispose();
            this.var_619 = null;
         }
         if(this.var_1179)
         {
            this.var_1179.dispose();
            this.var_1179 = null;
         }
         super.dispose();
      }
      
      private function initBadgeImageManager() : void
      {
         if(this.var_1183 != null)
         {
            return;
         }
         if(this.var_182 == null || this._localization == null)
         {
            return;
         }
         this.var_1183 = new BadgeImageManager(context.root.assets,events,this.var_182,this._localization);
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         this._communication = param2 as IHabboCommunicationManager;
         if(this._communication == null)
         {
            return;
         }
         this._communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
         this._communication.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
         this._communication.addHabboConnectionMessageEvent(new UserChangeMessageEvent(this.onUserChange));
         this._communication.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(this.onUserNameChange));
         this._communication.addHabboConnectionMessageEvent(new ChangeUserNameResultMessageEvent(this.onChangeUserNameResult));
         this._communication.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(this.onAvailabilityStatus));
         this._communication.addHabboConnectionMessageEvent(new PetRespectFailedEvent(this.onPetRespectFailed));
         this._communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
         this._communication.addHabboConnectionMessageEvent(new RoomReadyMessageEvent(this.onRoomReady) as IMessageEvent);
         this.var_1784.communication = this._communication;
         this.var_1181.communication = this._communication;
         this.var_1179.communication = this._communication;
         this.var_963.registerMessageEvents();
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         var _loc3_:* = null;
         if(param2 == null)
         {
            return;
         }
         this.var_182 = param2 as IHabboConfigurationManager;
         this.initBadgeImageManager();
         if(!this.var_318)
         {
            this.var_526 = new Map();
            this._wallItems = new Map();
            this.var_527 = new Map();
            this.var_318 = new FurnitureDataParser(this.var_526,this._wallItems,this.var_527,this._localization);
            this.var_318.addEventListener(FurnitureDataParser.const_136,this.onFurnitureReady);
            if(this.var_182.keyExists("furnidata.load.url"))
            {
               _loc3_ = this.var_182.getKey("furnidata.load.url");
               this.var_318.loadData(_loc3_);
            }
         }
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._localization = param2 as IHabboLocalizationManager;
         this.initBadgeImageManager();
         if(this.var_318)
         {
            this.var_318.localization = this._localization;
            this.var_318.registerFurnitureLocalizations();
         }
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_16 = param2 as IRoomSessionManager;
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         this.var_318.removeEventListener(FurnitureDataParser.const_136,this.onFurnitureReady);
         for each(_loc2_ in this.var_962)
         {
            _loc2_.furniDataReady();
         }
         this.var_962 = [];
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:UserRightsMessageEvent = UserRightsMessageEvent(param1);
         this.var_1783 = _loc2_.clubLevel;
         this.var_1782 = _loc2_.securityLevel;
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectEvent = param1 as UserObjectEvent;
         var _loc3_:UserObjectMessageParser = _loc2_.getParser();
         this._id = _loc3_.id;
         this._name = _loc3_.name;
         this.var_2379 = _loc3_.respectTotal;
         this.var_1182 = _loc3_.respectLeft;
         this.var_765 = _loc3_.petRespectLeft;
         this._figure = _loc3_.figure;
         this.var_1118 = _loc3_.sex;
         this.var_1699 = _loc3_.realName;
         this.var_2377 = _loc3_.identityId;
         this.var_963.initIgnoreList();
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            this._figure = _loc2_.figure;
            this.var_1118 = _loc2_.sex;
            events.dispatchEvent(new HabboSessionFigureUpdatedEvent(this._id,this._figure,this.var_1118));
         }
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         if(_loc3_.webId == this._id)
         {
            this._name = _loc3_.newName;
            events.dispatchEvent(new UserNameUpdateEvent(this._name));
         }
      }
      
      private function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_498)
         {
            events.dispatchEvent(new UserNameUpdateEvent(_loc2_.name));
         }
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:AvailabilityStatusMessageParser = (param1 as AvailabilityStatusMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_2376 = _loc2_.isOpen;
         this.var_2378 = _loc2_.onShutDown;
      }
      
      private function onPetRespectFailed(param1:PetRespectFailedEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         ++this.var_765;
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         this.loadProductData();
      }
      
      public function get systemOpen() : Boolean
      {
         return this.var_2376;
      }
      
      public function get systemShutDown() : Boolean
      {
         return this.var_2378;
      }
      
      public function hasSecurity(param1:int) : Boolean
      {
         return this.var_1782 >= param1;
      }
      
      public function hasUserRight(param1:String, param2:int) : Boolean
      {
         return this.var_1783 >= param2;
      }
      
      public function get clubLevel() : int
      {
         return this.var_1783;
      }
      
      public function get userId() : int
      {
         return this._id;
      }
      
      public function get identityId() : int
      {
         return this.var_2377;
      }
      
      public function get userName() : String
      {
         return this._name;
      }
      
      public function get realName() : String
      {
         return this.var_1699;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_1782 >= SecurityLevelEnum.const_1177;
      }
      
      public function getUserTags(param1:int) : Array
      {
         return this.var_1784.getTags(param1);
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return this.var_1183.getBadgeImage(param1);
      }
      
      public function getBadgeImageWithInfo(param1:String) : BadgeInfo
      {
         return this.var_1183.getBadgeImageWithInfo(param1);
      }
      
      public function showGroupBadgeInfo(param1:int) : void
      {
         if(this.var_1780 == null)
         {
            this.var_1780 = new GroupDetailsView(this);
         }
         var _loc2_:HabboGroupDetails = this.var_1181.getGroupDetails(param1);
         if(_loc2_ != null)
         {
            this.var_1780.showGroupDetails(param1);
         }
      }
      
      public function getGroupDetails(param1:int) : HabboGroupDetails
      {
         return this.var_1181.getGroupDetails(param1);
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return this.var_1181.getBadgeId(param1);
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return this.var_1183.getBadgeImage(param1,BadgeImageManager.const_1365);
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return this.var_963.isIgnored(param1);
      }
      
      public function ignoreUser(param1:String) : void
      {
         this.var_963.ignoreUser(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         this.var_963.unignoreUser(param1);
      }
      
      public function get respectLeft() : int
      {
         return this.var_1182;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_765;
      }
      
      public function giveRespect(param1:int) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(param1 < 0 || this.var_1182 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to user: " + param1);
         }
         _loc2_.send(new RespectUserMessageComposer(param1));
         this.var_1182 = this.var_1182 - 1;
      }
      
      public function givePetRespect(param1:int) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(param1 < 0 || this.var_765 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to pet: " + param1);
         }
         _loc2_.send(new RespectPetMessageComposer(param1));
         this.var_765 = this.var_765 - 1;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_182;
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!this.var_1781)
         {
            this.loadProductData();
         }
         return this.var_1354[param1];
      }
      
      public function getFloorItemData(param1:int) : IFurnitureData
      {
         if(this.var_526 == null)
         {
            return null;
         }
         return this.var_526.getValue(param1.toString());
      }
      
      public function getWallItemData(param1:int) : IFurnitureData
      {
         if(this._wallItems == null)
         {
            return null;
         }
         return this._wallItems.getValue(param1.toString());
      }
      
      public function getFloorItemDataByName(param1:String, param2:int = 0) : IFurnitureData
      {
         var _loc4_:int = 0;
         if(this.var_527 == null)
         {
            return null;
         }
         var _loc3_:Array = this.var_527.getValue(param1);
         if(_loc3_ != null && param2 <= _loc3_.length - 1)
         {
            _loc4_ = _loc3_[param2];
            return this.getFloorItemData(_loc4_);
         }
         return null;
      }
      
      public function getWallItemDataByName(param1:String, param2:int = 0) : IFurnitureData
      {
         var _loc4_:int = 0;
         if(this.var_527 == null)
         {
            return null;
         }
         var _loc3_:Array = this.var_527.getValue(param1);
         if(_loc3_ != null && param2 <= _loc3_.length - 1)
         {
            _loc4_ = _loc3_[param2];
            return this.getWallItemData(_loc4_);
         }
         return null;
      }
      
      public function openHabboHomePage(param1:int) : void
      {
         var urlString:String = null;
         var userId:int = param1;
         if(this.var_182 != null)
         {
            urlString = this.var_182.getKey("link.format.userpage");
            urlString = urlString.replace("%ID%",String(userId));
            try
            {
               HabboWebTools.navigateToURL(urlString,"habboMain");
            }
            catch(e:Error)
            {
               Logger.log("Error occurred!");
            }
         }
      }
      
      public function pickAllFurniture(param1:int, param2:int) : void
      {
         var roomId:int = param1;
         var roomCategory:int = param2;
         if(this.var_16 == null || this._windowManager == null)
         {
            return;
         }
         var session:IRoomSession = this.var_16.getSession(roomId,roomCategory);
         if(session == null)
         {
            return;
         }
         if(session.isRoomOwner || this.isAnyRoomController)
         {
            this._windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:IConfirmDialog, param2:WindowEvent):void
            {
               param1.dispose();
               if(param2.type == WindowEvent.const_181)
               {
                  sendPickAllFurnitureMessage();
               }
            });
         }
      }
      
      public function loadProductData(param1:IProductDataListener = null) : Boolean
      {
         var _loc2_:* = null;
         if(this.var_1781)
         {
            return true;
         }
         if(param1 && this.var_1180.indexOf(param1) == -1)
         {
            this.var_1180.push(param1);
         }
         if(!this.var_182)
         {
            return false;
         }
         if(this.var_619 == null)
         {
            _loc2_ = this.var_182.getKey("productdata.load.url");
            this.var_619 = new ProductDataParser(_loc2_,this.var_1354);
            this.var_619.addEventListener(ProductDataParser.const_136,this.onProductsReady);
         }
         return false;
      }
      
      private function onProductsReady(param1:Event) : void
      {
         var _loc2_:* = null;
         this.var_619.removeEventListener(ProductDataParser.const_136,this.onProductsReady);
         this.var_1781 = true;
         for each(_loc2_ in this.var_1180)
         {
            if(_loc2_ != null && !_loc2_.disposed)
            {
               _loc2_.productDataReady();
            }
         }
         this.var_1180 = [];
      }
      
      private function onRoomReady(param1:IMessageEvent) : void
      {
         var _loc2_:RoomReadyMessageEvent = param1 as RoomReadyMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null || param1.connection == null)
         {
            return;
         }
         var _loc3_:RoomReadyMessageParser = _loc2_.getParser();
         HabboWebTools.roomVisited(_loc3_.roomId);
      }
      
      private function sendPickAllFurnitureMessage() : void
      {
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new ChatMessageComposer(":pickall"));
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return this.var_16;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get gender() : String
      {
         return this.var_1118;
      }
      
      public function getFurniData(param1:IFurniDataListener) : Array
      {
         if(this.var_526.length == 0)
         {
            if(this.var_962.indexOf(param1) == -1)
            {
               this.var_962.push(param1);
            }
            return null;
         }
         var _loc2_:Array = this.var_526.getValues();
         return _loc2_.concat(this._wallItems.getValues());
      }
   }
}
