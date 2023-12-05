# Sway-Talisman: Sway – Terminal Application Launcher in Scratchpad, Minimalist And Native
<p align="center">
  <img src="https://github.com/sebastiancarlos/sway-talisman/assets/88276600/7847675e-3758-43b5-bc86-e39f18fb7af1" />
</p>

Welcome to `sway-talisman`, the ultra-minimalist approach to application
launching within the Sway window manager. 

This project leverages the power of terminals and Sway's scratchpad to function
as an intuitive GUI app launcher with no dependencies.

This is __not__ a TUI launcher; It just makes your terminal even __more__ of a launcher.

## Introduction
GUI application launchers are cool, but if your are a Sway user, you might be
interested in taking your minimalism to the next level.

It turns out we've had application launchers since the 1960's: Terminals and
shells! Indeed, shells are the only programing languages in which launching a new 
process is a first-class citizen.

So, why not embrace a minimalist tiling-window-manager workflow in which your terminal
__is__ your application launcher?

If you go that route, `sway-talisman` might be for you.

Let's look at it from first principles. **Application launchers are:**
1. Floating windows
2. They open in response to a keybinding.
3. They display and autocomplete a list of application.
4. They close after opening an application.

`sway` provides features **1 through 3** if your workflow consists of having a
single terminal in your scratchpad.

`sway-talisman` is here to help you with **feature 4**, providing the missing UX
piece of closing the scratchpad after launching the app.

Another issue with GUI application launchers is that they can be overwhelming:
They usually show every single GUI application in your system, even those which
came with packages and which you never intend to open.

`sway-talisman` provides instead an **additive approach**: You are responsible for
defining every app you want to launch. And nothing stops you from
adding extra automation and configuration before and after opening your app.

## Features
- Turns your scratchpad into your ever-ready terminal and application launcher
  combo.
- Every benefit of your shell (history, tab completion) is still there
  in your minimalist app launcher.
- Automatically hides after launch, mimicking dedicated launcher behavior.
- Configure custom pre-launch, post-launch, and window placement logistics.
  Just make a wrapper script and do whatever you want.
- Easily configure in which workspace your app will launch. For example, the
  **next empty workspace to the right**.
- Detaches application processes for a clutter-free terminal session. No app logs.
- **Modular design.** Comes with several utility scripts, useful on their own.
- Easy installation method – **it's just a handful of bash scripts!**
- Embraces the aesthetic of power-user minimalism.
- Supports both **Sway and i3**.
- **No dependencies** besides Sway.

## Installation
1. Clone the repo and run:
```bash
make
make install # This will install 6 bash scripts in your path.
             # They can be removed with `make uninstall`
```

2. In your Sway config, replace your bindings to move a window to the
   scratchpad, and to toggle it.

**Note:** This is needed to add a mark to the scratchpad terminal, so it can be found by `sway-talisman`.

```bash
...
# Move the currently focused window to the scratchpad
# bindsym $mod+Shift+minus move scratchpad
bindsym $mod+Shift+minus exec sway-move-to-scratchpad
...
# Move the currently focused window to the scratchpad
# bindsym $mod+Shift+minus move scratchpad
bindsym $mod+minus exec sway-scratchpad-toggle
...
```

3. Open a new terminal and move it to your scratchpad. (If you have one already, you'll need to close it and open a new one for the changes to apply.)

4. Create aliases or scripts which call `sway-launch`, and call them from your
   regular terminals, from keybindings, or from your brand new
   terminal-scratchpad launcher! 

Example:
```bash
# in .bashrc
alias firefox='sway-launch --workspace=next-empty -- firefox'
```

Then run:
```bash
<mod>- # open scratchpad
firefox<ret> # launch firefox, scratchpad is then hidden.
```

For a full list of options and customizations, see the individual script
documentation below.

## Usage
```
Usage: sway-launch [OPTIONS] [--]  <command> [arguments...]
       sway-launch [OPTIONS] [--] '<command> [arguments...]'

- Launch a command. Meant to be called from a wrapper script or alias, which in turn
  is called from a terminal running in the Sway/i3 scratchpad.

- After running it, the scratchpad is hidden. This is meant to simulate the UX of an
  application launcher like rofi, but from a terminal running in the scratchpad.

Options:
  -w, --workspace=<value>   Launch the command in the given workspace.
                            - VALUE can be "current" (default), "next", "prev",
                              "next-empty", or a number.
  -n, --no-hide-scratchpad  Do not hide the scratchpad after launching the command.
  -q, --quiet               Do not print any output. (Useful for wrapping scripts
                            with their own outputs.)
  -d, --debug               Print debug output.
  -h, --help                Show this help message.

Example:
  # in .bashrc
  alias firefox='sway-launch --workspace=next-empty -- firefox'

 <mod>- # open scratchpad
 firefox<ret> # launch firefox, scratchpad is then hidden.
```

## Usage of utility scripts.
These other bash scripts are used by `sway-launch`, the main entry point. But
they are also yours to use elsewhere. 

#### sway-get-workspace
```
Usage: sway-get-workspace
  - Print name of current workspace
```

#### sway-get-next-empty-workspace
```
Usage: sway-get-next-empty-workspace
  - Print number of the first empty workspace to the right of the
    current one (or the current workspace if it is empty).
```

#### sway-workspace
```
Usage: sway-workspace [OPTIONS] [VALUE]

- Go to provided workspace.
- If no value is provided, print the current workspace.

VALUE can be:
- "next", "prev", "next-empty", or a number.

OPTIONS:
  -q, --quiet               Do not print any output. (Useful for wrapping scripts
                            with their own outputs.)
  -h, --help                Show this help message.
```

#### sway-is-scratchpad-focused
```
Usage: sway-is-scratchpad-focused
  - If focused, returns 0 and print "true"
  - If not, returns 1 and print "false"
```

#### sway-move-to-scratchpad
```
Usage: sway-move-to-scratchpad
  - Move the focused window to the scratchpad
  - Also add a border and a mark called "scratchpad"
```

#### sway-scratchpad-toggle
```
Usage: sway-scratchpad-toggle [-h|--help] [-q|--quiet]
 - "advanced" version of "swaymsg scratchpad show" with one advantage:
   It toggles the scratchpad even if it's not currently focused, but only visible
   in the current workspace.
 - Relies on the scratchpad having the mark "scratchpad".
```

## License
MIT

## Contributing

We welcome contributions of all kinds. If you have a suggestion or fix, please
feel free to open an issue or pull request.

Enjoy a lightweight, efficient, and terminal-centric launching experience with
`sway-talisman`!
