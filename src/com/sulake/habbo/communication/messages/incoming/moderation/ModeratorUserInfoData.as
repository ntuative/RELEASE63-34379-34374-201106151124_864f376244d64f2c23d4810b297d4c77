package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2856:int;
      
      private var var_2857:int;
      
      private var var_827:Boolean;
      
      private var var_2858:int;
      
      private var var_2860:int;
      
      private var var_2861:int;
      
      private var var_2859:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2856 = param1.readInteger();
         this.var_2857 = param1.readInteger();
         this.var_827 = param1.readBoolean();
         this.var_2858 = param1.readInteger();
         this.var_2860 = param1.readInteger();
         this.var_2861 = param1.readInteger();
         this.var_2859 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2856;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2857;
      }
      
      public function get online() : Boolean
      {
         return this.var_827;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2858;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2860;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2861;
      }
      
      public function get banCount() : int
      {
         return this.var_2859;
      }
   }
}
