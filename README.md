# iterm2-config


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

### Key mappings

- **Delete all characters left of the cursor**
  
  - <kbd>Command</kbd>+<kbd>←Delete</kbd> | <kbd>⌘</kbd>+<kbd>⌫</kbd> | Send Hex Code | `0x18 0x7f`
  
  - > `0x15` More compatible, but functionality sometimes is to delete the entire line rather than just the characters to the left of the curser. I personally use this and then overwrite my zsh bindkey for `^U` to delete only stuff to the left of the cursor (see below).
    >
    > **or**
    >
    > `0x18 0x7f` Less compatible, doesn't work in node and won't work in zsh by default, **see below to fix zsh** (bash/irb/pry should be fine), performs desired functionality when it does work.

- **Delete all characters right of the cursor**
  
  - <kbd>Command</kbd>+<kbd>Del→</kbd> | <kbd>Command</kbd>+<kbd>fn</kbd>+<kbd>←Delete</kbd> | <kbd>⌘</kbd>+<kbd>⌦</kbd> | Send Hex Code | `0x0b`

- **Delete one word to left of cursor**
  
  - <kbd>Option</kbd>+<kbd>←Delete</kbd> | <kbd>⌥</kbd>+<kbd>⌫</kbd> | Send Hex Code | `0x1b 0x7f`
  
  - > `0x1b 0x08` Breaks in Elixir's IEX, seems to work fine everywhere else
    >
    > **or**
    >
    > `0x17` Works everywhere, but doesn't stop at normal word breaks in IRB and will instead delete until it sees a literal space.
  
- **Delete one word to right of cursor**
  
  - <kbd>Option</kbd>+<kbd>Del→</kbd> | <kbd>Option</kbd>+<kbd>fn</kbd>+<kbd>←Delete</kbd> | <kbd>⌥</kbd>+<kbd>⌦</kbd> | Send Hex Code | `0x1b 0x64`

- **Move cursor to the front of line**

  - <kbd>Command</kbd>+<kbd>Left</kbd> | <kbd>⌘</kbd>+<kbd>←</kbd> | Send Hex Code | `0x01`
  
- **Move cursor to the end of line**

  - <kbd>Command</kbd>+<kbd>Right</kbd> | <kbd>⌘</kbd>+<kbd>→</kbd> | Send Hex Code | `0x05`

- **Move cursor one word left**

  - <kbd>Option</kbd>+<kbd>Left</kbd> | <kbd>⌥</kbd>+<kbd>←</kbd> | Send Hex Code | `0x1b 0x62`

- **Move cursor one word right**

  - <kbd>Option</kbd>+<kbd>Right</kbd> | <kbd>⌥</kbd>+<kbd>→</kbd> | Send Hex Code | `0x1b 0x66`

- **Undo**

  - <kbd>Command</kbd>+<kbd>z</kbd> | <kbd>⌘</kbd>+<kbd>z</kbd> | Send Hex Code | `0x1f`

- **Redo** typically not bound in bash, zsh or readline, so we can set it to a unused hexcode which we can then fix in zsh

  - <kbd>Shift</kbd>+<kbd>Command</kbd>+<kbd>z</kbd> | <kbd>Command</kbd>+<kbd>y</kbd> | <kbd>⇧</kbd>+<kbd>⌘</kbd>+<kbd>z</kbd> | <kbd>⌘</kbd>+<kbd>y</kbd> | Send Hex Code | `0x18 0x1f`

Now how to fix any that don't work

For zsh, you can setup binding for the not yet functional <kbd>⌘</kbd>+<kbd>←Delete</kbd> and <kbd>⇧</kbd>+<kbd>⌘</kbd>+<kbd>Z</kbd>/<kbd>⌘</kbd>+<kbd>y</kbd> by running:

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

