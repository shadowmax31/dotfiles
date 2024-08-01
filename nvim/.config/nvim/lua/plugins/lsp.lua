return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'mfussenegger/nvim-jdtls',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      local home = os.getenv('HOME')
      local data = vim.fn.stdpath('data')

      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

      vim.keymap.set('n', 'J', vim.diagnostic.open_float)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

      local on_attach = function(client, bufnr)

        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc

          end

          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        client.server_capabilities.semanticTokensProvider = nil
        vim.lsp.inlay_hint.enable(true)

        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>.', vim.lsp.buf.code_action, '[C]ode [A]ction')

        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')


        local component_toggle = function()
          local switcher = require('switcher')
          if vim.bo.filetype == "java" then
            switcher.toggle2({'Assembler.java', 'Service.java'})
          else
            switcher.toggle('component.ts', 'component.html')
          end
        end
        vim.keymap.set('n', '<leader>t', component_toggle)


        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()

        end, { desc = 'Format current buffer with LSP' })
      end

      local servers = {
        tailwindcss = {},
        rust_analyzer = {},
        tsserver = {
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = true,
            },
          },
        },
        angularls = {},
        jdtls = {},
        pest_ls = {},
        bashls = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
            },
          },
        },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      require('mason').setup()
      local mason_lspconfig = require ('mason-lspconfig')
      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
          }
        end,
        ['clangd'] = function()
          require('lspconfig')['clangd'].setup {
            cmd = { 'clangd', "--query-driver='/usr/local/bin/g++'" },
            on_attach = on_attach
          }
        end,
        ['jdtls'] = function()
          local lombok = data..'/mason/packages/jdtls/lombok.jar'
          require('lspconfig')['jdtls'].setup {
            cmd = {
              'jdtls',
              '--jvm-arg=-javaagent:'..lombok,
              '-configuration',
              home..'/.cache/jdtls/config',
              '-data',
              home..'/.cache/jdtls/workspace'
            },
            on_attach = on_attach
          }
        end
      }

      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete({}),
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,

          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }

    end
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
}
