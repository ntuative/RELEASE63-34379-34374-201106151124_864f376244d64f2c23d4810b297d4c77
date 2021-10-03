package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_2131:int;
      
      private var var_2279:String;
      
      private var var_347:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_2131 = param1.readInteger();
         this.var_2279 = param1.readString();
         this.var_347 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_2131;
      }
      
      public function get nodeName() : String
      {
         return this.var_2279;
      }
      
      public function get visible() : Boolean
      {
         return this.var_347;
      }
   }
}
