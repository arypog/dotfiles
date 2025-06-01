return {
  {'folke/tokyonight.nvim'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        sources = {
          {name = 'nvim_lsp'},
        },
        mapping = cmp.mapping.preset.insert({
          -- Navigate between completion items
          ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
          ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

          -- `Enter` key to confirm completion
          ['C-y'] = cmp.mapping.confirm({select = false}),

          -- Ctrl+Space to trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          -- Scroll up and down in the completion documentation
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      vim.diagnostic.config({
        virtual_text = true
      })
      -- This is where you enable features that only work
      -- if there is a language server active in the file
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = {buffer = event.buf}

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end,
      })
      require('mason').setup({})
      require('mason-lspconfig').setup({
        automatic_installation = true,

        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        },
      })
    end
  },
}

