package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_235:int = 0;
      
      private var var_2075:int = 0;
      
      private var var_1844:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_235;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_2075;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1844;
      }
      
      public function flush() : Boolean
      {
         this.var_235 = 0;
         this.var_2075 = 0;
         this.var_1844 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_235 = param1.readInteger();
         this.var_2075 = param1.readInteger();
         this.var_1844 = param1.readString();
         return true;
      }
   }
}
