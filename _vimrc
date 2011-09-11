" exec ":set rtp=$HOME/exVim/vimfiles,$HOME/exVim/vimfiles/after," . &rtp
set rtp+=$HOME/exVim/vimfiles,$HOME/exVim/vimfiles/after
source $HOME/exVim/vimrc_MyVim.vim
source $HOME/exVim/vimrc_ex.vim

" 
" " Add the vimfiles folder of custom plugin and ex plugin to runtime path
" let s:MyVimRootExist = 0
" let s:exExist = 0
" if finddir("$HOME/vim/MyVimRoot") != ""
"     set rtp^=$HOME/vim/MyVimRoot/vimfiles,$HOME/vim/MyVimRoot/vimfiles/after
"     let s:MyVimRootExist = 1
" endif
" if finddir("$HOME/vim/ex") != ""
"     set rtp+=$HOME/vim/ex/vimfiles,$HOME/vim/ex/vimfiles/after
"     let s:exExist = 1
" endif
" 
" " Execute the user vimrc
" if findfile("$HOME/vim/_vimrc_user_pre") != ""
"     source $HOME/vim/_vimrc_user_pre
" endif
" 
" " launch the vimrc in ex and MyVimRoot
" if !exists("g:CustomCfg_Skip_MyVimRoot_rc")
"     let g:CustomCfg_Skip_MyVimRoot_rc = 0
" endif
" if !exists("g:CustomCfg_Skip_ex_rc")
"     let g:CustomCfg_Skip_ex_rc = 0
" endif
" if (!g:CustomCfg_Skip_MyVimRoot_rc) && s:MyVimRootExist
"     source $HOME/vim/MyVimRoot/_vimrc
" endif
" if (!g:CustomCfg_Skip_ex_rc) && s:exExist
"     source $HOME/vim/ex/_vimrc_ex
" endif
" 
" " Execute the post user vimrc
" if findfile("$HOME/vim/_vimrc_user_post") != ""
"     source $HOME/vim/_vimrc_user_post
" endif
" 
" 
