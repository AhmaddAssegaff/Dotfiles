# 🛠️ Ahmad's Dotfiles

Repository ini berisi konfigurasi personal saya untuk menciptakan lingkungan pengembangan yang efisien dan estetis di Linux (**Fedora**). Semua konfigurasi dikelola menggunakan **GNU Stow** untuk manajemen symlink yang bersih dan teratur.

## 🚀 Komponen Utama
* **Text Editor:** [Neovim](https://neovim.io/) (Custom Config / LazyVim)
* **Terminal Shell:** [Fish Shell](https://fishshell.com/) (Fast & User Friendly)
* **Terminal Prompt:** [Starship](https://starship.rs/) (Minimalist & Customizable)
* **Terminal Multiplexer:** [Tmux](https://github.com/tmux/tmux) (Session Management)
* **Terminal Emulator:** [Kitty](https://sw.kovidgoyal.net/kitty/) (GPU Accelerated)
* **File Manager CLI:** [Yazi](https://yazi-rs.github.io/) (Blazing Fast Terminal FM)
* **Git TUI:** [LazyGit](https://github.com/jesseduffield/lazygit) (Simple Terminal UI for Git)
* **Eza:** [eza](https://github.com/eza-community/eza) (Custom LS)

---

## 📦 1. Persiapan & Instalasi

Jalankan perintah berikut untuk menginstall semua tools yang diperlukan di sistem Fedora Anda:

### A. Install Tools Utama dari DNF
```bash
sudo dnf install stow git neovim fish kitty
```

### B. Install LazyGit
```bash
sudo dnf copr enable dejan/lazygit
sudo dnf install lazygit
```

### C. Install Yazi
```bash
dnf copr enable lihaohong/yazi
dnf install yazi
```

### D. Install eza
```bash
curl -LO https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
tar -xzf eza_x86_64-unknown-linux-gnu.tar.gz
sudo mv eza /usr/local/bin/
sudo chmod +x /usr/local/bin/eza
eza --version
```

### E. Install Tmux & TPM (Plugin Manager)
1. Install Tmux:
   ```bash
   sudo dnf install tmux
   ```
2. Clone TPM:
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```
3. Inisialisasi:
   Pastikan file `~/.tmux.conf` berisi:
   ```bash
   source-file ~/.config/tmux/tmux.conf
   ```

### F. Install starship
```bash
curl -sS https://starship.rs/install.sh | sh
```

### G. Install nerdfonts
Anda bisa cari [disini](https://www.nerdfonts.com/font-downloads)<br>
Saya menggunakan CaskaydiaCove nerd font
```bash
unzip ~/Downloads/CaskaydiaCove.zip -d ~/Downloads/CaskaydiaCove
mkdir -p ~/.local/share/fonts/
mv ~/Downloads/CaskaydiaCove/*.ttf ~/.local/share/fonts/
```

## ⚙️ 2. Symlink Semua Config (Stow)
### Clone Repository
```bash
git clone git@github.com:AhmaddAssegaff/Dotfiles.git ~/dotfiles
```

### A. Gunakan Stow untuk membuat symlink
> **Note:** Hapus config lama di ~/.config/ jika ada konflik
```bash
cd ~/dotfiles
stow fish nvim lazygit yazi kitty tmux starship
```

### B. Inisialisasi Tmux Config
```bash
echo "source-file ~/.config/tmux/tmux.conf" > ~/.tmux.conf
```

### C. Ubah fish jadi default Shell
```bash
chsh -s $(which fish)
```
