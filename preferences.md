# Preferences

## General

### Add Bonjour hosts to Profiles

`General` -> `Services` -> `Add Bonjour hosts to Profiles`

```xml
    <key>EnableRendezvous</key>
    <false/>
```

### Update to Beta test releases

`General` -> `Services` -> `Update to Beta test releases`

```sh
defaults write com.googlecode.iterm2 CheckTestRelease -bool false
```

Or

```xml
    <key>CheckTestRelease</key>
    <false/>
```

### Check for updates automatically

`General` -> `Services` -> `Check for updates automatically`

```sh
defaults write com.googlecode.iterm2 SUEnableAutomaticChecks -bool false
```

Or

```xml
    <key>SUEnableAutomaticChecks</key>
    <false/>
```

---

```sh
defaults write com.googlecode.iterm2 SUFeedURL -string "https://iterm2.com/appcasts/final_modern.xml"
```

Or

```xml
    <key>SUFeedURL</key>
    <string>https://iterm2.com/appcasts/final_modern.xml?shard=1</string>
```

```sh
defaults write com.googlecode.iterm2 SUHasLaunchedBefore -bool false
```

Or

```xml
    <key>SUHasLaunchedBefore</key>
    <true/>
```

```sh
defaults write com.googlecode.iterm2 SUSendProfileInfo -bool false
```

Or

```xml
    <key>SUSendProfileInfo</key>
    <false/>
```

### Applications in terminal may access clipboard

`General` -> `Selection` -> `Applications in terminal may access clipboard`

```xml
    <key>AllowClipboardAccess</key>
    <true/>
```

```xml
    <key>Default Bookmark Guid</key>
    <string>2B779628-E996-47FB-AF78-7A07A5960003</string>
```

### Load preferences from a custom folder or URL

`General` -> `Preferences` -> `Load preferences from a custom folder or URL`

```sh
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.config/iterm2/Preferences"
# defaults write com.googlecode.iterm2 PrefsCustomFolder -string "http://issenn.ml/iterm2-config/Library/Preferences/com.googlecode.iterm2.plist"
```

```xml
    <key>LoadPrefsFromCustomFolder</key>
    <true/>
    <key>PrefsCustomFolder</key>
    <string>~/.config/iterm2/Preferences</string>
```

## Appearance

### Show tab bar in fullscreen

`Appearance` -> `Tabs` -> `Show tab bar in fullscreen`

```xml
    <key>ShowFullScreenTabBar</key>
    <false/>
```

## Keys

### Haptic feedback when pressing Esc

`Keys` -> `Key Bindings` -> `Touch Bar Mitigations` -> `Haptic feedback when pressing Esc`

```xml
    <key>HapticFeedbackForEsc</key>
    <false/>
```

### Key click for esc key

`Keys` -> `Key Bindings` -> `Touch Bar Mitigations` -> `Key click for esc key`

```xml
    <key>SoundForEsc</key>
    <false/>
```

### Visual esc key indicator

`Keys` -> `Key Bindings` -> `Touch Bar Mitigations` -> `Visual esc key indicator`

```xml
    <key>VisualIndicatorForEsc</key>
    <false/>
```

### Show/hide all windows with a system-wide hotkey

`Keys` -> `Hotkey` -> `Show/hide all windows with a system-wide hotkey`

```xml
    <key>Hotkey</key>
    <true/>
    <key>HotkeyChar</key>
    <integer>46</integer>
    <key>HotkeyCode</key>
    <integer>47</integer>
    <key>HotkeyModifiers</key>
    <integer>1048840</integer>
```

## Advanced

### Path to folder with dynamic profiles

`Preferences` -> `Advanced` -> `Path to folder with dynamic profiles`

```sh
defaults write com.googlecode.iterm2 DynamicProfilesPath -string "~/.config/iterm2/DynamicProfiles"
```

Or

```xml
    <key>DynamicProfilesPath</key>
    <string>~/.config/iterm2/DynamicProfiles</string>
```

### Tip of the Day

`Preferences` -> `Advanced` -> `Tip of the Day`

```xml
    <key>NoSyncTipsDisabled</key>
    <true/>
    <key>NoSyncTipOfTheDayEligibilityBeganTime</key>
    <real>86400000</real>
```

### Enable multi-server daemon.

> [`launchctl setenv` no longer sets env variable in 3.2.8](https://gitlab.com/gnachman/iterm2/-/issues/7654)  

`Preferences` -> `Advanced` -> `Enable multi-server daemon.`

```xml
    <key>Multiserver</key>
    <true/>
```

### Allow sessions to survive logging out and back in.

`Preferences` -> `Advanced` -> `Allow sessions to survive logging out and back in.`

```xml
    <key>BootstrapDaemon</key>
    <true/>
```

---

```sh
defaults write com.googlecode.iterm2 NoSyncDynamicProfileChangeWillBeLost_SilenceUntil -float 31536000000000
defaults write com.googlecode.iterm2 NoSyncDynamicProfileChangeWillBeLost_selection -int 0
```

Or

```xml
    <key>NoSyncDynamicProfileChangeWillBeLost_SilenceUntil</key>
    <real>31536000000000</real>
    <key>NoSyncDynamicProfileChangeWillBeLost_selection</key>
    <integer>0</integer>
```
