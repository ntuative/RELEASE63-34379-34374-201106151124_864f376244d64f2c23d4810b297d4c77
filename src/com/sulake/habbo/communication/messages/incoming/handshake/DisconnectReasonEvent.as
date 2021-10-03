package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2258:int = 0;
      
      public static const const_1795:int = 1;
      
      public static const const_1886:int = 2;
      
      public static const const_2269:int = 3;
      
      public static const const_2090:int = 4;
      
      public static const const_2088:int = 5;
      
      public static const const_1808:int = 10;
      
      public static const const_2081:int = 11;
      
      public static const const_2149:int = 12;
      
      public static const const_2194:int = 13;
      
      public static const const_2201:int = 16;
      
      public static const const_2228:int = 17;
      
      public static const const_2212:int = 18;
      
      public static const const_2222:int = 19;
      
      public static const const_2235:int = 20;
      
      public static const const_2098:int = 22;
      
      public static const const_2087:int = 23;
      
      public static const const_2260:int = 24;
      
      public static const const_2129:int = 25;
      
      public static const const_2207:int = 26;
      
      public static const const_2273:int = 27;
      
      public static const const_2242:int = 28;
      
      public static const const_2193:int = 29;
      
      public static const const_2114:int = 100;
      
      public static const const_2101:int = 101;
      
      public static const const_2254:int = 102;
      
      public static const const_2218:int = 103;
      
      public static const const_2162:int = 104;
      
      public static const const_2071:int = 105;
      
      public static const const_2262:int = 106;
      
      public static const const_2140:int = 107;
      
      public static const const_2186:int = 108;
      
      public static const const_2127:int = 109;
      
      public static const const_2173:int = 110;
      
      public static const const_2079:int = 111;
      
      public static const const_2206:int = 112;
      
      public static const const_2128:int = 113;
      
      public static const const_2231:int = 114;
      
      public static const const_2250:int = 115;
      
      public static const const_2247:int = 116;
      
      public static const const_2256:int = 117;
      
      public static const const_2061:int = 118;
      
      public static const const_2138:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1795:
            case const_1808:
               return "banned";
            case const_1886:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
