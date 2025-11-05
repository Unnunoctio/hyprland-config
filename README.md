# 🌀 **Hyprland Config**

> Minimal yet powerful **Hyprland** setup for Arch Linux — tuned for performance, visuals, and productivity.

---

## ⚙️ **Installation**

### 🧱 1. Install Arch Linux with `archinstall`

- Choose:
  - **Desktop Environment:** `Hyprland`
  - **GPU Drivers:** `NVIDIA proprietary`
  - **Audio & Network:** `PipeWire`, `NetworkManager`, `Bluetooth`
- Add the following to **packages**:
  ```
  git
  ```

---

### 🧰 2. Install `paru` (AUR helper)
```bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

---

### 📦 3. Install Required Packages
```bash
paru -S \
  hyprpaper hyprpicker quickshell \
  gnome-keyring starship grimblast-git \
  cloudflare-warp-bin p7zip brave-bin \
  discord visual-studio-code-insiders-bin \
  otf-monaspace ttf-material-symbols-variable-git \
  ttf-firacode-nerd
```

---

## 🧩 **Configuration**

### 📁 1. Clone this repository
```bash
git clone https://github.com/unnunnoctio/hyprland-config.git
```

### 🏠 2. Copy files to `~/.config`
```bash
cp -r hyprland-config/* ~/.config/
```

---

## 🧠 **Extra Configuration**

### 🧑‍💻 Visual Studio Code Insiders

Change shortcut from `code-insiders` → `code`:
```bash
sudo ln -s /usr/bin/code-insiders /usr/local/bin/code
```

---

### 🦁 Brave Browser

Make Brave use **GNOME Keyring** instead of `kwallet`:

```bash
sudo nano /usr/share/applications/brave-browser.desktop
```

Replace:
```
Exec=brave %U
```
with:
```
Exec=brave --password-store=basic %U
```

Also replace other lines:
```
Exec=brave
→ Exec=brave --password-store=basic

Exec=brave --incognito
→ Exec=brave --incognito --password-store=basic
```

---

### 🌠 Starship Prompt

Add **Starship** to your shell:

```bash
nano ~/.bashrc
```

Append:
```bash
eval "$(starship init bash)"
```

Reload shell:
```bash
source ~/.bashrc
```

---

## 💫 **Result**
> A clean, fast, and modern Arch + Hyprland setup with:
> - 🧩 Modular configuration  
> - 💻 Seamless Wayland support  
> - 🎨 Beautiful prompt and typography  
> - 🦊 Browser and editor integration
