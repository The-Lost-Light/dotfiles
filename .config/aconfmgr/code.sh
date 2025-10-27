# Git
AddPackage git # the fast distributed version control system
AddPackage git-delta # Syntax-highlighting pager for git and diff output
AddPackage jujutsu # Git-compatible VCS that is both simple and powerful
AddPackage onefetch # Git repository summary on your terminal
AddPackage --foreign better-commits # A CLI for creating better commits following the conventional commit guidelines.
AddPackage --foreign turtle # Manage your git repositories with easy-to-use dialogs in Nautilus.

# Editor
AddPackage helix # A post-modern modal text editor
AddPackage zed # A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter

# Game
AddPackage godot # Advanced cross-platform 2D and 3D game engine

# LSP
AddPackage prettier # An opinionated code formatter

# Tool
AddPackage ccache # Compiler cache that speeds up recompilation by caching previous compilations
AddPackage sccache # Shared compilation cache
AddPackage cloc # Count lines of code
AddPackage cmake # A cross-platform open-source make system
AddPackage cpio # A tool to copy files into or out of a cpio or tar archive
AddPackage nix # A purely functional package manager
CopyFile /etc/nix/nix.conf

# Flutter
AddPackage fvm # Flutter Version Management: A simple CLI to manage Flutter SDK versions.

# Java
AddPackage jdk-openjdk # OpenJDK Java development kit

# Python
AddPackage uv # An extremely fast Python package installer and resolver written in Rust
AddPackage tk # A windowing toolkit for use with tcl
AddPackage --foreign marimo # A reactive Python notebook that's reproducible, git-friendly, and deployable as scripts or apps

# Rust
AddPackage rustup # The Rust toolchain installer

# Web
AddPackage caddy # Fast web server with automatic HTTPS
AddPackage deno # A secure runtime for JavaScript and TypeScript

# typst
AddPackage typst # A markup-based typesetting system for the sciences
