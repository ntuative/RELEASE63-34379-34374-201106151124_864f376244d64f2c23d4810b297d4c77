package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_828:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1126)
         {
            _structure = null;
            _assets = null;
            var_295 = null;
            var_308 = null;
            _figure = null;
            var_598 = null;
            var_353 = null;
            if(!var_1396 && var_47)
            {
               var_47.dispose();
            }
            var_47 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_858 = null;
            var_1126 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_828[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_828[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_419:
               switch(_loc3_)
               {
                  case AvatarAction.const_894:
                  case AvatarAction.const_631:
                  case AvatarAction.const_394:
                  case AvatarAction.const_785:
                  case AvatarAction.const_395:
                  case AvatarAction.const_967:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_352:
            case AvatarAction.const_146:
            case AvatarAction.const_303:
            case AvatarAction.const_804:
            case AvatarAction.const_900:
            case AvatarAction.const_720:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
