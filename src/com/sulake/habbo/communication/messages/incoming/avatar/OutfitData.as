package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2156:int;
      
      private var var_2683:String;
      
      private var var_1118:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2156 = param1.readInteger();
         this.var_2683 = param1.readString();
         this.var_1118 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_2156;
      }
      
      public function get figureString() : String
      {
         return this.var_2683;
      }
      
      public function get gender() : String
      {
         return this.var_1118;
      }
   }
}
