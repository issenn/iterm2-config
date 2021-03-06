# iterm2-config

```sh
brew reinstall iterm2 && brew uninstall --zap iterm2 && brew install iterm2

stow .keep
stow iterm2-config
```

> [Dynamic Profiles](https://www.iterm2.com/documentation-dynamic-profiles.html)
>
> [American Standard Code for Information Interchange, ASCII](https://www.csee.umbc.edu/portal/help/theory/ascii.txt)
>
> [iTerm 2: How to set keyboard shortcuts to jump to beginning/end of line?](https://stackoverflow.com/questions/6205157/iterm-2-how-to-set-keyboard-shortcuts-to-jump-to-beginning-end-of-line/)
>
> [Fix iterm2 MacOS keys](https://github.com/GabLeRoux/iterm2-macos-dynamic-profile)

## GUID

Default Bookmark Guid

```sh
defaults read com.googlecode.iterm2 "Default Bookmark Guid"
```

One easy way to generate a Guid is to use the uuidgen program, which comes standard with macOS.

```sh
uuidgen
```

## Usage

### Preferences

```sh
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.config/iterm2/Preferences"
# defaults write com.googlecode.iterm2 PrefsCustomFolder -string "http://issenn.ml/iterm2-config/Library/Preferences/com.googlecode.iterm2.plist"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile_selection -int 1
defaults write com.googlecode.iterm2 SUEnableAutomaticChecks -bool false
defaults write com.googlecode.iterm2 SUSendProfileInfo -bool false
defaults write com.googlecode.iterm2 DynamicProfilesPath -string "~/.config/iterm2/DynamicProfiles"
defaults write com.googlecode.iterm2 NoSyncDynamicProfileChangeWillBeLost_SilenceUntil -float 31536000000000
defaults write com.googlecode.iterm2 NoSyncDynamicProfileChangeWillBeLost_selection -int 0
```

```sh
defaults read com.googlecode.iterm2 PrefsCustomFolder
defaults read com.googlecode.iterm2 LoadPrefsFromCustomFolder

defaults write com.googlecode.iterm2 PrefsCustomFolder -string ""
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool false
```

### ASCII

#### How to show key code

```sh
echo 'Control V Fn Backspace' | od -c
echo 'Control V Fn Backspace' | xxd
xxd -psd
```

|    Key    | Unicode |                  Type                  | Hex Code | Escape Sequence | Prefix |
| :-------: | :-----: | :------------------------------------: | :------: | :-------------: | :-------: |
| Backspace |    ⌫    | <kbd>Backspace</kbd> \| <kbd>←Delete</kbd> |  `0x08`  |      `^H`      |  |
|    Del    |    ⌦    | <kbd>Delete</kbd> \| <kbd>Delete→</kbd> |  `0x7f`  |      `^?` \| `^[[3~`      |  |
|   Shift   |    ⇧    | <kbd>Shift</kbd> | | | `^[[1;2` |
|    Fn     |         |             <kbd>fn</kbd>              |          |                 |  |
|  Control  |    ⌃    |           <kbd>Control</kbd>           |          | `^` | `^[[1;5` |
|  Option   |    ⌥    |           <kbd>Option</kbd>            |    |            | `^[[1;9` |
|   Meta    |         |                                        |          |         | `^[[1;3` |
|  Command  |    ⌘    |           <kbd>Command</kbd>           |          |                 |  |
|   Left    | ← | <kbd>←</kbd> | `0x62` | `b` | `D` |
| Right | → | <kbd>→</kbd> | `0x66` | `f` | `C` |
| Up | ↑ | <kbd>↑</kbd> | | | `A` |
| Down | ↓ | <kbd>↓</kbd> | | | `B` |
| Escape | ⎋ | <kbd>esc</kbd> | `0x1b` | `^[` |  |

|       Key       | Unicode |                Type                 |  Prefix   |
| :-------------: | :-----: | :---------------------------------: | :-------: |
| Shift + Option  |   ⇧⌥    | <kbd>Shift</kbd>-<kbd>Option</kbd>  | `^[[1;10` |
| Shift + Control |   ⇧⌃    | <kbd>Shift</kbd>-<kbd>Control</kbd> | `^[[1;6`  |

### Key mappings

- **Delete all characters left of the cursor**
  
  - <kbd>Command</kbd>-<kbd>←Delete</kbd> | <kbd>Control</kbd>-<kbd>x</kbd>+<kbd>←Delete</kbd> | <kbd>⌘</kbd>-<kbd>⌫</kbd> | <kbd>⌃</kbd>-<kbd>x</kbd>+<kbd>⌫</kbd> | Send Hex Code | `0x18 0x7f`
  
  - > `0x15` More compatible, but functionality sometimes is to delete the entire line rather than just the characters to the left of the curser. I personally use this and then overwrite my zsh bindkey for `^U` to delete only stuff to the left of the cursor (see below).
    >
    > **or**
    >
    > `0x18 0x7f` Less compatible, doesn't work in node and won't work in zsh by default, **see below to fix zsh** (bash/irb/pry should be fine), performs desired functionality when it does work.

- **Delete all characters right of the cursor**
  
  - <kbd>Command</kbd>-<kbd>Del→</kbd> | <kbd>Command</kbd>-<kbd>fn</kbd>-<kbd>←Delete</kbd> | <kbd>Control</kbd>-<kbd>k</kbd> | <kbd>⌘</kbd>-<kbd>⌦</kbd> | <kbd>⌃</kbd>-<kbd>k</kbd> | Send Hex Code | `0x0b`

- **Delete one word to left of cursor**
  
  - <kbd>Option</kbd>-<kbd>←Delete</kbd> | <kbd>⌥</kbd>-<kbd>⌫</kbd> | Send Hex Code | `0x1b 0x7f` | Send Escape Sequence | `^[^?`
  
  - > `0x1b 0x08` Breaks in Elixir's IEX, seems to work fine everywhere else
    >
    > **or**
    >
    > `0x17` Works everywhere, but doesn't stop at normal word breaks in IRB and will instead delete until it sees a literal space.
  
- **Delete one word to right of cursor**
  
  - <kbd>Option</kbd>-<kbd>Del→</kbd> | <kbd>Option</kbd>-<kbd>fn</kbd>-<kbd>←Delete</kbd> | <kbd>Option</kbd>-<kbd>d</kbd> | <kbd>⌥</kbd>-<kbd>⌦</kbd> | <kbd>⌥</kbd>-<kbd>d</kbd> | Send Hex Code | `0x1b 0x64`

- **Move cursor to the front of line**

  - <kbd>Command</kbd>-<kbd>Left</kbd> | <kbd>Control</kbd>-<kbd>a</kbd> | <kbd>⌘</kbd>-<kbd>←</kbd> | <kbd>⌃</kbd>-<kbd>a</kbd> | Send Hex Code | `0x01`
  
- **Move cursor to the end of line**

  - <kbd>Command</kbd>-<kbd>Right</kbd> | <kbd>Control</kbd>-<kbd>e</kbd> | <kbd>⌘</kbd>-<kbd>→</kbd> | <kbd>⌃</kbd>-<kbd>e</kbd> | Send Hex Code | `0x05`

- **Move cursor one word left**

  - <kbd>Option</kbd>-<kbd>Left</kbd> | <kbd>Option</kbd>-<kbd>b</kbd> | <kbd>⌥</kbd>-<kbd>←</kbd> | <kbd>⌥</kbd>-<kbd>b</kbd> | Send Hex Code | `0x1b 0x62`

- **Move cursor one word right**

  - <kbd>Option</kbd>-<kbd>Right</kbd> | <kbd>Option</kbd>-<kbd>f</kbd> | <kbd>⌥</kbd>-<kbd>→</kbd> | <kbd>⌥</kbd>-<kbd>f</kbd> | Send Hex Code | `0x1b 0x66`

- **Undo**

  - <kbd>Command</kbd>-<kbd>z</kbd> | <kbd>Control</kbd>-<kbd>-</kbd> | <kbd>⌘</kbd>-<kbd>z</kbd> | <kbd>⌃</kbd>-<kbd>-</kbd> | Send Hex Code | `0x1f`

- **Redo** typically not bound in bash, zsh or readline, so we can set it to a unused hexcode which we can then fix in zsh

  - <kbd>Shift</kbd>-<kbd>Command</kbd>-<kbd>z</kbd> | <kbd>Command</kbd>-<kbd>y</kbd> | <kbd>Control</kbd>-<kbd>x</kbd>+<kbd>Control</kbd>-<kbd>-</kbd> | <kbd>⇧</kbd>-<kbd>⌘</kbd>-<kbd>z</kbd> | <kbd>⌘</kbd>-<kbd>y</kbd> | <kbd>⌃</kbd>-<kbd>x</kbd>+<kbd>⌃</kbd>-<kbd>-</kbd> | Send Hex Code | `0x18 0x1f`

Now how to fix any that don't work

For zsh, you can setup binding for the not yet functional <kbd>⌘</kbd>-<kbd>←Delete</kbd> and <kbd>⇧</kbd>-<kbd>⌘</kbd>-<kbd>Z</kbd>/<kbd>⌘</kbd>-<kbd>y</kbd> by running:

```sh
# changes hex 0x15 to delete everything to the left of the cursor,
# rather than the whole line
$ echo 'bindkey "^U" backward-kill-line' >> ~/.zshrc

# binds hex 0x18 0x7f with deleting everything to the left of the cursor
$ echo 'bindkey "^X\\x7f" backward-kill-line' >> ~/.zshrc

# adds redo
$ echo 'bindkey "^X^_" redo' >> ~/.zshrc

# reload your .zshrc for changes to take effect
$ source ~/.zshrc
```

> [iTerm 2: How to set keyboard shortcuts to jump to beginning/end of line? Answer](https://stackoverflow.com/a/29403520/1092815)

## issues

- [Dynamic profiles](https://gitlab.com/gnachman/iterm2/issues/4115)
