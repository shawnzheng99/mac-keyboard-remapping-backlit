# keyboard remapping for keyboard backlit, f4 down, f5 up
# empty the array to restore defult

# this file is located at ~/Library/LaunchAgents/com.local.KeyRemapping.plist
# to take effect: launchctl load ~/Library/LaunchAgents/com.local.KeyRemapping.plist

```
hid key mapping table:
0xC000000CF = do not disturb
0x10000009B = dictation
0x0C00000221 = spotlight
0xFF0100000010 = mission control
0x0C000002A2 = launchpad
```
# ref: https://gist.github.com/mysteriouss/7d859f4ebb20604d212e7e9f807f64ff

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