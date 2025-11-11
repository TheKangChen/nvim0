# Neovim Zero [WIP]

A **zero-plugin** Neovim configuration derived from my main setup to push myself to *git good* at native Vim/Neovim features without relying on plugins. Despite its simplicity, this config is still completely usable for day-to-day editing ;)

> [!NOTE]
> There are no plans to add plugins, only auto commands or custom commands where they make sense.

---

## Dependencies

- **Language Servers (LSP)**:

  These must be installed via your system package manager (e.g. `pacman` on Arch, `brew` on macOS, etc.).

  - The LSPs I personally use are defined in the `lsp` directory.
  - To add another server:


    1. Create a file under `lsp/` named `<lsp_name>.lua`.
    2. Add the lsp configurations to the file.
    3. In `lua/config/lsp.lua`, add your server to the *Enable LSPs* section:

    ```lua
    vim.lsp.enable({
        ...,
        "<lsp_name>",
    })
    ```

> [!TIP]
> - Use `:checkhealth vim.lsp` to view LSPs attached to the current buffer or any LSP related issues.
> - Available LSPs: https://microsoft.github.io/language-server-protocol/implementors/servers/
> - Example configurations: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

- [**`Glow`**](https://github.com/charmbracelet/glow): for Markdown previewing.

  Install it separately using your system’s package manager.

---

## Installation

### Option 1: Replace your existing config

If you want to fully switch to this setup, clone it into your Neovim configuration directory:

```bash
git clone https://github.com/TheKangChen/nvim0.git ~/.config/nvim
```

> [!IMPORTANT]
> If you already have an existing Neovim config, back it up first:

```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

Then, launch Neovim:

```bash
nvim
```

### Option 2: Run alongside your existing config

You can load this config under a different directory using Neovim’s `NVIM_APPNAME` environment variable.

```bash
git clone https://github.com/TheKangChen/nvim0.git ~/.config/nvim-zero
```

Then start Neovim with:

```bash
NVIM_APPNAME=nvim-zero nvim
```

> [!TIP]
> You can create an alias in your `bashrc` or `zshrc` file to avoid typing all of this every time.

Neovim will treat `~/.config/nvim-zero` as its config directory, keeping your main `~/.config/nvim` untouched.

---

## Usage & Help

For general Vim help, use:

  - `:help` to open documentation
  - `:Tutor` for a 30-minute interactive Vim tutorial

### Options

See `lua/config/options.lua` for all configuration options, or run `:opt`.

### Keymaps

View all mapped keys with `:map`.

### LSP Features

For the full range of features provided by Neovim’s built-in LSP, such as go-to definition, hover documentation, references, and more, use the `:map` command to see all available key bindings.

#### Completion

Completions rely entirely on Neovim’s built-in LSP client. They should appear automatically as you type. If not, try:

  - `<Ctrl-X><Ctrl-O>` for omni-completion
  - `<Ctrl-N>` to cycle through completions if available

> [!TIP]
> See `:help i_CTRL-X` for more about completion sub-modes.

#### Code Actions

Use the `gra` keymap (in normal mode) to view and trigger available LSP code actions.

### Spell Checking

Use `z=` (in normal mode) to view spelling suggestions for the word under the cursor.

---

## Plans

The base configuration is intentionally minimal, but I may add or refine keymaps, autocmds, default options, etc. as I continue to use this setup.

### Road Map

- Remove the floating terminal (keymap `<leader>T`). I mainly use `tmux`, so it’s not particularly useful. Keeping it for now just in case.

---

## Inspiration

- [radleylewis - You Don't Need Plugins](https://github.com/radleylewis/nvim-lite/tree/youtube_demo)
- [SylvanFranklin - Based Neovim Config](https://github.com/SylvanFranklin/.config/tree/main/nvim)
