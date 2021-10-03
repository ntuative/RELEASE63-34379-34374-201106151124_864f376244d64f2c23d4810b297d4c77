package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_784;
         param1["badge"] = const_752;
         param1["bitmap"] = const_402;
         param1["border"] = const_734;
         param1["border_notify"] = const_1714;
         param1["bubble"] = const_994;
         param1["bubble_pointer_up"] = const_1152;
         param1["bubble_pointer_right"] = const_1162;
         param1["bubble_pointer_down"] = const_1223;
         param1["bubble_pointer_left"] = const_1274;
         param1["button"] = const_484;
         param1["button_thick"] = const_731;
         param1["button_icon"] = const_1717;
         param1["button_group_left"] = const_821;
         param1["button_group_center"] = const_961;
         param1["button_group_right"] = const_1016;
         param1["canvas"] = const_980;
         param1["checkbox"] = const_818;
         param1["closebutton"] = const_1281;
         param1["container"] = const_452;
         param1["container_button"] = const_771;
         param1["display_object_wrapper"] = const_767;
         param1["dropmenu"] = const_647;
         param1["dropmenu_item"] = const_561;
         param1["frame"] = const_436;
         param1["frame_notify"] = const_1931;
         param1["header"] = const_842;
         param1["html"] = const_1266;
         param1["icon"] = const_1182;
         param1["itemgrid"] = const_1196;
         param1["itemgrid_horizontal"] = const_617;
         param1["itemgrid_vertical"] = const_936;
         param1["itemlist"] = WINDOW_TYPE_ITEMLIST;
         param1["itemlist_horizontal"] = const_435;
         param1["itemlist_vertical"] = const_387;
         param1["label"] = const_848;
         param1["maximizebox"] = const_1949;
         param1["menu"] = const_1970;
         param1["menu_item"] = const_1787;
         param1["submenu"] = const_1374;
         param1["minimizebox"] = const_1884;
         param1["notify"] = const_1762;
         param1["null"] = const_797;
         param1["password"] = const_839;
         param1["radiobutton"] = const_743;
         param1["region"] = const_343;
         param1["restorebox"] = const_1867;
         param1["scaler"] = const_515;
         param1["scaler_horizontal"] = const_1748;
         param1["scaler_vertical"] = const_1813;
         param1["scrollbar_horizontal"] = const_559;
         param1["scrollbar_vertical"] = const_814;
         param1["scrollbar_slider_button_up"] = const_1351;
         param1["scrollbar_slider_button_down"] = const_1338;
         param1["scrollbar_slider_button_left"] = const_1210;
         param1["scrollbar_slider_button_right"] = const_1252;
         param1["scrollbar_slider_bar_horizontal"] = const_1151;
         param1["scrollbar_slider_bar_vertical"] = const_1233;
         param1["scrollbar_slider_track_horizontal"] = const_1302;
         param1["scrollbar_slider_track_vertical"] = const_1360;
         param1["scrollable_itemlist"] = const_1923;
         param1["scrollable_itemlist_vertical"] = const_626;
         param1["scrollable_itemlist_horizontal"] = const_1341;
         param1["selector"] = const_846;
         param1["selector_list"] = const_973;
         param1["submenu"] = const_1374;
         param1["tab_button"] = const_984;
         param1["tab_container_button"] = const_1256;
         param1["tab_context"] = const_389;
         param1["tab_content"] = const_1189;
         param1["tab_selector"] = const_999;
         param1["text"] = const_902;
         param1["input"] = const_853;
         param1["toolbar"] = const_1825;
         param1["tooltip"] = const_401;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
