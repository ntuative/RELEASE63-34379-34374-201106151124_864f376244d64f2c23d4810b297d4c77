package com.sulake.habbo.communication.encryption
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.communication.handshake.IKeyExchange;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1102:BigInteger;
      
      private var var_2506:BigInteger;
      
      private var var_1864:BigInteger;
      
      private var var_2507:BigInteger;
      
      private var var_1493:BigInteger;
      
      private var var_1865:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1493 = param1;
         this.var_1865 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1493.toString() + ",generator: " + this.var_1865.toString() + ",secret: " + param1);
         this.var_1102 = new BigInteger();
         this.var_1102.fromRadix(param1,param2);
         this.var_2506 = this.var_1865.modPow(this.var_1102,this.var_1493);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1864 = new BigInteger();
         this.var_1864.fromRadix(param1,param2);
         this.var_2507 = this.var_1864.modPow(this.var_1102,this.var_1493);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2506.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2507.toRadix(param1);
      }
   }
}
