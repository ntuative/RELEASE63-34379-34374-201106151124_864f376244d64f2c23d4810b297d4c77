package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView implements IDisposable
   {
       
      
      private var var_147:HabboMessenger;
      
      private var var_1108:ConversationsTabView;
      
      private var var_1017:ITextFieldWindow;
      
      private var var_17:IFrameWindow;
      
      private var var_1638:ConversationView;
      
      private var var_520:Timer;
      
      private var _disposed:Boolean = false;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         this.var_147 = param1;
         this.var_520 = new Timer(300,1);
         this.var_520.addEventListener(TimerEvent.TIMER,this.onResizeTimer);
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_520)
            {
               this.var_520.stop();
               this.var_520.removeEventListener(TimerEvent.TIMER,this.onResizeTimer);
               this.var_520 = null;
            }
            this.var_147 = null;
            this._disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function isMessengerOpen() : Boolean
      {
         return this.var_17 != null && this.var_17.visible;
      }
      
      public function close() : void
      {
         if(this.var_17 != null)
         {
            this.var_17.visible = false;
         }
      }
      
      public function openMessenger() : void
      {
         if(this.var_147.conversations.openConversations.length < 1)
         {
            return;
         }
         if(this.var_17 == null)
         {
            this.prepareContent();
            this.refresh();
         }
         else
         {
            this.refresh();
            this.var_17.visible = true;
            this.var_17.activate();
         }
      }
      
      public function refresh() : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         var _loc1_:Conversation = this.var_147.conversations.findSelectedConversation();
         this.var_17.caption = _loc1_ == null ? "" : _loc1_.name;
         this.var_1108.refresh();
         this.var_1638.refresh();
         if(this.var_147.conversations.openConversations.length < 1)
         {
            this.var_17.visible = false;
         }
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         this.var_1638.addMessage(param2);
      }
      
      private function prepareContent() : void
      {
         this.var_17 = IFrameWindow(this.var_147.getXmlWindow("main_window"));
         var _loc1_:IWindow = this.var_17.findChildByTag("close");
         _loc1_.procedure = this.onWindowClose;
         this.var_17.procedure = this.onWindow;
         this.var_17.title.color = 4294623744;
         this.var_17.title.textColor = 4287851525;
         this.var_1108 = new ConversationsTabView(this.var_147,this.var_17);
         this.var_1108.refresh();
         this.var_1017 = ITextFieldWindow(this.var_17.findChildByName("message_input"));
         this.var_1017.addEventListener(WindowKeyboardEvent.const_193,this.onMessageInput);
         this.var_1638 = new ConversationView(this.var_147,this.var_17);
         this.var_17.scaler.setParamFlag(HabboWindowParam.const_889,false);
         this.var_17.scaler.setParamFlag(HabboWindowParam.const_1383,true);
         this.var_17.center();
      }
      
      private function onMessageInput(param1:WindowKeyboardEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(param1.charCode == Keyboard.ENTER)
         {
            this.sendMsg();
         }
         else
         {
            _loc2_ = 120;
            _loc3_ = this.var_1017.text;
            if(_loc3_.length > _loc2_)
            {
               this.var_1017.text = _loc3_.substring(0,_loc2_);
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_42 || param2 != this.var_17)
         {
            return;
         }
         if(!this.var_520.running)
         {
            this.var_520.reset();
            this.var_520.start();
         }
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1638.afterResize();
         this.var_1108.refresh();
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.var_17.visible = false;
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = this.var_1017.text;
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = this.var_147.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         this.var_147.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         if(_loc2_.messages.length == 1)
         {
            this.var_147.playSendSound();
         }
         this.var_1017.text = "";
         this.var_147.conversations.addMessageAndUpdateView(new Message(Message.const_745,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      public function getTabCount() : int
      {
         return this.var_1108 == null ? 7 : int(this.var_1108.getTabCount());
      }
   }
}
