require "./sunvox"

SunVox.init("", 44100, 2, 0)
SunVox.open_slot(0)
SunVox.load(0, "./rsrc/test3.sunvox")
puts "SONG NAME: #{String.new SunVox.get_song_name 0}"
mm = SunVox.get_number_of_modules(0)
puts "MODULES COUNT: #{mm}"
mm.times do |i|
  flags = SunVox.get_module_flags(0, i)
  next if (flags & SunVox::MODULE_FLAG_EXISTS).zero?
  xy = SunVox.get_module_xy(0, i)
  x = xy & 0xFFFF
  x -= 0x10000 if (x & 0x8000) != 0
  y = (xy >> 16) & 0xFFFF
  y -= 0x10000 if (y & 0x8000) != 0
  puts "Module##{i}: #{String.new SunVox.get_module_name(0, i)} x=#{x} y=#{y}"
end

SunVox.send_event(0, 0, 64, 129, 5, 0, 0)
sleep 1
SunVox.send_event(0, 0, 64, 129, 5, 0, 0)
sleep 1

SunVox.play_from_beginning(0)
sleep 100