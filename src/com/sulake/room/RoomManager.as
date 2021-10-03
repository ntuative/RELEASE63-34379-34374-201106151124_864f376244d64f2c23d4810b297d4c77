package com.sulake.room
{
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.iid.IIDRoomObjectFactory;
   import com.sulake.iid.IIDRoomObjectVisualizationFactory;
   import com.sulake.room.events.RoomContentLoadedEvent;
   import com.sulake.room.exceptions.RoomManagerException;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.IRoomObjectVisualizationFactory;
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.visualization.IRoomObjectGraphicVisualization;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   import flash.utils.getTimer;
   
   public class RoomManager extends Component implements IRoomManager, IRoomInstanceContainer
   {
      
      public static const const_780:int = -1;
      
      public static const const_1991:int = 0;
      
      public static const const_1744:int = 1;
      
      public static const const_1169:int = 2;
      
      public static const const_970:int = 3;
      
      private static const CONTENT_PROCESSING_TIME_LIMIT_MILLISECONDS:int = 40;
       
      
      private var var_111:Map;
      
      private var var_59:IRoomContentLoader;
      
      private var var_650:Array;
      
      private var var_652:Array;
      
      private var var_1068:int;
      
      private var var_173:IRoomManagerListener;
      
      private var var_3057:IRoomContentLoader;
      
      private var var_651:IRoomObjectFactory = null;
      
      private var var_547:IRoomObjectVisualizationFactory = null;
      
      private var _state:int = 0;
      
      private var var_1240:XML = null;
      
      private var var_1009:Array;
      
      private var var_1896:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      public function RoomManager(param1:IContext, param2:uint = 0)
      {
         this.var_1009 = [];
         super(param1,param2);
         this.var_111 = new Map();
         queueInterface(new IIDRoomObjectFactory(),this.objectFactoryReady);
         queueInterface(new IIDRoomObjectVisualizationFactory(),this.visualizationFactoryReady);
         this.var_650 = [];
         this.var_652 = [];
         events.addEventListener(RoomContentLoadedEvent.const_424,this.onContentLoaded);
         events.addEventListener(RoomContentLoadedEvent.const_519,this.onContentLoaded);
         events.addEventListener(RoomContentLoadedEvent.const_944,this.onContentLoaded);
      }
      
      override public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      override public function dispose() : void
      {
         var _loc3_:* = null;
         if(this.disposed)
         {
            return;
         }
         super.dispose();
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.var_111 != null)
         {
            _loc1_ = this.var_111.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.var_111.getWithIndex(_loc2_) as IRoomInstance;
               if(_loc3_ != null)
               {
                  _loc3_.dispose();
               }
               _loc2_++;
            }
            this.var_111.dispose();
            this.var_111 = null;
         }
         this.var_173 = null;
         if(this.var_651 != null)
         {
            release(new IIDRoomObjectFactory());
            this.var_651 = null;
         }
         if(this.var_547 != null)
         {
            release(new IIDRoomObjectVisualizationFactory());
            this.var_547 = null;
         }
         this.var_650 = null;
         this.var_652 = null;
         this.var_59 = null;
         this._disposed = true;
      }
      
      private function objectFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(this.disposed)
         {
            return;
         }
         this.var_651 = param2 as IRoomObjectFactory;
         this.continueInitializing();
      }
      
      private function visualizationFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(this.disposed)
         {
            return;
         }
         this.var_547 = param2 as IRoomObjectVisualizationFactory;
         this.continueInitializing();
      }
      
      private function continueInitializing() : void
      {
         var _loc1_:* = null;
         if(this.var_651 == null || this.var_547 == null)
         {
            return;
         }
         this._state = const_1744;
         if(this.var_1240 != null)
         {
            _loc1_ = this.var_1240;
            this.var_1240 = null;
            this.initialize(_loc1_,this.var_173);
         }
      }
      
      public function initialize(param1:XML, param2:IRoomManagerListener) : Boolean
      {
         var _loc5_:* = null;
         if(this._state == const_1991)
         {
            if(this.var_1240 != null)
            {
               return false;
            }
            this.var_1240 = param1;
            this.var_173 = param2;
            return true;
         }
         if(this._state >= const_1169)
         {
            return false;
         }
         if(param1 == null)
         {
            return false;
         }
         if(this.var_59 == null)
         {
            return false;
         }
         this.var_1068 = 50;
         this.var_173 = param2;
         var _loc3_:Array = this.var_59.getPlaceHolderTypes();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = _loc3_[_loc4_];
            if(this.var_650.indexOf(_loc5_) < 0)
            {
               this.var_59.loadObjectContent(_loc5_,events);
               this.var_650.push(_loc5_);
            }
            _loc4_++;
         }
         this._state = const_1169;
         return true;
      }
      
      public function setContentLoader(param1:IRoomContentLoader) : void
      {
         if(this.var_59 != null)
         {
            this.var_59.dispose();
         }
         this.var_59 = param1;
      }
      
      public function addObjectUpdateCategory(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = this.var_652.indexOf(param1);
         if(_loc2_ >= 0)
         {
            return;
         }
         this.var_652.push(param1);
         var _loc3_:int = this.var_111.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this.var_111.getWithIndex(_loc3_) as RoomInstance;
            if(_loc4_ != null)
            {
               _loc4_.addObjectUpdateCategory(param1);
            }
            _loc3_--;
         }
      }
      
      public function removeObjectUpdateCategory(param1:int) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = this.var_652.indexOf(param1);
         if(_loc2_ < 0)
         {
            return;
         }
         this.var_652.splice(_loc2_,1);
         var _loc3_:int = this.var_111.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this.var_111.getWithIndex(_loc3_) as RoomInstance;
            if(_loc4_ != null)
            {
               _loc4_.removeObjectUpdateCategory(param1);
            }
            _loc3_--;
         }
      }
      
      public function createRoom(param1:String, param2:XML) : IRoomInstance
      {
         var _loc5_:int = 0;
         if(this._state < const_970)
         {
            throw new RoomManagerException();
         }
         if(this.var_111.getValue(param1) != null)
         {
            return null;
         }
         var _loc3_:RoomInstance = new RoomInstance(param1,this);
         this.var_111.add(String(param1),_loc3_);
         var _loc4_:int = this.var_652.length - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = this.var_652[_loc4_];
            _loc3_.addObjectUpdateCategory(_loc5_);
            _loc4_--;
         }
         return _loc3_;
      }
      
      public function getRoom(param1:String) : IRoomInstance
      {
         return this.var_111.getValue(param1) as IRoomInstance;
      }
      
      public function getRoomWithIndex(param1:int) : IRoomInstance
      {
         return this.var_111.getWithIndex(param1);
      }
      
      public function getRoomCount() : int
      {
         return this.var_111.length;
      }
      
      public function disposeRoom(param1:String) : Boolean
      {
         var _loc2_:IRoomInstance = this.var_111.remove(param1) as IRoomInstance;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            return true;
         }
         return false;
      }
      
      public function createRoomObject(param1:String, param2:int, param3:String, param4:int) : IRoomObject
      {
         if(this._state < const_970)
         {
            throw new RoomManagerException();
         }
         var _loc5_:IRoomInstance = this.getRoom(param1);
         if(_loc5_ == null)
         {
            return null;
         }
         if(this.var_59 == null)
         {
            return null;
         }
         var _loc6_:RoomInstance = _loc5_ as RoomInstance;
         if(_loc6_ == null)
         {
            return null;
         }
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:String = param3;
         if(!this.var_59.hasInternalContent(param3))
         {
            _loc7_ = this.var_59.getGraphicAssetCollection(param3);
            if(_loc7_ == null)
            {
               this.var_59.loadObjectContent(param3,events);
               _loc12_ = this.var_59.getPlaceHolderType(param3);
               _loc7_ = this.var_59.getGraphicAssetCollection(_loc12_);
            }
            _loc8_ = this.var_59.getVisualizationXML(_loc12_);
            _loc9_ = this.var_59.method_4(_loc12_);
            if(_loc8_ == null || _loc7_ == null)
            {
               return null;
            }
            _loc10_ = this.var_59.getVisualizationType(_loc12_);
            _loc11_ = this.var_59.getLogicType(_loc12_);
         }
         else
         {
            _loc10_ = param3;
            _loc11_ = param3;
         }
         var _loc13_:int = 1;
         var _loc14_:IRoomObject = _loc6_.createObjectInternal(param2,_loc13_,param3,param4);
         var _loc15_:IRoomObjectController = _loc14_ as IRoomObjectController;
         if(_loc15_ == null)
         {
            return null;
         }
         var _loc16_:IRoomObjectModelController = _loc15_.getModelController();
         if(_loc16_ == null)
         {
            _loc5_.disposeObject(param2,param4);
            return null;
         }
         var _loc17_:IRoomObjectGraphicVisualization = this.var_547.createRoomObjectVisualization(_loc10_);
         if(_loc17_ == null)
         {
            _loc5_.disposeObject(param2,param4);
            return null;
         }
         _loc17_.assetCollection = _loc7_;
         var _loc18_:* = null;
         _loc18_ = this.var_547.getRoomObjectVisualizationData(_loc12_,_loc10_,_loc8_);
         if(!_loc17_.initialize(_loc18_))
         {
            _loc5_.disposeObject(param2,param4);
            return null;
         }
         _loc15_.setVisualization(_loc17_);
         var _loc19_:IRoomObjectEventHandler = this.var_651.createRoomObjectLogic(_loc11_);
         _loc15_.setEventHandler(_loc19_);
         if(_loc19_ != null && _loc9_ != null)
         {
            _loc19_.initialize(_loc9_);
         }
         return _loc15_;
      }
      
      public function createRoomObjectManager() : IRoomObjectManager
      {
         if(this.var_651 != null)
         {
            return this.var_651.createRoomObjectManager();
         }
         return null;
      }
      
      public function isContentAvailable(param1:String) : Boolean
      {
         if(this.var_59 != null)
         {
            if(this.var_59.getGraphicAssetCollection(param1) != null)
            {
               return true;
            }
         }
         return false;
      }
      
      private function processInitialContentLoad(param1:String) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(this._state == const_780)
         {
            return;
         }
         if(this.var_59 == null)
         {
            this._state = const_780;
            return;
         }
         if(this.var_59.getGraphicAssetCollection(param1) != null)
         {
            _loc2_ = this.var_650.indexOf(param1);
            if(_loc2_ >= 0)
            {
               this.var_650.splice(_loc2_,1);
            }
            if(this.var_650.length == 0)
            {
               this._state = const_970;
               if(this.var_173 != null)
               {
                  this.var_173.roomManagerInitialized();
               }
            }
         }
         else
         {
            this._state = const_780;
            this.var_173.roomManagerInitialized(false);
         }
      }
      
      private function onContentLoaded(param1:RoomContentLoadedEvent) : void
      {
         if(this.var_59 == null)
         {
            return;
         }
         var _loc2_:String = param1.contentType;
         if(_loc2_ == null)
         {
            if(this.var_173 != null)
            {
               this.var_173.contentLoaded(null,false);
            }
            return;
         }
         if(this.var_1009.indexOf(_loc2_) < 0)
         {
            this.var_1009.push(_loc2_);
         }
      }
      
      private function processLoadedContentTypes() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         if(this.var_1896)
         {
            this.var_1896 = false;
            return;
         }
         var _loc1_:int = getTimer();
         while(this.var_1009.length > 0)
         {
            _loc2_ = this.var_1009[0];
            this.var_1009.splice(0,1);
            _loc3_ = this.var_59.getVisualizationXML(_loc2_);
            if(_loc3_ == null)
            {
               if(this.var_173 != null)
               {
                  this.var_173.contentLoaded(_loc2_,false);
               }
               return;
            }
            _loc4_ = this.var_59.getGraphicAssetCollection(_loc2_);
            if(_loc4_ == null)
            {
               if(this.var_173 != null)
               {
                  this.var_173.contentLoaded(_loc2_,false);
               }
               return;
            }
            this.updateObjectContents(_loc2_);
            if(this.var_173 != null)
            {
               this.var_173.contentLoaded(_loc2_,true);
            }
            if(this.var_650.length > 0)
            {
               this.processInitialContentLoad(_loc2_);
            }
            _loc5_ = getTimer();
            if(_loc5_ - _loc1_ >= CONTENT_PROCESSING_TIME_LIMIT_MILLISECONDS)
            {
               this.var_1896 = true;
               break;
            }
         }
      }
      
      private function updateObjectContents(param1:String) : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(this.var_59 == null || this.var_547 == null)
         {
            return;
         }
         var _loc2_:XML = this.var_59.getVisualizationXML(param1);
         var _loc3_:XML = this.var_59.method_4(param1);
         var _loc4_:IGraphicAssetCollection = this.var_59.getGraphicAssetCollection(param1);
         if(_loc2_ == null || _loc4_ == null)
         {
            return;
         }
         var _loc5_:String = this.var_59.getVisualizationType(param1);
         var _loc6_:String = this.var_59.getLogicType(param1);
         var _loc7_:IRoomObjectVisualizationData = this.var_547.getRoomObjectVisualizationData(param1,_loc5_,_loc2_);
         var _loc8_:int = this.var_111.length - 1;
         while(_loc8_ >= 0)
         {
            _loc9_ = this.var_111.getWithIndex(_loc8_) as RoomInstance;
            _loc10_ = this.var_111.getKey(_loc8_);
            if(_loc9_ != null)
            {
               _loc11_ = _loc9_.getObjectManagerIds();
               for each(_loc12_ in _loc11_)
               {
                  _loc13_ = _loc9_.getObjectCountForType(param1,_loc12_);
                  _loc14_ = _loc13_ - 1;
                  while(_loc14_ >= 0)
                  {
                     _loc15_ = _loc9_.getObjectWithIndexAndType(_loc14_,param1,_loc12_) as IRoomObjectController;
                     if(_loc15_ != null)
                     {
                        _loc16_ = this.var_547.createRoomObjectVisualization(_loc5_);
                        if(_loc16_ != null)
                        {
                           _loc16_.assetCollection = _loc4_;
                           if(!_loc16_.initialize(_loc7_))
                           {
                              _loc9_.disposeObject(_loc15_.getId(),_loc12_);
                           }
                           else
                           {
                              _loc15_.setVisualization(_loc16_);
                              _loc17_ = this.var_651.createRoomObjectLogic(_loc6_);
                              _loc15_.setEventHandler(_loc17_);
                              if(_loc17_ != null)
                              {
                                 _loc17_.initialize(_loc3_);
                              }
                              if(this.var_173 != null)
                              {
                                 this.var_173.objectInitialized(_loc10_,_loc15_.getId(),_loc12_);
                              }
                           }
                        }
                        else
                        {
                           _loc9_.disposeObject(_loc15_.getId(),_loc12_);
                        }
                     }
                     _loc14_--;
                  }
               }
            }
            _loc8_--;
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         this.processLoadedContentTypes();
         var _loc2_:int = this.var_111.length - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = this.var_111.getWithIndex(_loc2_) as RoomInstance;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_--;
         }
      }
   }
}
