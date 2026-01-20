# Kanata “Coder Layers” (US layout)

This is my Kanata keyboard layout for fast coding on a laptop keyboard without a numpad.

The idea:
- **Hold Space** = numbers + common coding stuff on/near home row
- **Hold Space + hold Caps (Ctrl for me)** = symbols
- **Hold Space + hold E** = navigation (arrow keys) with vim-like `hjkl`
- **Double-tap Shift** = Caps Word (great for CONSTANT_NAMES)

The file `kanata.kbd` can be found in this repo at:

- `.config/kanata/kanata.kbd`

Please read the Kanata repo docs — it explains where to place `kanata.kbd` on your system:

- https://github.com/jtroo/kanata

There is also a `read.txt` file in:

- `.config/kanata/`

You can read it to see how I made Kanata run in the background as a system service (not guaranteed to work). The recommended way is to use a system tray icon — check the Kanata repo for more info.



> Layout: **US** (`localectl status` → X11 Layout: us)

---
## Features

### 1) Caps Word on double Shift
- Double-tap **Left Shift** or **Right Shift** → toggle Caps Word
- Useful for typing identifiers like `MY_CONSTANT_NAME_123` without holding Shift.

### 2) NUM layer (hold Space)
When you **hold Space**, you get:
- Home row numbers: `a..;` → `1..0`
- Quick modifiers:
  - `Space+Q` = one-shot **Super**
  - `Space+W` = one-shot **Alt**
- Function keys on the right side of the top row (`r..p`): `F1..F5`, `F11`, `F12`
- `[ (next to P)` becomes **Delete**
- `Space+Tab` becomes **Esc**
- `Space+E (hold)` enters a navigation layer (arrows on `hjkl`)

### 3) SYM layer (hold Space + hold Caps)
While holding Space, if you also **hold Caps/Ctrl**, you enter a symbols layer:
- Home row becomes `! @ # $ % ^ & * ( )`
- Above home row:
  - `q` = `` ` ``
  - `w` = `~`
  - plus quick access to `{ } [ ] < > \ |`

### 4) NAV layer (hold Space + hold E)
While holding Space, hold `E` to enter navigation:
- `h j k l` → ← ↓ ↑ →

---

## Cheatsheet

### BASE (normal)
- Normal typing
- **Double-tap LShift / RShift** → Caps Word toggle
- **Hold Space** → NUM

### NUM (hold Space)
**Modifiers / controls**
- `Space+Tab` → **Esc**
- `Space+Q` → one-shot **Super**
- `Space+W` → one-shot **Alt**
- `Space+E (hold)` → **NAV**
- `Space+Caps (hold)` → **SYM** (momentary)

**Numbers**
- `Space + A S D F G H J K L ;` → `1 2 3 4 5 6 7 8 9 0`

**F-keys + delete**
- `Space + R T Y U I` → `F1 F2 F3 F4 F5`
- `Space + O` → `F11`
- `Space + P` → `F12`
- `Space + [` → `Delete`

**Common coding symbols (extra row)**
- `Space + Z` → `-`
- `Space + X` → `_`
- `Space + C` → `=`
- `Space + V` → `+`
- `Space + B` → `*`
- `Space + N` → `[`
- `Space + M` → `]`
- `Space + ,` → `<`
- `Space + .` → `>`
- `Space + /` → `/`

### SYM (hold Space + hold Caps/Ctrl)
**Above home row**
- `Q` → `` ` ``
- `W` → `~`
- `E` → `{`
- `R` → `}`
- `T` → `[`
- `Y` → `]`
- `U` → `<`
- `I` → `>`
- `O` → `\`
- `P` → `|`

**Home row**
- `A S D F G H J K L ;` → `! @ # $ % ^ & * ( )`

### NAV (hold Space + hold E)
- `H` → Left
- `J` → Down
- `K` → Up
- `L` → Right

---

## Notes / troubleshooting

### Fn key
Laptop **Fn** is usually handled by firmware and doesn’t generate a normal key event, so Kanata can’t remap Fn itself.
For brightness/volume, bind XF86 keys or use your WM (e.g. Hyprland + brightnessctl).

### Validate config
Before restarting the service:
```bash
sudo kanata --check -c /etc/kanata/kanata.kbd
