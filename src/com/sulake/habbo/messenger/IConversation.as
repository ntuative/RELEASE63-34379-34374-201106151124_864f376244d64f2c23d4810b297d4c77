package com.sulake.habbo.messenger
{
   public interface IConversation
   {
       
      
      function get id() : int;
      
      function get name() : String;
      
      function get selected() : Boolean;
      
      function get messages() : Array;
      
      function get newMessageArrived() : Boolean;
      
      function get figure() : String;
      
      function get method_1() : Boolean;
      
      function get disposed() : Boolean;
   }
}
