package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2311:int;
      
      private var var_1931:String;
      
      private var var_2309:String;
      
      private var var_2312:Boolean;
      
      private var var_2310:Boolean;
      
      private var var_2307:int;
      
      private var var_2308:String;
      
      private var var_2313:String;
      
      private var var_1699:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2311 = param1.readInteger();
         this.var_1931 = param1.readString();
         this.var_2309 = param1.readString();
         this.var_2312 = param1.readBoolean();
         this.var_2310 = param1.readBoolean();
         param1.readString();
         this.var_2307 = param1.readInteger();
         this.var_2308 = param1.readString();
         this.var_2313 = param1.readString();
         this.var_1699 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2311;
      }
      
      public function get avatarName() : String
      {
         return this.var_1931;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2309;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2312;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2310;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2307;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2308;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2313;
      }
      
      public function get realName() : String
      {
         return this.var_1699;
      }
   }
}
