# Keyboard remapping for keyboard backlight
This repo is for remapping Mac keyboard:
	- spotlight(F4) --> backlight down
	- dictation(F5) --> backlight up

I personally don’t use these two keys but needed to adjust the keyboard backlight. If you want to change them to a different key, use the HID key mapping table below.

While searching the web, I found that this should work on all Apple Silicon Macs. However, I have only tested it on an  M3 Pro MacBook Pro, first with macOS 14 and later after upgrading to macOS 15. Both versions work perfectly.

⚠️ Backup the original file before change it.

## How to run
you can use the script to load/unload this remapping or manually.

### Using the scripts
#### Load
- download/clone/copy `load_mapping.sh`
- run `./WHERE_THIS_SCRIPT_IS_LOCATED/load_mapping.sh`

#### Unload
- download/clone/copy `unload_mapping.sh`
- run `./WHERE_THIS_SCRIPT_IS_LOCATED/unload_mapping.sh`
---

### Manual load/unload

#### HID key mapping table
```
0xC000000CF    = do not disturb
0x10000009B    = dictation
0x0C00000221   = spotlight
0xFF0100000010 = mission control
0x0C000002A2   = launchpad
```

#### Load
 - open `~/Library/LaunchAgents/com.local.KeyRemapping.plist`, create if not exists.
- copy and paste below xml into the `.plist` file.
- run `launchctl load ~/Library/LaunchAgents/com.local.KeyRemapping.plist` to load this remapping.
- restart is recommended.

> use HID key mapping table if you want to customize it.
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.local.KeyRemapping</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/hidutil</string>
        <string>property</string>
        <string>--set</string>
        <string>{"UserKeyMapping":[
            {
              "HIDKeyboardModifierMappingSrc": 0x0C00000221,
              "HIDKeyboardModifierMappingDst": 0xFF00000009
            },
            {
              "HIDKeyboardModifierMappingSrc": 0xC000000CF,
              "HIDKeyboardModifierMappingDst": 0xFF00000008
            }
        ]}</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```
> ref: https://gist.github.com/mysteriouss/7d859f4ebb20604d212e7e9f807f64ff

#### Unload
- run `launchctl unload ~/Library/LaunchAgents/com.local.KeyRemapping.plist`
- remove file `com.local.KeyRemapping.plist` file.
- restart is recommended.
