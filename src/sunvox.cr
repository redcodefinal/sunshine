#@[Include("/home/ian/Documents/crystal/sunshine/src/sunvox.h", prefix: %w(SV_ sv_))]
@[Link(ldflags: "/usr/lib/sunvox.so")]

lib SunVox
  MODULE_FLAG_EXISTS = 1
  MODULE_FLAG_EFFECT = 2
  MODULE_INPUTS_OFF = 16
  STYPE_INT16 = 0
  STYPE_INT32 = 1
  STYPE_FLOAT32 = 2
  STYPE_FLOAT64 = 3

  struct SunvoxNote
    note : UInt8
    vel : UInt8
    module : UInt8
    zero : UInt8
    ctl : UInt16
    ctl_val : UInt16
  end

  # fun load_dll2 = sv_load_dll2(filename : LibC::Char*) : LibC::Int
  # fun load_dll = sv_load_dll : LibC::Int
  # fun unload_dll = sv_unload_dll : LibC::Int
  fun audio_callback = sv_audio_callback(Void*, LibC::Int, LibC::Int, LibC::UInt) : LibC::Int
  fun audio_callback2 = sv_audio_callback2(Void*, LibC::Int, LibC::Int, LibC::UInt, LibC::Int, LibC::Int, Void*) : LibC::Int
  fun open_slot = sv_open_slot(LibC::Int) : LibC::Int
  fun close_slot = sv_close_slot(LibC::Int) : LibC::Int
  fun lock_slot = sv_lock_slot(LibC::Int) : LibC::Int
  fun unlock_slot = sv_unlock_slot(LibC::Int) : LibC::Int
  fun init = sv_init(LibC::Char*, LibC::Int, LibC::Int, LibC::UInt) : LibC::Int
  fun deinit = sv_deinit : LibC::Int
  fun update_input = sv_update_input : LibC::Int
  fun get_sample_type = sv_get_sample_type : LibC::Int
  fun load = sv_load(LibC::Int, LibC::Char*) : LibC::Int
  fun load_from_memory = sv_load_from_memory(LibC::Int, Void*, LibC::UInt) : LibC::Int
  fun play = sv_play(LibC::Int) : LibC::Int
  fun play_from_beginning = sv_play_from_beginning(LibC::Int) : LibC::Int
  fun stop = sv_stop(LibC::Int) : LibC::Int
  fun set_autostop = sv_set_autostop(LibC::Int, LibC::Int) : LibC::Int
  fun end_of_song = sv_end_of_song(LibC::Int) : LibC::Int
  fun rewind = sv_rewind(LibC::Int, LibC::Int) : LibC::Int
  fun volume = sv_volume(LibC::Int, LibC::Int) : LibC::Int
  fun send_event = sv_send_event(LibC::Int, LibC::Int, LibC::Int, LibC::Int, LibC::Int, LibC::Int, LibC::Int) : LibC::Int
  fun get_current_line = sv_get_current_line(LibC::Int) : LibC::Int
  fun get_current_line2 = sv_get_current_line2(LibC::Int) : LibC::Int
  fun get_current_signal_level = sv_get_current_signal_level(LibC::Int, LibC::Int) : LibC::Int
  fun get_song_name = sv_get_song_name(LibC::Int) : LibC::Char*
  fun get_song_bpm = sv_get_song_bpm(LibC::Int) : LibC::Int
  fun get_song_tpl = sv_get_song_tpl(LibC::Int) : LibC::Int
  fun get_song_length_frames = sv_get_song_length_frames(LibC::Int) : LibC::UInt
  fun get_song_length_lines = sv_get_song_length_lines(LibC::Int) : LibC::UInt
  fun new_module = sv_new_module(LibC::Int, LibC::Char*, LibC::Char*, LibC::Int, LibC::Int, LibC::Int) : LibC::Int
  fun remove_module = sv_remove_module(LibC::Int, LibC::Int) : LibC::Int
  fun connect_module = sv_connect_module(LibC::Int, LibC::Int, LibC::Int) : LibC::Int
  fun disconnect_module = sv_disconnect_module(LibC::Int, LibC::Int, LibC::Int) : LibC::Int
  fun load_module = sv_load_module(LibC::Int, LibC::Char*, LibC::Int, LibC::Int, LibC::Int) : LibC::Int
  fun load_module_from_memory = sv_load_module_from_memory(LibC::Int, LibC::Int, Void*, LibC::UInt, LibC::Int) : LibC::Int
  fun sampler_load = sv_sampler_load(LibC::Int, LibC::Int, LibC::Char*, LibC::Int) : LibC::Int
  fun sampler_load_from_memory = sv_sampler_load_from_memory(LibC::Int, LibC::Int, Void*, LibC::UInt, LibC::Int) : LibC::Int
  fun get_number_of_modules = sv_get_number_of_modules(LibC::Int) : LibC::Int
  fun get_module_flags = sv_get_module_flags(LibC::Int, LibC::Int) : LibC::UInt
  fun get_module_inputs = sv_get_module_inputs(LibC::Int, LibC::Int) : LibC::Int
  fun get_module_outputs = sv_get_module_outputs(LibC::Int, LibC::Int) : LibC::Int
  fun get_module_name = sv_get_module_name(LibC::Int, LibC::Int) : LibC::Char*
  fun get_module_xy = sv_get_module_xy(LibC::Int, LibC::Int) : LibC::UInt
  fun get_module_color = sv_get_module_color(LibC::Int, LibC::Int) : LibC::Int
  fun get_module_scope = sv_get_module_scope(LibC::Int, LibC::Int, LibC::Int, LibC::Int*, LibC::Int*) : Void*
  fun get_module_scope2 = sv_get_module_scope2(LibC::Int, LibC::Int, LibC::Int, LibC::Short*, LibC::UInt) : LibC::UInt
  fun get_number_of_module_ctls = sv_get_number_of_module_ctls(LibC::Int, LibC::Int) : LibC::Int
  fun get_module_ctl_name = sv_get_module_ctl_name(LibC::Int, LibC::Int, LibC::Int) : LibC::Char*
  fun get_module_ctl_value = sv_get_module_ctl_value(LibC::Int, LibC::Int, LibC::Int, LibC::Int) : LibC::Int
  fun get_number_of_patterns = sv_get_number_of_patterns(LibC::Int) : LibC::Int
  fun get_pattern_x = sv_get_pattern_x(LibC::Int, LibC::Int) : LibC::Int
  fun get_pattern_y = sv_get_pattern_y(LibC::Int, LibC::Int) : LibC::Int
  fun get_pattern_tracks = sv_get_pattern_tracks(LibC::Int, LibC::Int) : LibC::Int
  fun get_pattern_lines = sv_get_pattern_lines(LibC::Int, LibC::Int) : LibC::Int
  fun get_pattern_data = sv_get_pattern_data(LibC::Int, LibC::Int) : SunvoxNote*
  fun pattern_mute = sv_pattern_mute(LibC::Int, LibC::Int, LibC::Int) : LibC::Int
  fun get_ticks = sv_get_ticks : LibC::UInt
  fun get_ticks_per_second = sv_get_ticks_per_second : LibC::UInt
  fun get_log = sv_get_log(LibC::Int) : LibC::Char*
end
