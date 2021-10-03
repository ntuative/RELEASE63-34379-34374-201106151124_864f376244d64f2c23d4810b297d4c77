package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_1937:int;
      
      private var var_1547:Array;
      
      private var var_1137:Array;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function get method_2() : int
      {
         return this.var_1937;
      }
      
      public function get allCommands() : Array
      {
         return this.var_1547;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_1137;
      }
      
      public function flush() : Boolean
      {
         this.var_1937 = -1;
         this.var_1547 = null;
         this.var_1137 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1937 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1547 = new Array();
         while(_loc2_-- > 0)
         {
            this.var_1547.push(param1.readInteger());
         }
         var _loc3_:int = param1.readInteger();
         this.var_1137 = new Array();
         while(_loc3_-- > 0)
         {
            this.var_1137.push(param1.readInteger());
         }
         return true;
      }
   }
}
