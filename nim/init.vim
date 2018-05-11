set nocompatible "vi互換OFF
" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END


"===== 表示設定 ==
set number "行番号表示
set title "編集中ファイル名表示
set showmatch "対応する格好を強調
set visualbell "ビープ音視覚表示
set lines=59 "widowの縦幅
set columns=100 "windowの横幅
set cursorline "カーソル行可視化
set nowrap "文折り返しオフ
set background=dark

"====ステータスバー設定====
set statusline=%F "ファイル名
set statusline+=%m " 変更チェック表示
set statusline+=%r " 読み込み専用かどうか表示
set statusline+=%h " ヘルプページなら[HELP]と表示
set statusline+=%w " プレビューウインドウなら[Prevew]と表示
set statusline+=%= " これ以降は右寄せ表示
set statusline+=[ENC=%{&fileencoding}] " file encoding
set statusline+=[LOW=%l/%L] " 現在行数/全行数
set laststatus=2 "ステータスライン表示
set nowildmenu "コマンドライン補完
set wildmode=list:full "コマンドライン補完モード
set history=10000 "コマンドライン履歴10000
set pumheight=10 "補完メニューの高さ10

"====マウス設定====
set mouse=a
set foldcolumn=3
set foldmethod=marker

"===== 文字、カーソルなどの設定 =====
set encoding=utf-8
set fenc=utf-8 "文字コードを指定
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set nobackup "バックアップファイルを作らない
set noswapfile "スワップファイルを作らない
set hidden "バッファが編集中でもその他のファイルを開けるように
set autoread "外部でファイルに変更がされた場合は読みなおす
set showcmd "入力中のコマンドをステータスに表示する
set virtualedit=onemore "カーソルを行末の一つ先まで移動可能にする
set tabstop=4 "TAB4
set autoindent "自動インデント
"set smartindent "オートインデント
set shiftwidth=4 "自動的に入力されたインデントの空白を2つ分に設定
let &t_ti.="\e[5 q" "カーソルの形状を変更
"set expandtab
set clipboard+=unnamed "クリップボード有効
set clipboard=unnamed "クリップボード有効

"===== 検索設定 =====
set ignorecase "大文字、小文字の区別をしない
set smartcase "大文字が含まれている場合は区別する
set wrapscan "検索時に最後まで行ったら最初に戻る
set hlsearch "検索した文字を強調
set incsearch "インクリメンタルサーチを有効にする


"====キーバインド====
noremap j gj
noremap k gk
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
nnoremap <ESC><ESC> :nohlsearch<CR> "検索結果を<ESC><ESC>で取り消し
nnoremap <silent><C-e> :NERDTreeToggle<CR> "ctrl+eでNERDTreeオープン

inoremap <silent> jj <ESC> "素早くjjでインサートモードからノーマルモードに


"====プラグイン設定====
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.config/nvim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


"NERDTree設定
autocmd StdinReadPre * let s:std_in=1 "ファイル指定vim起動時、NEARDTree非表示
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif "上記の続き



syntax on "コード色付け
