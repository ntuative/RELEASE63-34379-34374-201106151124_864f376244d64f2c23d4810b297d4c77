package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1864:String = "pricing_model_unknown";
      
      public static const const_404:String = "pricing_model_single";
      
      public static const const_442:String = "pricing_model_multi";
      
      public static const const_530:String = "pricing_model_bundle";
      
      public static const const_1869:String = "price_type_none";
      
      public static const const_950:String = "price_type_credits";
      
      public static const const_1284:String = "price_type_activitypoints";
      
      public static const const_1150:String = "price_type_credits_and_activitypoints";
       
      
      private var var_767:String;
      
      private var var_1185:String;
      
      private var var_1368:int;
      
      private var var_1787:String;
      
      private var var_1186:int;
      
      private var var_1187:int;
      
      private var var_1786:int;
      
      private var var_363:ICatalogPage;
      
      private var var_620:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_1783:int = 0;
      
      private var var_2382:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1368 = param1;
         this.var_1787 = param2;
         this.var_1186 = param3;
         this.var_1187 = param4;
         this.var_1786 = param5;
         this.var_363 = param8;
         this.var_1783 = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this.var_1783;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_363;
      }
      
      public function get offerId() : int
      {
         return this.var_1368;
      }
      
      public function get localizationId() : String
      {
         return this.var_1787;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1186;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1187;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1786;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_620;
      }
      
      public function get pricingModel() : String
      {
         return this.var_767;
      }
      
      public function get priceType() : String
      {
         return this.var_1185;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2382;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2382 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1368 = 0;
         this.var_1787 = "";
         this.var_1186 = 0;
         this.var_1187 = 0;
         this.var_1786 = 0;
         this.var_363 = null;
         if(this.var_620 != null)
         {
            this.var_620.dispose();
            this.var_620 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_767)
         {
            case const_404:
               this.var_620 = new SingleProductContainer(this,param1);
               break;
            case const_442:
               this.var_620 = new MultiProductContainer(this,param1);
               break;
            case const_530:
               this.var_620 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_767);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_767 = const_404;
            }
            else
            {
               this.var_767 = const_442;
            }
         }
         else if(param1.length > 1)
         {
            this.var_767 = const_530;
         }
         else
         {
            this.var_767 = const_1864;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1186 > 0 && this.var_1187 > 0)
         {
            this.var_1185 = const_1150;
         }
         else if(this.var_1186 > 0)
         {
            this.var_1185 = const_950;
         }
         else if(this.var_1187 > 0)
         {
            this.var_1185 = const_1284;
         }
         else
         {
            this.var_1185 = const_1869;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_363.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_620.products)
         {
            _loc4_ = this.var_363.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
