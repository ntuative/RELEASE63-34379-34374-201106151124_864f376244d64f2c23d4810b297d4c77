package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_191;
         param1["bound_to_parent_rect"] = const_104;
         param1["child_window"] = const_1379;
         param1["embedded_controller"] = const_1384;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_802;
         param1["mouse_dragging_target"] = const_293;
         param1["mouse_dragging_trigger"] = const_447;
         param1["mouse_scaling_target"] = const_372;
         param1["mouse_scaling_trigger"] = const_549;
         param1["horizontal_mouse_scaling_trigger"] = const_270;
         param1["vertical_mouse_scaling_trigger"] = const_286;
         param1["observe_parent_input_events"] = const_1178;
         param1["optimize_region_to_layout_size"] = const_507;
         param1["parent_window"] = const_1149;
         param1["relative_horizontal_scale_center"] = const_224;
         param1["relative_horizontal_scale_fixed"] = const_151;
         param1["relative_horizontal_scale_move"] = const_386;
         param1["relative_horizontal_scale_strech"] = const_448;
         param1["relative_scale_center"] = const_1364;
         param1["relative_scale_fixed"] = const_794;
         param1["relative_scale_move"] = const_1202;
         param1["relative_scale_strech"] = const_1248;
         param1["relative_vertical_scale_center"] = const_213;
         param1["relative_vertical_scale_fixed"] = const_168;
         param1["relative_vertical_scale_move"] = const_289;
         param1["relative_vertical_scale_strech"] = const_358;
         param1["on_resize_align_left"] = const_1009;
         param1["on_resize_align_right"] = const_573;
         param1["on_resize_align_center"] = const_493;
         param1["on_resize_align_top"] = const_755;
         param1["on_resize_align_bottom"] = const_600;
         param1["on_resize_align_middle"] = const_550;
         param1["on_accommodate_align_left"] = const_1206;
         param1["on_accommodate_align_right"] = const_560;
         param1["on_accommodate_align_center"] = const_1012;
         param1["on_accommodate_align_top"] = const_1316;
         param1["on_accommodate_align_bottom"] = const_579;
         param1["on_accommodate_align_middle"] = const_798;
         param1["route_input_events_to_parent"] = const_521;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1227;
         param1["scalable_with_mouse"] = const_1250;
         param1["reflect_horizontal_resize_to_parent"] = const_633;
         param1["reflect_vertical_resize_to_parent"] = const_616;
         param1["reflect_resize_to_parent"] = const_321;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1239;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
