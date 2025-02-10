
return {
  'David-Kunz/gen.nvim',
  config = function()
    -- docker run -d -p 3003:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
    -- docker run -e  HSA_OVERRIDE_GFX_VERSION=10.3.0 -d --device /dev/kfd --device /dev/dri -v ollama:/root/.ollama -p 11434:11434 --name ollama --restart always ollama/ollama:rocm

    require('gen').setup({
      model = "llama3.1",
      host = "localhost",
      port = "11434",
      display_mode = "horizontal-split",
      no_auto_close = false,
      init = nil,
    })
    
    require('gen').prompts['Complete'] = {
      prompt = "Generate code from the following comment, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```"
    }

    vim.keymap.set({ 'n', 'v' }, '<Leader>o', '<cmd>Gen <CR>')
    vim.keymap.set({ 'n', 'v' }, '<Leader><CR>', '<cmd>Gen Chat<CR>')
  end
}
