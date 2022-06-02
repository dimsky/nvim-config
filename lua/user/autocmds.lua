vim.cmd [[


  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _aut_init_code
  autocmd!
  "新建.c,.h,.sh,.java文件，自动插入文件头
  autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
  ""定义函数SetTitle，自动插入文件头
  func SetTitle()
  "如果文件类型为.sh文件
  if &filetype == 'sh'
  call setline(1,"\#!/bin/bash")
  call append(line("."), "")
  elseif &filetype == 'python'
  call setline(1,"#!/usr/bin/env python")
  call append(line("."),"# coding=utf-8")
  call append(line(".")+1, "")

  elseif &filetype == 'ruby'
  call setline(1,"#!/usr/bin/env ruby")
  call append(line("."),"# encoding: utf-8")
  call append(line(".")+1, "")

  "    elseif &filetype == 'mkd'
  "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
  else
  call setline(1, "/*************************************************************************")
  call append(line("."), "	> File Name: ".expand("%"))
  call append(line(".")+1, "	> Author: xiaotian")
  call append(line(".")+2, "	> Mail: dimsky@163.com")
  call append(line(".")+3, "	> Created Time: ".strftime("%c"))
  call append(line(".")+4, " ************************************************************************/")
  call append(line(".")+5, "")
  endif
  if expand("%:e") == 'cpp'
  call append(line(".")+6, "#include <iostream>")
  call append(line(".")+7, "#include <string>")
  call append(line(".")+8, "using namespace std;")
  call append(line(".")+9, "")
  call append(line(".")+10,  "int main(void) {")
  call append(line(".")+11,  "")
  call append(line(".")+12, "  return 0;")
  call append(line(".")+13, "}")
  call append(line(".")+14, "")
  endif
  if expand("%:e") == 'c'
  call append(line(".")+6,  "#include <stdio.h>")
  call append(line(".")+7,  "")
  call append(line(".")+8,  "int main(void) {")
  call append(line(".")+9,  "")
  call append(line(".")+10, "  return 0;")
  call append(line(".")+11, "}")
  endif
  if expand("%:e") == 'h'
  call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
  call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
  call append(line(".")+8, "#endif")
  endif
  if &filetype == 'java'
  call append(line(".")+6,"public class ".expand("%:r"))
  call append(line(".")+7,"")
  endif
  "新建文件后，自动定位到文件末尾
  endfunc
  autocmd BufNewFile * normal G

  augroup end


  augroup _auto_format
  autocmd BufWritePre * :Format
  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end


vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.c", "*.h" },
  command = "echo 'Entering a C or C++ file'",
})
