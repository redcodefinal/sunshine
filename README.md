# sunshine

SunVox C Bindings! Will, in the future, be a fully features library for using and playing with sunvox.

## Installation

Run `rsrc/install.sh` to install sunvox library.

Then run `shards build main && ./bin/main` to run a test

## Usage Example

```crystal
require "./sunvox"

SunVox.init("", 44100, 2, 0)
SunVox.open_slot(0)
SunVox.load(0, "./rsrc/test.sunvox")
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

SunVox.send_event(0, 0, 64, 129, 7, 0, 0)
sleep 1
SunVox.send_event(0, 0, 64, 129, 7, 0, 0)
sleep 1

SunVox.play_from_beginning(0)
sleep 100
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/sunshine/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Ian Rash](https://github.com/your-github-user) - creator and maintainer
