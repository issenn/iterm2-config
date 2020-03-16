# Standard bindings

- Move backward one words
  - <kbd>⌥</kbd>+<kbd>←</kbd> | Send Escape Sequence | `b` | `\e[1;9D`
  - <kbd>⇧</kbd>+<kbd>⌥</kbd>+<kbd>←</kbd> | Send Escape Sequence | `\e[1;10D`
- Move forward one words
  - <kbd>⌥</kbd>+<kbd>→</kbd> | Send Escape Sequence | `f` | `\e[1;9C`
  - <kbd>⇧</kbd>+<kbd>⌥</kbd>+<kbd>→</kbd> | Send Escape Sequence | `\e[1;10C`
- Beginning of the line
  - `⌘←` | send escape sequence | `[H`
- End of the line
  - `⌘→` | send escape sequence | `[F`
- Delete backward character
  - In modern systems, the backspace key is often mapped to the delete character (`0x7f` in ASCII or Unicode)
  - <kbd>Backspace</kbd> | <kbd>←Delete</kbd> | `U+232B` <kbd>⌫</kbd> ~~| Send Hex Code | `0x08`~~
  - <kbd>Control</kbd>+<kbd>H</kbd> | <kbd>⌃</kbd>+<kbd>H</kbd> | Send Hex Code | `0x08` | Send Escape Sequence | `^H`
- Delete forward character
  - <kbd>Delete</kbd> | <kbd>Delete→</kbd> | <kbd>⌦</kbd> | send hex code | `0x7F` | Send Escape Sequence | `^[[3~`
  - <kbd>Fn</kbd>+<kbd>Backspace</kbd> | <kbd>Fn</kbd>+<kbd>⌫</kbd> | Send Hex Code | `0x7F` | Send Escape Sequence | `^[[3~`
  - <kbd>Control</kbd>+<kbd>?</kbd> | <kbd>⌃</kbd>+<kbd>?</kbd> | Send Hex Code | `0x7F` | Send Escape Sequence | `^?` ~~| `^[[3~`~~
  - <kbd>Control</kbd>+<kbd>Backspace</kbd> | <kbd>⌃</kbd>+<kbd>⌫</kbd> | Send Hex Code | `0x7F` ~~| Send Escape Sequence | `^[[3~`~~
- Delete backward word
  - <kbd>Option</kbd>+<kbd>←Delete</kbd> | <kbd>⌥</kbd>+<kbd>⌫</kbd> | Send Hex Code | `0x1B 0x7F` | Send Escape Sequence | `^[^?`
  - <kbd>Control</kbd>+<kbd>W</kbd> | <kbd>⌃</kbd>+<kbd>W</kbd> | `^W`
- Delete forward word
- Delete entire line
  - <kbd>Control</kbd>+<kbd>U</kbd> | <kbd>⌃</kbd>+<kbd>U</kbd> | Send Hex Code | `0x15` | Send Escape Sequence | `^U`
  - <kbd>Command</kbd>+<kbd>←Delete</kbd> | <kbd>⌘</kbd>+<kbd>⌫</kbd> | send hex code | `0x15`
- Other Delete key
  - ~~<kbd>Control</kbd>+<kbd>Backspace</kbd> | <kbd>⌃</kbd>+<kbd>⌫</kbd> | Send Escape Sequence | `^[[3;5~`~~
  - ~~<kbd>Shift</kbd>+<kbd>Backspace</kbd> | <kbd>⇧</kbd>+<kbd>⌫</kbd> | Send Escape Sequence | `^[[3;2~`~~

Don't forget the amazing icons ⌘ = command and ⌥ = options/alt (why oh why?).


# ZLE bindings

Oh-my-zsh have made some changes to use `ZLE` which you can see talked about [issue and commit](https://github.com/robbyrussell/oh-my-zsh/issues/2696) so there are different bindings for that.

- Start of the line: `⌘←` | send escape sequence | `OH`
- End of the line `⌘→` | send escape sequence | `OF`


> [Delete character](https://en.wikipedia.org/wiki/Delete_character)
>
> [Backspace](https://en.wikipedia.org/wiki/Backspace)


## Tabs and Windows


**Function** | **Shortcut**
-------- | --------
New Tab | `⌘` + `T`
Close Tab or Window | `⌘` + `W`  (same as many mac apps)
Go to Tab | `⌘` + `Number Key`  (ie: `⌘2` is 2nd tab)
Go to Split Pane by Direction | `⌘` + `Option` + `Arrow Key`
Cycle iTerm Windows | `⌘` + `backtick`  (true of all mac apps and works with desktops/mission control)
**Splitting** | 
Split Window Vertically (same profile) | `⌘` + `D`
Split Window Horizontally (same profile) | `⌘` + `Shift` + `D`  (mnemonic: shift is a wide horizontal key)
**Moving** |
Move a pane with the mouse | `⌘` + `Alt` + `Shift` and then drag the pane from anywhere
**Fullscreen** |
Fullscreen | `⌘`+ `Enter`
Maximize a pane | `⌘` + `Shift` + `Enter`  (use with fullscreen to temp fullscreen a pane!)
Resize Pane | `Ctrl` + `⌘` + `Arrow` (given you haven't mapped this to something else)
**Less Often Used By Me** |
Go to Split Pane by Order of Use | `⌘` + `]` , `⌘` + `[`
Split Window Horizontally (new profile) | `Option` + `⌘` + `H`
Split Window Vertically (new profile) | `Option` + `⌘` + `V`
Previous Tab | `⌘`+ `Left Arrow`  (I usually move by tab number)
Next Tab | `⌘`+ `Right Arrow`
Go to Window | `⌘` + `Option` + `Number`


## My Favorite Shell Key Combos

These might be helpful to getting you faster with the shell but really this
isn't iTerm2 specific.  I'm assuming you are using bash or zsh on Mac.
There are many tips but I use these quite a bit.  There is also more than one way
to do it sometimes so adopt what you like best.

Hopefully some of these change your life.  :)

**Function** | **Shortcut** | **Use**
-------- | -------- | --------
Delete to start of line (favorite) | `Ctrl` + `U` | Use this to start over typing without hitting Ctrl-C
Delete to end of line (favorite) | `Ctrl` + `K` | Use this with command history to repeat commands and changing one thing at the end!
Repeat last command | `Ctrl` + `Up Arrow` | Cycle and browse your history with up and down.  `Ctrl-R` is faster if you know the string you are looking for.
Move back and forth on a line | `Arrow Keys` | This takes you off the home row but it's easy to remember
Move back and forth on a line by words | `Ctrl` + `Arrow Keys` | Fast way to jump to a word to correct a typo or "run again" with minor changes
Delete previous word (in shell) | `Ctrl` + `W` | It's faster to delete by words.  Especially when your last command was wrong by a single typo or something.
Clear screen | `Ctrl` + `L` | This is telling the shell to do it.  When this doesn't work `⌘` + `K` will tell iTerm to do it which works when you aren't in a shell.  Use this instead of typing `clear` over and over.



## Moving Faster

A lot of shell shortcuts work in iterm and it's good to learn these because arrow keys, home/end
keys and Mac equivalents don't always work.  For example `⌘` + `Left Arrow` is usually the same as `Home`
(go to beginning of current line) but that doesn't work in the shell.  Home works in many apps but it
takes you away from the home row.

**Function** | **Shortcut**
-------- | --------
Move to the start of line | `Ctrl` + `A` or `Home`
Move to the end of line | `Ctrl` + `E` or `End`
Move forward a word | `Option` + `F`
Move backward a word | `Option` + `B`
Set Mark | `⌘` + `M`
Jump to Mark | `⌘` + `J`
Moving by word on a line (this is a shell thing but passes through fine)| `Ctrl` + `Left/Right Arrow`
Cursor Jump with Mouse (shell and vim - might depend on config) | `Option` + `Left Click`


## Copy and Paste with iTerm without using the mouse

I don't use this feature too much.

**Function** | **Shortcut**
-------- | --------
Enter Copy Mode | `Shift` + `⌘` + `C`
Enter Character Selection Mode in Copy Mode | `Ctrl` + `V`
Move cursor in Copy Mode | `HJKL` vim motions or arrow keys
Copy text in Copy Mode | `Ctrl` + `K`

Copy actions goes into the normal system clipboard which you can paste like normal.


## Search the Command History

**Function** | **Shortcut**
-------- | --------
Search as you type | `Ctrl` + `R` and type the search term; Repeat `Ctrl` + `R` to loop through result
Search the last remembered search term | `Ctrl` + `R` twice
End the search at current history entry  | `Ctrl` + `Y`
Cancel the search and restore original line | `Ctrl` + `G`

## Misc

**Function** | **Shortcut**
-------- | --------
Clear the screen/pane (when `Ctrl + L` won't work) | `⌘` + `K`  (I use this all the time)
Broadcast command to all panes in window (nice when needed!) | `⌘` + `Alt` +  `I` (again to toggle)
Find Cursor | `⌘` + `/`  _or use a theme or cursor shape that is easy to see_

