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
      mappings = {
        close = { 'q', '<Esc>' },
      },
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

  -- 浮窗按 ESC / q 直接关闭并返回代码窗口
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'dapui_hover',
    callback = function(args)
      vim.keymap.set('n', '<Esc>', '<Cmd>close<CR>', { buffer = args.buf, silent = true, nowait = true })
      vim.keymap.set('n', 'q', '<Cmd>close<CR>', { buffer = args.buf, silent = true, nowait = true })
    end,
  })

  -- 查找当前打开的 dapui_hover 浮窗
  local function find_hover_win()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype == 'dapui_hover' and vim.api.nvim_win_get_config(win).relative ~= '' then
        return win
      end
    end
    return nil
  end

  -- 按 Enter 键才进入浮窗；无浮窗时保持正常回车
  vim.keymap.set('n', '<CR>', function()
    local hover_win = find_hover_win()
    if hover_win and vim.api.nvim_win_get_cursor and vim.api.nvim_win_is_valid(hover_win) then
      vim.api.nvim_set_current_win(hover_win)
      return
    end
    vim.cmd('normal! ' .. vim.v.count1 .. '\r')
  end, { silent = true, desc = '按回车进入调试悬浮窗' })

  -- 提取光标下的有效 PHP 变量（必须带 $ 且长度大于 1，防段错误）
  local function get_php_var_under_cursor()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2] + 1
    local before = line:sub(1, col)
    local after = line:sub(col + 1)
    local prefix = before:match('[%$%w_]*$') or ''
    local suffix = after:match('^[%w_]*') or ''
    local expr = prefix .. suffix
    if expr:sub(1, 1) == '$' and #expr > 1 then
      return expr
    end
    return nil
  end

  -- 停留感应延迟 500ms：仅在断点暂停且光标在有效变量时触发，enter=false 不聚焦
  vim.opt.updatetime = 500
  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    callback = function()
      local session = dap.session()
      if session and session.current_frame and vim.bo.buftype == '' and vim.bo.filetype == 'php' then
        local var = get_php_var_under_cursor()
        if var then
          pcall(function()
            dapui.eval(var, { enter = false })
          end)
        end
      end
    end,
  })
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
