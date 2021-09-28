#!/bin/bash


function set_tuna() {
    git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
    
    BREW_TAPS="$(BREW_TAPS="$(brew tap 2>/dev/null)"; echo -n "${BREW_TAPS//$'\n'/:}")"
    for tap in core cask{,-fonts,-drivers,-versions} command-not-found; do
        if [[ ":${BREW_TAPS}:" == *":homebrew/${tap}:"* ]]; then
            # 将已有 tap 的上游设置为本镜像并设置 auto update
            # 注：原 auto update 只针对托管在 GitHub 上的上游有效
            git -C "$(brew --repo homebrew/${tap})" remote set-url origin "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-${tap}.git"
            git -C "$(brew --repo homebrew/${tap})" config homebrew.forceautoupdate true
        else   # 在 tap 缺失时自动安装（如不需要请删除此行和下面一行）
            brew tap --force-auto-update "homebrew/${tap}" "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-${tap}.git"
        fi
    done
    
}


function set_origin() {
    # brew 程序本身，Homebrew / Linuxbrew 相同
    git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew.git
    
    # 以下针对 macOS 系统上的 Homebrew
    BREW_TAPS="$(BREW_TAPS="$(brew tap 2>/dev/null)"; echo -n "${BREW_TAPS//$'\n'/:}")"
    for tap in core cask{,-fonts,-drivers,-versions} command-not-found; do
        if [[ ":${BREW_TAPS}:" == *":homebrew/${tap}:"* ]]; then
            git -C "$(brew --repo homebrew/${tap})" remote set-url origin "https://github.com/Homebrew/homebrew-${tap}.git"
        fi
    done
}


while getopts oc flag
do
    case "${flag}" in
        c) set_tuna;;
        o) set_origin;;
    esac
done
