# myVim

个人深度定制的 `Neovim` 编程开发环境配置。开箱即用，融合了类似 VSCode 的易用性与 Vim 的极致操作效率。

---

## ⚙️ 目录结构与自定义修改指南

所有基础配置与按键均已做模块化解耦，可按需在对应文件中修改：

| 模块 / 文件路径 | 职责与修改内容 |
| :--- | :--- |
| **[`init.vim`](file:///Users/niming175/myVim/init.vim)** | **主入口**：定义 Leader 键、加载模块、Coc 插件列表（`g:coc_global_extensions`）、LSP/补全按键绑定、NERDCommenter 注释设置、vim-visual-multi 多光标按键等 |
| **[`src/base.vim`](file:///Users/niming175/myVim/src/base.vim)** | **编辑器基础配置**：缩进宽度（Tab/空格）、行号、光标线、搜索高亮与行为、代码折叠、滚动预留行（scrolloff）、特定语言（如 PHP/Liquid）缩进策略 |
| **[`src/operation.vim`](file:///Users/niming175/myVim/src/operation.vim)** | **全局操作快捷键**：保存/退出、行上下移动（Alt+↑/↓）、分屏创建与窗口跳转、Tab/Buffer 切换、黑洞寄存器删除行为、`.vscode/settings.json` 自动联动逻辑 |
| **[`src/theme.vim`](file:///Users/niming175/myVim/src/theme.vim)** | **主题外观**：配色方案（默认 `monokai`）、终端真彩色（`termguicolors`）、弹窗补全浮层颜色（Pmenu）、光标行颜色、弱化高亮颜色等 |
| **[`src/PlugIn.vim`](file:///Users/niming175/myVim/src/PlugIn.vim)** | **插件管理**：使用 vim-plug 声明需要安装或移除的插件列表 |
| **[`coc-settings.json`](file:///Users/niming175/myVim/coc-settings.json)** | **LSP 与语言服务配置**：Prettier 规则、TailwindCSS、ESLint 触发模式、浮窗圆角、拼写检查（cSpell）白名单、Liquid 语言服务定义等 |
| **`src/plugConfig/`** | **独立插件单独配置目录**：<br>• [`airline.vim`](file:///Users/niming175/myVim/src/plugConfig/airline.vim)：顶底状态栏与 Tabline 配色/编号跳转<br>• [`nerdtree.vim`](file:///Users/niming175/myVim/src/plugConfig/nerdtree.vim)：文件目录树行为与 Git 状态图标<br>• [`FzfConfig.vim`](file:///Users/niming175/myVim/src/plugConfig/FzfConfig.vim)：FZF 模糊搜索过滤规则（rg 排除目录/预览窗口）<br>• [`ctrlsf.vim`](file:///Users/niming175/myVim/src/plugConfig/ctrlsf.vim)：全局关键字搜索（类似 VSCode 全局搜）<br>• [`codeium.vim`](file:///Users/niming175/myVim/src/plugConfig/codeium.vim)：AI 代码补全相关行为与接受按键<br>• [`markdown_preview.vim`](file:///Users/niming175/myVim/src/plugConfig/markdown_preview.vim)：Markdown 实时预览端口与浏览器展示参数<br>• [`indent_line.vim`](file:///Users/niming175/myVim/src/plugConfig/indent_line.vim)：对齐缩进线样式<br>• [`rainbow.vim`](file:///Users/niming175/myVim/src/plugConfig/rainbow.vim)：彩虹括号嵌套着色<br>• [`blamer.vim`](file:///Users/niming175/myVim/src/plugConfig/blamer.vim)：行末 Git Blame 悬停提示 |

---

## ⌨️ 全量快捷键汇总表

> **提示**：全局 Leader 键（热键）默认为 **`空格键 (Space)`**。

### 1. 文件基础、保存与退出
| 功能 | 快捷键 | 模式 | 说明 |
| :--- | :--- | :---: | :--- |
| **保存当前文件** | `<C-s>` 或 `S` | Normal / Insert | 快速保存 |
| **保存并退出** | `<C-x>` | Insert | 快速保存当前文件并退出 Vim |
| **退出** | `Q` | Normal | 快速 `:q` |
| **重载配置** | `R` | Normal | 立即重新执行 `$MYVIMRC` 生效 |
| **安全删除** | `d` | Normal / Visual | 使用黑洞寄存器 `"_d`，删除文本时不污染系统剪贴板 |
| **命令行历史窗口** | `<leader>:` | Normal | 替代容易误触的 `q:`，唤起命令历史 |

### 2. 窗口分屏与尺寸管理
| 功能 | 快捷键 | 模式 | 说明 |
| :--- | :--- | :---: | :--- |
| **向右垂直分屏** | `sl` | Normal | 焦点移到右侧新分屏 (`splitright + vsplit`) |
| **向左垂直分屏** | `sh` | Normal | 焦点移到左侧新分屏 (`nosplitright + vsplit`) |
| **向上水平分屏** | `sk` | Normal | 焦点移到上方新分屏 (`nosplitbelow + split`) |
| **向下水平分屏** | `sj` | Normal | 焦点移到下方新分屏 (`splitbelow + split`) |
| **分屏间切换光标** | `<leader>h / j / k / l` | Normal | 快速将光标跳至 左 / 下 / 上 / 右 窗口 |
| **调整分屏高度** | `<leader>↑` / `<leader>↓` | Normal | 垂直高度每次增/减 3 行 |

### 3. 标签页（Tab）与缓冲区（Buffer）管理
| 功能 | 快捷键 | 模式 | 说明 |
| :--- | :--- | :---: | :--- |
| **按编号直接跳转** | `<leader>1` ~ `<leader>9`, `<leader>0` | Normal | **直接跳转到顶部状态条对应编号的 Buffer** |
| **切换前后 Buffer** | `<leader>→` / `<leader>←` | Normal | 顺次切换到下一个/上一个打开的缓冲区 |
| **关闭当前 Buffer** | `<leader>w` | Normal | 关闭当前文件缓冲区（`:bd`），不关闭分屏窗口 |
| **交替 Buffer 切换** | `<leader><Tab>` | Normal | 在最近打开的两个 Buffer 间快速对切 (`<C-^>`) |
| **新建 Tab 页面** | `<leader>t` | Normal | 创建全新标签页 (`:tabe`) |
| **切换上/下个 Tab** | `<leader>-` / `<leader>=` | Normal | 切换上一个 / 下一个标签页 |

### 4. 代码编辑、光标移动与多光标
| 功能 | 快捷键 | 模式 | 说明 |
| :--- | :--- | :---: | :--- |
| **上下移动行/代码块** | `Alt + ↑` / `Alt + ↓` | Normal / Insert / Visual | 类似 VSCode，整行或选中的多行代码平移 |
| **按单词跳转** | `<C-Left>` / `<C-Right>` | Normal / Visual | 跳到上一个/下一个单词起始处（`b` / `w`） |
| **缩进调整** | `Tab` / `Shift + Tab` | Visual | 连续缩进/反缩进，且保持选中区域（`>gv` / `<gv`） |
| **代码注释切换** | `<C-c>` | Normal / Visual | 单行/多行注释与反注释（NERDCommenter） |
| **多光标：选中当前词** | `<C-d>` | Normal | 选中光标所在单词，再次按下追加下一个匹配项（类似 VSCode `Cmd/Ctrl+D`） |
| **多光标：全选所有匹配**| `<C-l>` | Normal | 一次性选中当前 Buffer 内所有相同的词 |
| **多光标：上下添加光标**| `Shift + ↑` / `<C-Down>` | Normal | 在上方/下方同一列直接追加新光标 |
| **多光标：左右选择扩展**| `Shift + ←` / `Shift + →`| Normal | 左右扩展选区 |
| **多光标：退出/移除** | `q`（多光标下）/ 双击 `Esc` | - | 移除当前光标标记或彻底退出多光标模式 |

### 5. 搜索与文件查找
| 功能 | 快捷键 | 模式 | 说明 |
| :--- | :--- | :---: | :--- |
| **文件搜索 (FZF)** | `<C-p>` | Normal | 模糊搜索当前项目文件（已自动过滤 git/node_modules/dist 等产物） |
| **FZF 浮窗操作** | `<C-t>` / `<C-j>` / `<C-l>` | FZF 窗口内 | 分别以 新标签页 / 水平分屏 / 垂直分屏 打开选中文件 |
| **FZF 预览开关** | `Ctrl + /` | FZF 窗口内 | 显隐右侧代码预览窗口 |
| **全局文本搜索 (CtrlSF)**| `<leader>F` | Normal / Visual | 打开全局内容搜索面板；支持选中文本后搜索 |
| **光标词路径搜索** | `<C-f>n` | Normal | 搜索光标处词对应路径文件 |
| **搜索结果切换** | `=` / `-` | Normal | 上下查找结果跳转并居中视窗（`nzz` / `Nzz`） |
| **清除搜索高亮** | `<leader><CR>` (空格+回车) | Normal | 清理当前匹配项高亮 |

### 6. LSP、代码补全、定义跳转与诊断 (Coc.nvim)
| 功能 | 快捷键 | 模式 | 说明 |
| :--- | :--- | :---: | :--- |
| **自动补全切换** | `Tab` / `Shift + Tab` | Insert | 在 Coc 弹窗补全候选项间上下选择 |
| **确认补全项** | `Enter` (`<CR>`) | Insert | 确认当前选中的补全项 |
| **强制呼出补全** | `Ctrl + Space` (Neovim) | Insert | 主动唤起补全菜单 |
| **跳转函数/变量定义** | `<C-b>` | Normal | 在当前窗口直接跳转至定义位置 |
| **跳转类型定义** | `gy` | Normal | 跳转至 Type Definition |
| **跳转接口实现** | `gi` | Normal | 跳转至 Implementation |
| **查找所有引用** | `gr` | Normal | 查找全局所有 Reference |
| **查看类型/文档 Hover**| `<leader>H` | Normal | 悬停查看光标处函数签名、文档或 Vim Help |
| **上下文诊断跳跃** | `[g` / `]g` | Normal | 快速跳至上一个 / 下一个语法警告或错误点 |
| **代码快速修复 (Fix)** | `<leader>a` | Normal / Visual | 触发针对当前行或选区的 CodeAction / 修复建议 |
| **格式化代码** | `<leader>f` | Normal / Visual | 格式化当前文档全文或选中区域（也可用 `:Format`） |

### 7. AI 辅助与扩展工具
| 功能 | 快捷键 | 模式 | 说明 |
| :--- | :--- | :---: | :--- |
| **目录树切换** | `<leader>b` | Normal | 打开 / 关闭 NERDTree 目录树侧边栏 |
| **定位当前文件** | `<leader>n` | Normal | 在目录树中定位并展开当前编辑的文件（NERDTreeFind） |
| **Markdown 实时预览**| `<leader>m` | Normal (md 文件) | 启动本地服务在浏览器中实时渲染 Markdown |
| **Emmet 快速展开** | `<C-e>` + 展开键 | Insert | HTML / JSX / Vue 模板极速生成 |
| **Codeium: 接受补全** | `<C-j>` | Insert | 采纳整段 AI 提示 |
| **Codeium: 接受下一个词**| `<C-l>` | Insert | 仅采纳提示的下一个单词 |
| **Codeium: 接受下一行**| `<C-L>` (`Ctrl+Shift+l`)| Insert | 采纳下一行提示 |
| **Codeium: 切换建议** | `<C-n>` / `<C-p>` | Insert | 轮换下一个 / 上一个 AI 补全方案 |
| **Codeium: 清除提示** | `<C-k>` | Insert | 取消当前出现的行内补全提示 |

---

## 🚀 环境要求与安装

### 环境要求
- **Neovim** >= 0.8.0（推荐最新稳定版）
- **Node.js** >= 14.x（Coc 语言服务与 Prettier 所需）
- **Ripgrep (`rg`)**：建议安装 (`brew install ripgrep`)，FZF 将获得极速文件检索体验

### 首次配置与安装
```bash
# 1. 软链接配置至 Neovim 配置目录
mkdir -p ~/.config
ln -s ~/myVim ~/.config/nvim

# 2. 安装插件
# 打开 Neovim 并执行插件安装命令：
nvim +PlugInstall +qall

# 3. Coc 插件初始化
# 再次进入 nvim，Coc 会自动安装并准备 g:coc_global_extensions 中声明的语言服务插件
```

---

## 💡 常用功能技巧

### 1. 多光标编辑 (`vim-visual-multi`)
* 类似 VSCode 的 `Ctrl+D`：光标放在变量名上按 `<C-d>` 选中并跳到下一个，接着按 `i` 即可进入多光标同步编辑模式；
* 按 `q` 跳过当前项，按两次 `Esc` 彻底退出多光标模式。

### 2. 全局搜索与替换 (`CtrlSF`)
* 想要在全工程内搜索某函数名：按 `<leader>F`（即 `Space + Shift + f`），下方弹出预览搜索框；
* 搜索出的结果列表支持像普通 buffer 一样直接修改，`:w` 保存时会自动把修改批量同步写回对应的各源码文件。

### 3. VSCode 设置无缝联动
* 当项目根目录下存在 `.vscode/settings.json` 时，本配置在启动时会自动为项目建立软链接，使得 `coc.nvim` 能直接复用 VSCode 的格式化与代码风格规则。

### 4. 代码风格规范 (`.editorconfig`)
* 项目中推荐放置 `.editorconfig` 约束团队代码风格（如 JS 缩进 2 空格、PHP/后端缩进 4 空格等），配置内置的 `editorconfig-vim` 会自动强制执行相应规则。
