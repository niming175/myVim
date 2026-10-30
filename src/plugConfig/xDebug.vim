" =================== 现代 nvim-dap (Xdebug 3) 专用配置 ===================
lua << EOF
local has_dap, dap = pcall(require, 'dap')
if not has_dap then
  return
end

local has_dapui, dapui = pcall(require, 'dapui')
local has_vt, vt = pcall(require, 'nvim-dap-virtual-text')

-- 1. 行内虚拟文本提示（可选辅助）
if has_vt then
  vt.setup({
    commented = true,
  })
end

-- 2. 调试 UI 布局配置（保留原有设计）
if has_dapui then
  dapui.setup({
    layouts = {
      {
        elements = {
          { id = 'scopes', size = 0.55 },
          { id = 'repl',   size = 0.45 },
        },
        size = 12,
        position = 'bottom',
      },
    },
    floating = {
      max_height = 0.5,    -- 最大高度不超过屏幕 50%
      max_width = 0.6,     -- 最大宽度不超过屏幕 60%，杜绝撑满全屏
      border = 'rounded',  -- 圆角边框更美观
    },
  })

  -- 调试生命周期自动开启/关闭 UI
  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
  end
end

-- 3. 断点图标美化
vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'Error', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'Special', linehl = 'Visual', numhl = '' })

-- 4. 配置 PHP 调试适配器
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.local/share/nvim/dap-adapters/php-debug/extension/out/phpDebug.js' },
}

-- 5. 配置 PHP 调试环境与路径映射
dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug (Docker)',
    port = 9003,
    pathMappings = {
      ['/var/www/analysis'] = '/Volumes/Documents/www/analysis',
      ['/var/www'] = '/Volumes/Documents/www',
    },
  },
}

-- 6. 快捷查看变量浮窗（支持 PHP 的 $ 变量名提取）
_G.dap_eval_php = function()
  if not dap.session() then
    return
  end
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1
  local before = line:sub(1, col)
  local after = line:sub(col + 1)
  local prefix = before:match('[%$%w_]*$') or ''
  local suffix = after:match('^[%w_]*') or ''
  local expr = prefix .. suffix
  if expr ~= '' and expr ~= '$' then
    dapui.eval(expr)
  else
    dapui.eval()
  end
end
EOF

" =================== 统一快捷键映射 ===================
nnoremap <silent> <F5> :lua require('dap').continue()<CR>
nnoremap <silent> <F10> :lua require('dap').toggle_breakpoint()<CR>
nnoremap <silent> <F2> :lua require('dap').step_into()<CR>
nnoremap <silent> <F3> :lua require('dap').step_over()<CR>
nnoremap <silent> <F4> :lua require('dap').step_out()<CR>
nnoremap <silent> <F6> :lua require('dap').terminate()<CR>:lua require('dapui').close()<CR>
nnoremap <silent> <Leader>dr :lua require('dap').repl.open()<CR>
nnoremap <silent> <Leader>du :lua require('dapui').toggle()<CR>
nnoremap <silent> <Leader>de :lua _G.dap_eval_php()<CR>
vnoremap <silent> <Leader>de :lua require('dapui').eval()<CR>
