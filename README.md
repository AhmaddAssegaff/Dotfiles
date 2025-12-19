# Dotfiles

Dotfiles ini berisi konfigurasi saya pribadi untuk Fish, Neovim, LazyGit, dan Yazi.  
Semua konfigurasi dikelola dengan **GNU Stow** agar mudah dipasang di sistem baru.

## 1. 📦 Dependensi

Perintah di bawah **khusus untuk Fedora**:

```bash
sudo dnf install stow git neovim
sudo dnf install lazygit
sudo dnf install yazi
curl -LO https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz
```
tar -xzf eza_x86_64-unknown-linux-gnu.tar.gz
sudo mv eza /usr/local/bin/
sudo chmod +x /usr/local/bin/eza
eza --version

## 2. Clone Repository
```bash
git clone git@github.com:AhmaddAssegaff/Dotfiles.git ~/dotfiles
```

## 2. masuk ke directory dan stow dotfiles
```bash
cd ~/dotfiles
stow lazygit nvim yazi fish kitty
```
