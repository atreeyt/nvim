
# Installation
1. Intall git.
    ```bash
    apt install git
    ```
2. Install nerdfont.
3. Install nvim (appman). 
4. Install lazygit (appimage).
5. Install wezterm (appman).
6. Download tmux (Appman).
7. Download tmux config.
    ```bash
    git clone git@gitlab.com:ben-n/tmux.git
    cd tmux
    git submodule update --init --recursive
    chmod +x ./install_tmux_config.sh && ./install_tmux_config.sh
8. Install ack (https://beyondgrep.com/install/).
    ```bash
    apt install ack
    ```
9. Install pylsp.
    ```bash
    pip install "python-lsp-server[all]"
    ```

