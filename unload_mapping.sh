#!/bin/sh

# restore to default of keyboard mapping.

launchctl unload ~/Library/LaunchAgents/com.local.KeyRemapping.plist
rm -f ~/Library/LaunchAgents/com.local.KeyRemapping.plist
