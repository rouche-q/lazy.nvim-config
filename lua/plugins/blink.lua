return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  opts = {
    keymap = { preset = 'enter' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      prebuilt_binaries = {
        download = true,
        force_version = 'v0.13.0',
      }
    }
  }
}
