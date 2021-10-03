package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_201:IWindowContainer;
      
      private var var_3038:int;
      
      private var var_392:RoomEventViewCtrl;
      
      private var var_393:Timer;
      
      private var var_152:RoomSettingsCtrl;
      
      private var var_289:RoomThumbnailCtrl;
      
      private var var_1052:TagRenderer;
      
      private var var_394:IWindowContainer;
      
      private var var_395:IWindowContainer;
      
      private var var_681:IWindowContainer;
      
      private var var_2001:IWindowContainer;
      
      private var var_2000:IWindowContainer;
      
      private var var_1296:IWindowContainer;
      
      private var var_967:ITextWindow;
      
      private var var_1049:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_857:ITextWindow;
      
      private var var_1294:ITextWindow;
      
      private var var_1050:ITextWindow;
      
      private var var_856:ITextWindow;
      
      private var var_1582:ITextWindow;
      
      private var var_290:IWindowContainer;
      
      private var var_854:IWindowContainer;
      
      private var var_1579:IWindowContainer;
      
      private var var_1998:ITextWindow;
      
      private var var_682:ITextWindow;
      
      private var var_1999:IWindow;
      
      private var var_1295:IContainerButtonWindow;
      
      private var var_1293:IContainerButtonWindow;
      
      private var var_1292:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1297:IContainerButtonWindow;
      
      private var var_1580:IButtonWindow;
      
      private var var_1581:IButtonWindow;
      
      private var var_1584:IButtonWindow;
      
      private var var_855:IWindowContainer;
      
      private var var_1291:ITextWindow;
      
      private var var_1051:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_853:IButtonWindow;
      
      private var var_1583:Boolean = false;
      
      private const const_914:int = 75;
      
      private const const_971:int = 3;
      
      private const const_919:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_392 = new RoomEventViewCtrl(this._navigator);
         this.var_152 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_289 = new RoomThumbnailCtrl(this._navigator);
         this.var_1052 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_152);
         this.var_393 = new Timer(6000,1);
         this.var_393.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_393)
         {
            this.var_393.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_393.reset();
            this.var_393 = null;
         }
         this._navigator = null;
         this.var_392 = null;
         this.var_152 = null;
         this.var_289 = null;
         if(this.var_1052)
         {
            this.var_1052.dispose();
            this.var_1052 = null;
         }
         this.var_201 = null;
         this.var_394 = null;
         this.var_395 = null;
         this.var_681 = null;
         this.var_2001 = null;
         this.var_2000 = null;
         this.var_1296 = null;
         this.var_967 = null;
         this.var_1049 = null;
         this._ownerName = null;
         this.var_857 = null;
         this.var_1294 = null;
         this.var_1050 = null;
         this.var_856 = null;
         this.var_1582 = null;
         this.var_290 = null;
         this.var_854 = null;
         this.var_1579 = null;
         this.var_1998 = null;
         this.var_682 = null;
         this.var_1999 = null;
         this.var_1295 = null;
         this.var_1293 = null;
         this.var_1292 = null;
         this._remFavouriteButton = null;
         this.var_1297 = null;
         this.var_1580 = null;
         this.var_1581 = null;
         this.var_1584 = null;
         this.var_855 = null;
         this.var_1291 = null;
         this.var_1051 = null;
         this._buttons = null;
         this.var_853 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_393.reset();
         this.var_392.active = true;
         this.var_152.active = false;
         this.var_289.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_393.reset();
         this.var_152.load(param1);
         this.var_152.active = true;
         this.var_392.active = false;
         this.var_289.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_152.active = true;
         this.var_392.active = false;
         this.var_289.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_393.reset();
         this.var_152.active = false;
         this.var_392.active = false;
         this.var_289.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this.var_1583 = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_393.reset();
         this.var_392.active = false;
         this.var_152.active = false;
         this.var_289.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_971;
         this._window.y = this.const_914;
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_201,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_201.height = Util.getLowestPoint(this.var_201);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_919;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_394);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_152.refresh(this.var_394);
         this.var_289.refresh(this.var_394);
         Util.moveChildrenToColumn(this.var_394,["room_details","room_buttons"],0,2);
         this.var_394.height = Util.getLowestPoint(this.var_394);
         this.var_394.visible = true;
         Logger.log("XORP: " + this.var_395.visible + ", " + this.var_1296.visible + ", " + this.var_681.visible + ", " + this.var_681.rectangle + ", " + this.var_394.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_290);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_392.refresh(this.var_290);
         if(Util.hasVisibleChildren(this.var_290) && !(this.var_152.active || this.var_289.active))
         {
            Util.moveChildrenToColumn(this.var_290,["event_details","event_buttons"],0,2);
            this.var_290.height = Util.getLowestPoint(this.var_290);
            this.var_290.visible = true;
         }
         else
         {
            this.var_290.visible = false;
         }
         Logger.log("EVENT: " + this.var_290.visible + ", " + this.var_290.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","QuestsList") == "HabboRoomUICom_pet_command";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_152.active && !this.var_289.active && !this.var_392.active)
         {
            this.var_855.visible = true;
            this.var_1051.text = this.getEmbedData();
         }
         else
         {
            this.var_855.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_152.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_853)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_853.visible = _loc1_;
            if(this.var_1583)
            {
               this.var_853.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_853.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_152.active || this.var_289.active)
         {
            return;
         }
         this.var_967.text = param1.roomName;
         this.var_967.height = this.var_967.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_857.text = param1.description;
         this.var_1052.refreshTags(this.var_395,param1.tags);
         this.var_857.visible = false;
         if(param1.description != "")
         {
            this.var_857.height = this.var_857.textHeight + 5;
            this.var_857.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1293,"facebook_logo_small",_loc3_,null,0);
         this.var_1293.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1295,"thumb_up",_loc4_,null,0);
         this.var_1295.visible = _loc4_;
         this.var_856.visible = !_loc4_;
         this.var_1582.visible = !_loc4_;
         this.var_1582.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_395,"home",param2,null,0);
         this._navigator.refreshButton(this.var_395,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_395,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_967.y,0);
         this.var_395.visible = true;
         this.var_395.height = Util.getLowestPoint(this.var_395);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_395.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_152.active || this.var_289.active)
         {
            return;
         }
         this.var_1049.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1049.height = this.var_1049.textHeight + 5;
         this.var_1294.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1294.height = this.var_1294.textHeight + 5;
         Util.moveChildrenToColumn(this.var_681,["public_space_name","public_space_desc"],this.var_1049.y,0);
         this.var_681.visible = true;
         this.var_681.height = Math.max(86,Util.getLowestPoint(this.var_681));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_392.active)
         {
            return;
         }
         this.var_1998.text = param1.eventName;
         this.var_682.text = param1.eventDescription;
         this.var_1052.refreshTags(this.var_854,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_682.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_682.height = this.var_682.textHeight + 5;
            this.var_682.y = Util.getLowestPoint(this.var_854) + 2;
            this.var_682.visible = true;
         }
         this.var_854.visible = true;
         this.var_854.height = Util.getLowestPoint(this.var_854);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_152.active || this.var_289.active)
         {
            return;
         }
         this.var_1580.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1292.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1297.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1296.visible = Util.hasVisibleChildren(this.var_1296);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_392.active)
         {
            return;
         }
         this.var_1581.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1584.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1579.visible = Util.hasVisibleChildren(this.var_1579);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_201 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_394 = IWindowContainer(this.find("room_info"));
         this.var_395 = IWindowContainer(this.find("room_details"));
         this.var_681 = IWindowContainer(this.find("public_space_details"));
         this.var_2001 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2000 = IWindowContainer(this.find("rating_cont"));
         this.var_1296 = IWindowContainer(this.find("room_buttons"));
         this.var_967 = ITextWindow(this.find("room_name"));
         this.var_1049 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_857 = ITextWindow(this.find("room_desc"));
         this.var_1294 = ITextWindow(this.find("public_space_desc"));
         this.var_1050 = ITextWindow(this.find("owner_caption"));
         this.var_856 = ITextWindow(this.find("rating_caption"));
         this.var_1582 = ITextWindow(this.find("rating_txt"));
         this.var_290 = IWindowContainer(this.find("event_info"));
         this.var_854 = IWindowContainer(this.find("event_details"));
         this.var_1579 = IWindowContainer(this.find("event_buttons"));
         this.var_1998 = ITextWindow(this.find("event_name"));
         this.var_682 = ITextWindow(this.find("event_desc"));
         this.var_1293 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1295 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_1999 = this.find("staff_pick_button");
         this.var_1292 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1297 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1580 = IButtonWindow(this.find("room_settings_button"));
         this.var_1581 = IButtonWindow(this.find("create_event_button"));
         this.var_1584 = IButtonWindow(this.find("edit_event_button"));
         this.var_855 = IWindowContainer(this.find("embed_info"));
         this.var_1291 = ITextWindow(this.find("embed_info_txt"));
         this.var_1051 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_853 = IButtonWindow(this.find("zoom_button"));
         this.addMouseClickListener(this.var_1292,this.onAddFavouriteClick);
         this.addMouseClickListener(this._remFavouriteButton,this.onRemoveFavouriteClick);
         this.addMouseClickListener(this.var_1580,this.onRoomSettingsClick);
         this.addMouseClickListener(this.var_1297,this.onMakeHomeClick);
         this.addMouseClickListener(this.var_1581,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1584,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1051,this.onEmbedSrcClick);
         this.addMouseClickListener(this.var_1295,this.onThumbUp);
         this.addMouseClickListener(this.var_1999,this.onStaffPick);
         this.addMouseClickListener(this.var_1293,this.onFacebookLike);
         this.addMouseClickListener(this.var_853,this.onZoomClick);
         this._navigator.refreshButton(this.var_1292,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1297,"home",true,null,0);
         this.addMouseClickListener(this._window.findChildByTag("close"),this.onCloseButtonClick);
         this.addMouseOverListener(this.var_394,this.onHover);
         this.addMouseOverListener(this.var_290,this.onHover);
         this.var_1050.width = this.var_1050.textWidth;
         Util.moveChildrenToRow(this.var_2001,["owner_caption","owner_name"],this.var_1050.x,this.var_1050.y,3);
         this.var_856.width = this.var_856.textWidth;
         Util.moveChildrenToRow(this.var_2000,["rating_caption","rating_txt"],this.var_856.x,this.var_856.y,3);
         this.var_1291.height = this.var_1291.textHeight + 5;
         Util.moveChildrenToColumn(this.var_855,["embed_info_txt","embed_src_txt"],this.var_1291.y,2);
         this.var_855.height = Util.getLowestPoint(this.var_855) + 5;
         this.var_3038 = this._window.y + this._window.height;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function addMouseOverListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,param2);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc2_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc2_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc2_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc2_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc2_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent) : void
      {
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent) : void
      {
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent) : void
      {
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onFacebookLike(param1:WindowEvent) : void
      {
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent) : void
      {
         this.var_1051.setSelection(0,this.var_1051.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent) : void
      {
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.const_350));
         this.var_1583 = !this.var_1583;
         this.refreshButtons();
      }
      
      private function onHover(param1:WindowEvent) : void
      {
         this.var_393.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_152 != null)
         {
            this.var_152.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
