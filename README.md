# Neovim Zero [WIP]

A **zero-plugin** Neovim configuration derived from my main setup to *git good* at native Vim/Neovim features without relying on plugins. Despite its simplicity, this config is still completely usable for day-to-day editing ;)

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

### Update

To update configuration to latest version run this command inside the config directory (`~/.config/nvim` or `~/.config/nvim-zero`):

```bash
git pull
```

---

## Usage & Help

For general Vim help, use:

  - `:help` to open documentation
  - `:Tutor` for a 30-minute interactive Vim tutorial

### Options

See `lua/config/options.lua` for all configuration options, or run `:opt`.

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

### Key Bindings

Here's a list of **custom key mappings**. To view all active mappings, use `:map`.

<table style="width:100%">
  <tr>
    <th>Key Map</th>
    <th>Description</th>
    <th>Key Map</th>
    <th>Description</th>
  </tr>

  <tr>
    <td><pre>&ltSpace&gtqq</pre></td>
    <td>Write & quit all buffer</td>
    <td><pre>&ltSpace&gto</pre></td>
    <td>Open file in explorer</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gt-</pre></td>
    <td>Window horizontal split</td>
    <td><pre>&ltSpace&gt_</pre></td>
    <td>Open alt file in split</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gt\</pre></td>
    <td>Window vertical split</td>
    <td><pre>&ltSpace&gt|</pre></td>
    <td>Open alt file in vertical split</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gtbn</pre></td>
    <td>Next buffer</td>
    <td><pre>&ltSpace&gtbp</pre></td>
    <td>Previous buffer</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gtbb</pre></td>
    <td>Switch to alternate file</td>
    <td><pre>&ltSpace&gtmm</pre></td>
    <td>Open Explorer (Netrw)</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gtff</pre></td>
    <td>Find file</td>
    <td><pre>&ltSpace&gtrc</pre></td>
    <td>Edit config file</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gttr</pre></td>
    <td>Switch to regular theme</td>
    <td><pre>&ltSpace&gt</pre></td>
    <td>Switch to alternative theme</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gtz</pre></td>
    <td>Toggle center cursor</td>
    <td><pre>&ltSpace&gtp</pre></td>
    <td>Preview markdown in vertical split</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gte</pre></td>
    <td>Preview diagnostic in float</td>
    <td><pre>&ltSpace&gtdl</pre></td>
    <td>Show all diagnostics in location list</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gtdx</pre></td>
    <td>Toggle diagnostics virtual text</td>
    <td><pre>&ltSpace&gtsS</pre></td>
    <td>Save session (global)</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gtss</pre></td>
    <td>Save session (local)</td>
    <td><pre>&ltSpace&gtsl</pre></td>
    <td>Load saved session</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gtT</pre></td>
    <td>Toggle floating terminal</td>
    <td><pre>&ltESC&gt</pre></td>
    <td>Close floating terminal</td>
  </tr>
  <tr>
    <td><pre>K</pre></td>
    <td>LSP hover documentation</td>
    <td><pre>gh</pre></td>
    <td>LSP Signature documentation</td>
  </tr>
  <tr>
    <td><pre>gD</pre></td>
    <td>Go to declaration</td>
    <td><pre>gd</pre></td>
    <td>Go to definition</td>
  </tr>
  <tr>
    <td><pre>gra</pre></td>
    <td>LSP code action</td>
    <td><pre>grn</pre></td>
    <td>Rename all references</td>
  </tr>
  <tr>
    <td><pre>grr</pre></td>
    <td>LSP references</td>
    <td><pre>gri</pre></td>
    <td>LSP implementation</td>
  </tr>
  <tr>
    <td><pre>grt</pre></td>
    <td>LSP type definition</td>
    <td><pre>&ltSpace&gtcf</pre></td>
    <td>Format buffer</td>
  </tr>
  <tr>
    <td><pre>&ltCtrl-x&gt&ltCtrl-o&gt</pre></td>
    <td>Omni completion</td>
    <td><pre>&ltSpace&gtv</pre></td>
    <td>Go to definition in vertical split</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gtwa</pre></td>
    <td>Add workspace folder</td>
    <td><pre>&ltSpace&gtwr</pre></td>
    <td>Remove workspace folder</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gtwl</pre></td>
    <td>List workspace folders</td>
    <td><pre>&ltCtrl-q&gt</pre></td>
    <td>Toggle quickfix window</td>
  </tr>
  <tr>
    <td><pre>&ltSpace&gta</pre></td>
    <td>Add current file to quickfix</td>
    <td><pre>&ltSpace&gt1...9</pre></td>
    <td>Go to file #n on quickfix</td>
  </tr>
  <tr>
    <td><pre>&ltCtrl-k&gt</pre></td>
    <td>Focus window top</td>
    <td><pre>&ltCtrl-j&gt</pre></td>
    <td>Focus window below</td>
  </tr>
  <tr>
    <td><pre>&ltCtrl-h&gt</pre></td>
    <td>Focus window left</td>
    <td><pre>&ltCtrl-l&gt</pre></td>
    <td>Focus window right</td>
  </tr>
  <tr>
    <td><pre>&ltAlt-d&gt</pre></td>
    <td>Delete without yanking</td>
    <td><pre>&ltAlt-c&gt</pre></td>
    <td>Change without yanking</td>
  </tr>
  <tr>
    <td><pre>&ltAlt-j&gt</pre></td>
    <td>Move line down</td>
    <td><pre>&ltAlt-k&gt</pre></td>
    <td>Move line up</td>
  </tr>
  <tr>
    <td><pre>&ltAlt-h&gt</pre></td>
    <td>Unindent line</td>
    <td><pre>&ltAlt-l&gt</pre></td>
    <td>Indent line</td>
  </tr>
</table>

> [!NOTE]
> To change key bindings, go to `lua/config/keymaps.lua` and to change LSP related key bindings, go to `lua/config/lsp.lua`.

---

## Plans

The base configuration is intentionally minimal, but I may add or refine keymaps, autocmds, default options, etc. as I continue to use this setup.

### Road Map

- [ ] Remove the floating terminal (keymap `<leader>T`). I mainly use `tmux`, so it’s not particularly useful. Keeping it for now just in case.
- [ ] Add custom statusline
- [ ] Auto commands highlighting tasks (e.g. `TODO`, `BUG`, `FIX`, `INFO`, etc.)

---

## Inspiration

- [radleylewis - You Don't Need Plugins](https://github.com/radleylewis/nvim-lite/tree/youtube_demo)
- [SylvanFranklin - Based Neovim Config](https://github.com/SylvanFranklin/.config/tree/main/nvim)
