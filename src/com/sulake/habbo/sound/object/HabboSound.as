package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1170:Sound = null;
      
      private var var_430:SoundChannel = null;
      
      private var var_937:Number;
      
      private var _complete:Boolean;
      
      public function HabboSound(param1:Sound)
      {
         super();
         this.var_1170 = param1;
         this.var_1170.addEventListener(Event.COMPLETE,this.onComplete);
         this.var_937 = 1;
         this._complete = false;
      }
      
      public function play(param1:Number = 0.0) : Boolean
      {
         this._complete = false;
         this.var_430 = this.var_1170.play(0);
         this.volume = this.var_937;
         return true;
      }
      
      public function stop() : Boolean
      {
         this.var_430.stop();
         return true;
      }
      
      public function get volume() : Number
      {
         return this.var_937;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_937 = param1;
         if(this.var_430 != null)
         {
            this.var_430.soundTransform = new SoundTransform(this.var_937);
         }
      }
      
      public function get position() : Number
      {
         return this.var_430.position;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get length() : Number
      {
         return this.var_1170.length;
      }
      
      public function get ready() : Boolean
      {
         return !this.var_1170.isBuffering;
      }
      
      public function get finished() : Boolean
      {
         return !this._complete;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return 0;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
      }
      
      public function get fadeInSeconds() : Number
      {
         return 0;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
      }
      
      private function onComplete(param1:Event) : void
      {
         this._complete = true;
      }
   }
}
