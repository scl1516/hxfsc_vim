"是否兼容VI，compatible为兼容，nocompatible为不完全兼容
"如果设置为compatible，则tab将不会变成空格
set nocompatible

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
"设置鼠标运行模式为WINDOWS模式
behave mswin

" Multi-encoding setting, MUST BE IN THE BEGINNING OF .vimrc!
"
if has("multi_byte")
    " When 'fileencodings' starts with 'ucs-bom', don't do this manually
    "set bomb
    set fileencodings=ucs-bom,utf-8,chinese,taiwan,japan,korea,latin1
    " CJK environment detection and corresponding setting
    if v:lang =~ "^zh_CN"
        " Simplified Chinese, on Unix euc-cn, on MS-Windows cp936
        set encoding=chinese
        set termencoding=chinese
        if &fileencoding == ''
            set fileencoding=chinese
        endif
    elseif v:lang =~ "^zh_TW"
        " Traditional Chinese, on Unix euc-tw, on MS-Windows cp950
        set encoding=taiwan
        set termencoding=taiwan
        if &fileencoding == ''
            set fileencoding=taiwan
        endif
    elseif v:lang =~ "^ja_JP"
        " Japanese, on Unix euc-jp, on MS-Windows cp932
        set encoding=japan
        set termencoding=japan
        if &fileencoding == ''
            set fileencoding=japan
        endif
    elseif v:lang =~ "^ko"
        " Korean on Unix euc-kr, on MS-Windows cp949
        set encoding=korea
        set termencoding=korea
        if &fileencoding == ''
            set fileencoding=korea
        endif
    endif
    " Detect UTF-8 locale, and override CJK setting if needed
    if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
        set encoding=utf-8
    endif
else
    echoerr 'Sorry, this version of (g)Vim was not compiled with "multi_byte"'
endif

"解决菜单乱码
set encoding=utf-8
"fileencodings需要注意顺序，前面的字符集应该比后面的字符集大
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set langmenu=zh_CN.utf-8
set imcmdline
source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

"解决consle输出乱码
language messages zh_CN.utf-8

"自动检测文件类型并加载相应的设置，snipMate插件需要打开这个配置选项
filetype plugin indent on

"语法高亮
syntax on

"自动缩进
set autoindent
"设置 Backspace 和 Delete 的灵活程度，backspace=2 则没有任何限制
"设置在哪些模式下使用鼠标功能，mouse=a 表示所有模式
set mouse=a
set backspace=2
"不自动换行
set nowrap
"设置超过100字符自动换行
"set textwidth=100
"设置超过100列的字符带下划线
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>100v.\+', -1)
"syn match out80 /\%80v./ containedin=ALL
"hi out80 guifg=white guibg=red
"智能对齐方式
set smartindent
"一个tab是4个字符
set tabstop=4
"按一次tab前进4个字符
set softtabstop=4
"用空格代替tab
set expandtab
"设置自动缩进
set ai!
"缩进的字符个数
set cindent shiftwidth=4
"set autoindent shiftwidth=2

"设置折叠模式
set foldcolumn=4
"光标遇到折叠，折叠就打开
"set foldopen=all
"移开折叠时自动关闭折叠
"set foldclose=all
"zf zo zc zd zr zm zR zM zn zi zN
"依缩进折叠
"   manual  手工定义折叠
"   indent  更多的缩进表示更高级别的折叠
"   expr    用表达式来定义折叠
"   syntax  用语法高亮来定义折叠
"   diff    对没有更改的文本进行折叠
"   marker  对文中的标志折叠
set foldmethod=syntax
"启动时不要自动折叠代码
set foldlevel=100
"依标记折叠
set foldmethod=marker

"显示行号
set number

"打开光标的行列位置显示功能
set ruler

"显示中文引号
set ambiwidth=double

"行高亮
set cursorline
"列高亮，与函数列表有冲突
set cursorcolumn

"设置命令行的高度
set cmdheight=1

"高亮搜索的关键字
set hlsearch

"搜索忽略大小写
set ignorecase

"设置命令历史行数
set history=100

"启动的时候不显示那个援助索马里儿童的提示
"set shortmess=atI

"不要闪烁
"set novisualbell

"显示TAB健
"set list
"set listchars=tab:>-,trail:-

"高亮字符，让其不受100列限制
":highlight OverLength ctermbg=red ctermfg=white guibg=grey guifg=white
":match OverLength '\%101v.*'

"设置VIM状态栏
set laststatus=2 "显示状态栏(默认值为1, 无法显示状态栏)
set statusline=
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
if v:version >= 600
    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
    set statusline+=%{&fileencoding}, " encoding
endif
set statusline+=%{&fileformat}] " file format
set statusline+=%= " right align
"set statusline+=%2*0x%-8B\ " current char
set statusline+=0x%-8B\ " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset
if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
    set statusline+=\ %{VimBuddy()} " vim buddy
endif
"状态行颜色
"highlight StatusLine guifg=SlateBlue guibg=Yellow
"highlight StatusLineNC guifg=Gray guibg=White

"设置路径,多个路径用逗号分隔
set path=.,"E:/Web/htdocs",,

"去掉有关vi一致性模式，避免以前版本的一些bug和局限
set nocp

"增强模式中的命令行自动完成操作
set wildmenu

"执行 Vim 缺省提供的 .vimrc 文件的示例，包含了打开语法加亮显示等最常用的功能
source $VIMRUNTIME/vimrc_example.vim

"缺省不产生备份文件
set nobackup
"在输入括号时光标会短暂地跳到与之相匹配的括号处，不影响输入
set showmatch
"正确地处理中文字符的折行和拼接
set formatoptions+=mM

"设定文件浏览器目录为当前目录
set bsdir=buffer
"自动切换当前目录为当前文件所在的目录
set autochdir
"自动重新加载外部修改内容
"set autoread

"使PHP识别EOT字符串
hi link phpheredoc string

"允许在有未保存的修改时切换缓冲区
set hidden

"选中一段文字并全文搜索这段文字
vmap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vmap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"进入当前编辑的文件的目录
autocmd BufEnter * exec "cd %:p:h"

"保存文件的格式顺序
set fileformats=dos,unix

"配色（更多的配色见colors目录和http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/index-c.html）
"colorscheme peacock_light
colorscheme darkburn
language english
"设置字体
if has("gui")
    if has("win32")
        "启动时会弹出字体选择框，如果取消，则采用系统默认字体
        "set guifont=*
        "Windows默认使用的字体，字体较粗
        set guifont=Courier\ New:h10
		"set guifont=Fixedsys
        "中文显示变形，字体较粗
        "set guifont=Monospace:h9
        "中文显示变形，字体较细
        "set guifont=Consolas:h9
        "中文显示变形，字体较细
        "set guifont=Lucida\ Console:h10
        "中文显示变形，字体较细
        "set guifont=Monaco:h9
        "中文显示变形，字体较细
        "set guifont=Andale\ Mono:h10
        "中文显示变形，字体较细
        "set guifont=Bitstream\ Vera\ Sans\ Mono:h9
        "需要运行修改版的gvim才能识别
        "set guifont=YaHei\ Consolas\ Hybrid:h9
        "如果guifontwide采用中文字体，汉字将自动使用guifontwide，英文自动使用guifont
        "set guifontwide=YaHei\ Consolas\ Hybrid:h9
		"exec 'set guifont='.iconv('Courier_New', &enc, 'gbk').':h11:cANSI'
        "exec 'set guifontwide='.iconv('Microsoft\ YaHei', &enc, 'gbk').':h10'
		au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 245)
    else
        "set guifont=Consolas:h10
		"exec 'set guifont='.iconv('Courier_New', &enc, 'gbk').':h11:cANSI'
        "exec 'set guifontwide='.iconv('Microsoft\ YaHei', &enc, 'gbk').':h10'
	endif
    "set columns=128 lines=36
endif

"置粘贴模式，这样粘贴过来的程序代码就不会错位了。
"set paste

"设置帮助信息
set helplang=cn

"自动保存session和viminfo
"缺省的sessionoptions选项包括：blank,buffers,curdir,folds,help,options,tabpages,winsize
"也就是会话文件会恢复当前编辑环境的空窗口、所有的缓冲区、当前目录、折叠(fold)相关的信息、帮助窗口、所有的选项和映射、所有的标签页(tab)、窗口大小
"set sessionoptions-=curdir
"au VimLeave * mksession! $VIMRUNTIME/Session.vim
"au VimLeave * wviminfo! $VIMRUNTIME/_viminfo
"source $VIMRUNTIME/Session.vim
"rviminfo $VIMRUNTIME/_viminfo

"记录上次关闭的文件及状态
set viminfo='10,\"100,:20,%,n$VIMRUNTIME/_viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"设置插件SuperTab
"设置按下<Tab>后默认的补全方式, 默认是<C-P>,
"现在改为<C-X><C-O>. 关于<C-P>的补全方式,
"还有其他的补全方式, 可以看看下面的一些帮助:
":help ins-completion
":help compl-omni
let g:SuperTabRetainCompletionType=2
"0 - 不记录上次的补全方式
"1 - 记住上次的补全方式,直到用其他的补全命令改变它
"2 - 记住上次的补全方式,直到按ESC退出插入模式为止
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

set diffexpr=MyDiff()
function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"phpDocumentor
"this includes the script and maps the combination <ctrl> + p
"to the doc functions.
source $VIM\vimfiles\plugin\php-doc.vim
imap <A-/> <ESC>:call PhpDocSingle()<CR>i
nmap <A-/> :call PhpDocSingle()<CR>
vmap <A-/> :call PhpDocRange()<CR>

"You can obtain the completion dictionary file from:
"http://cvs.php.net/viewvc.cgi/phpdoc/funclist.txt
set dictionary+=$VIM\vimfiles\syntax\function.txt

"Use the dictionary completion
set complete-=k complete+=k

"Alt + -> 打开下一个文件
map <M-right> <ESC>:bn<RETURN>
"Alt + <- 打开上一个文件
map <M-left> <ESC>:bp<RETURN>

"使用TAB键自动完成
"This function determines, wether we are on
"the start of the line text(then tab indents)
"or if we want to try auto completion
function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-N>"
    endif
endfunction
"使用SuperTab之后，就可以关闭该设置了
"inoremap <TAB> <C-R>=InsertTabWrapper()<CR>

"平台判断
function! GetSystem()
    if (has("win32") || has("win95") || has("win64") || has("win16"))
        return "windows"
    elseif has("unix")
        return "linux"
    elseif has("mac")
        return "mac"
    endif
endfunction

"取得光标处的匹配
function! GetPatternAtCursor(pat)
    let col = col('.') - 1
    let line = getline('.')
    let ebeg = -1
    let cont = match(line, a:pat, 0)
    while (ebeg >= 0 || (0 <= cont) && (cont <= col))
        let contn = matchend(line, a:pat, cont)
        if (cont <= col) && (col < contn)
            let ebeg = match(line, a:pat, cont)
            let elen = contn - ebeg
            break
        else
            let cont = match(line, a:pat, contn)
        endif
    endwh
    if ebeg >= 0
        return strpart(line, ebeg, elen)
    else
        return ""
    endif
endfunction

"打开链接
function! OpenUrl()
    let s:url = GetPatternAtCursor('\v(https?://|ftp://|file:/{3}|www\.)((\w|-)+\.)+(\w|-)+(:\d+)?(/(\w|[~@#$%^&+=/.?-])+)?')
    "echo s:url
    if s:url == ""
        echohl WarningMsg
        echomsg '在光标处未发现URL！'
        echohl None
    else
        if GetSystem() == "windows"
            call system("explorer " . s:url)
        else
            call system("firefox " . s:url . " &")
        endif
    endif
    unlet s:url
endfunction
nmap <C-LeftMouse> :call OpenUrl()<CR>

"放大字体
function <SID>FontSize_Enlarge()
    if GetSystem() == "linux"
        let pattern = '\<\d\+$'
    elseif GetSystem() == "windows"
        let pattern = ':h\zs\d\+\ze:'
    endif
    let fontsize = matchstr(&gfn, pattern)
    let cmd = substitute(&gfn, pattern, string(fontsize + 1), 'g')
    let &gfn=cmd
    let fontsize = matchstr(&gfw, pattern)
    let cmd = substitute(&gfw, pattern, string(fontsize + 1), 'g')
    let &gfw=cmd
endfunction
nnoremap <A-+> :call <SID>FontSize_Enlarge()<CR>

"缩小字体
function <SID>FontSize_Reduce()
    if GetSystem() == "linux"
        let pattern = '\<\d\+$'
    elseif GetSystem() == "windows"
        let pattern = ':h\zs\d\+\ze:'
    endif
    let fontsize = matchstr(&gfn, pattern)
    let cmd = substitute(&gfn, pattern, string(fontsize - 1), 'g')
    let &gfn=cmd
    let fontsize = matchstr(&gfw, pattern)
    let cmd = substitute(&gfw, pattern, string(fontsize - 1), 'g')
    let &gfw=cmd
endfunction
nnoremap <A--> :call <SID>FontSize_Reduce()<CR>

"html自动输入匹配标签，输入>之后自动完成匹配标签
au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim

"能够漂亮的显示.NFO文件
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

""""""""""""""""""""""""""""""
" 设置lookupfile插件
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")               "设置tag文件的名字
    let g:LookupFile_TagExpr = '"./filenametags"'
endif
"映射LookupFile为,lf
nmap <silent> ,lf <Plug>LookupFile<CR>
"映射LUBufs为,lb
nmap <silent> ,lb :LUBufs<CR>
"映射LUWalk为,lw
nmap <silent> ,lw :LUWalk<CR>
"映射LUPath为,lp
nmap <silent> ,lp :LUPath<CR>

"F2处理行尾的空格以及文件尾部的多余空行
"Automatically remove trailing spaces when saving a file.
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
"Remove indenting on empty line
map <F2> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>
function! CleanupBuffer(keep)
    " Skip binary files
    if (&bin > 0)
        return
    endif
    " Remove spaces and tabs from end of every line, if possible
    silent! %s/\s\+$//ge
    " Save current line number
    let lnum = line(".")
    " number of last line
    let lastline = line("$")
    let n        = lastline
    " while loop
    while (1)
        " content of last line
        let line = getline(n)
        " remove spaces and tab
        if (!empty(line))
            break
        endif
        let n = n - 1
    endwhile
    " Delete all empty lines at the end of file
    let start = n+1+a:keep
    if (start < lastline)
        execute n+1+a:keep . "," . lastline . "d"
    endif
    " after clean spaces and tabs, jump back
    exec "normal " . lnum . "G"
endfunction

"快速查找（插件grep插件，需要grep软件）
"nnoremap <silent> <F3> :Grep<CR>
"给n映射一个快捷键，习惯上喜欢用F3
nmap <F3> n
"给n映射一个快捷键，习惯上喜欢用F3
nmap <S-F3> N

"PHP语法检查
"map <F4> :!E:/Web/Server/PHP/php.exe -l %<CR>
"map <F4> :!D:/Program\ Files/php5.4/php.exe -l %<CR>
"function! CheckPHPSyntax()
"    setlocal makeprg=\"php.exe\"\ -l\ -n\ -d\ html_errors=off
"    setlocal shellpipe=>
    " Use error format for parsing PHP error output
"    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
"    make %
"endfunction
" Perform :PHP_CheckSyntax()
"map <F4> :call CheckPHPSyntax()<CR>

"PHP代码美化
"map <C-A-F4> :!ZendCodeAnalyzer.exe %<CR>

"PHP代码通过Zend加密
function! ZendEncodePHP()
    let currentfile=fnamemodify(bufname("%"), ":p")
    let newfile=fnamemodify(bufname("%"), ":p:h") . "\\" . fnamemodify(bufname("%"), ":t:r") . ".zend." . fnamemodify(bufname("%"), ":e")
    execute "!\"E:\\Web\\Tools\\ZendGuard\\bin\\zendenc.exe\"" . ' ' . currentfile . ' ' . newfile
endfunction
map <C-F4> :call ZendEncodePHP()<CR>

"使用IE预览网页
function! BrowseWebPage()
    let filepath=substitute(getcwd()."\\".bufname("%"), 'E:\\Web\\htdocs\\', "http://localhost/", "g")
    let filepath=substitute(filepath,"\\","\/","g")
    silent execute "!\"explorer\""." ".filepath
endfunction
map <S-F4> :call BrowseWebPage()<CR>

"F6打开或关闭nerd_tree和taglist
"由于nerd_tree和taglist采用了trinity插件打开
"所以具体的设置以trinity.vim为准
nmap <F6>  :TrinityToggleTagListAndNERDTree<CR>

"F7单独切换打开nerd_tree（nerd_tree插件）
let g:NERDChristmasTree = 1              "色彩显示
let g:NERDTreeShowHidden = 1             "显示隐藏文件
let g:NERDTreeWinPos = 'left'            "窗口显示位置
let g:NERDTreeHighlightCursorline = 0    "高亮当前行
nmap <F7>  :TrinityToggleNERDTree<CR>

"netrw设置（自带目录树插件）
let g:netrw_winsize=30
let g:netrw_liststyle=1
let g:netrw_timefmt='%Y-%m-%d %H:%M:%S'
nmap <silent> <C-F7> :Sexplore!<cr>

"Ctrl + F7打开project插件
nmap <silent> <A-F7>  :Project<CR>

"F8单独切换打开taglist（taglist插件）
if GetSystem() == "windows"                    "设定Windows系统中ctags程序的位置
    let g:Tlist_Ctags_Cmd = $VIMRUNTIME.'\ctags'
else
    let g:Tlist_Ctags_Cmd = '/usr/bin/ctags'
endif
"let g:Tlist_Sort_Type = 'name'          "以名称顺序排序，默认以位置顺序(order)
let g:Tlist_Show_One_File = 1           "不同时显示多个文件的tag，只显示当前文件的
let g:Tlist_Exit_OnlyWindow = 1         "如果taglist窗口是最后一个窗口，则退出vim
lef g:Tlist_File_Fold_Auto_Close = 1    "当光标不在编辑文件里面的时候全部折叠
let g:Tlist_Use_Right_Window = 1        "在右侧窗口中显示taglist窗口
let g:Tlist_Enable_Fold_Column = 1      "显示折叠边栏
nmap <F8>  :TrinityToggleTagList<CR>

"F11查看打开的文件列表（bufexplorer插件）
let g:bufExplorerDefaultHelp = 1
let g:bufExplorerDetailedHelp = 0
nmap <F11> :BufExplorer <CR>

"F12生成/更新tags文件
set tags=tags;
set autochdir
function! UpdateTagsFile()
    silent !ctags -R --fields=+ianS --extra=+q
endfunction
nmap <F12> :call UpdateTagsFile()<CR>

"Ctrl + F12删除tags文件
function! DeleteTagsFile()
    "Linux下的删除方法
    "silent !rm tags
    "Windows下的删除方法
    silent !del /F /Q tags
endfunction
nmap <C-F12> :call DeleteTagsFile()<CR>
"退出VIM之前删除tags文件
"au VimLeavePre * call DeleteTagsFile()
if has('gui_running') && has("win32")
        "只显示菜单,若不加则有可能影响系统工具条的显示
        set guioptions=mcr
        "高亮当前行,和VIM所选的主题有关,可选
	set cursorline
       "设F10为全屏快捷键 normal模式下
	nmap <f10> :call libcallnr('gvimfullscreen.dll', 'ToggleFullScreen', 0)<cr>
        nmap <Leader>ff :call libcallnr('gvimfullscreen.dll', 'ToggleFullScreen', 0)<cr>
        "设F10为全屏快捷键 inster模式下
        imap <F10> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
	"启动自动全屏
        au GUIEnter * simalt ~x
endif

" git test
" git test
" git test



" CodeAnalyzer
map <F4> :call CheckPHPSyntax()<CR>
function CheckPHPSyntax()
    let codeanalyzercmd = 'D:\Zend\ZendCodeAnalyzer --disable var-arg-unused'
    let exefile = expand("%:t")
    let &makeprg = codeanalyzercmd
    set errorformat=%f(line\ %l):\ %m
    silent make %
    if len(getqflist()) > 2
        call setqflist(remove(getqflist(), 2, -1))
        copen
    else
        cclose
        normal :
        echohl Waring | echo "check over, no error" | echohl None
    endif
endf