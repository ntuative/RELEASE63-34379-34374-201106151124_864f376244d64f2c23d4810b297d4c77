package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2541:String;
      
      private var var_2543:Class;
      
      private var var_2542:Class;
      
      private var var_1872:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2541 = param1;
         this.var_2543 = param2;
         this.var_2542 = param3;
         if(rest == null)
         {
            this.var_1872 = new Array();
         }
         else
         {
            this.var_1872 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2541;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2543;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2542;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1872;
      }
   }
}
