# lf.vim

Fast file manager in vim/neovim powered by lf.

This plugin is a fork of the [nnn](https://github.com/mcchrish/nnn.vim) vim plugin.

<p align="center">
  <img width="934" src="https://user-images.githubusercontent.com/19517248/107288180-52e55580-6a63-11eb-8f2f-67ce4d673547.png">
  <small>colorscheme <a href="https://github.com/jacoborus/tender.vim">tender</a></small>
</p>

### Requirements

1. lf
2. Neovim or Vim 8.1 with terminal support

### Install

You must install lf. Instructions
[here](https://github.com/gokcehan/lf#installation).

Then install using your favorite plugin manager:

```vim
" using vim-plug
Plug 'mroavi/lf.vim'
```

### Usage

To open lf as a file picker in vim/neovim, use the command `:LfPicker` or
`:Lp` or the key-binding `<leader>lf`. You can pass a directory to `:LfPicker`
command and opens lf from there e.g. `:LfPicker path/to/somewhere`.

Once you select one or more files and
press <kbd>enter</kbd>, vim quits the lf window and opens the first selected
file and add the remaining files to the arg list/buffer list.

Pressing <kbd>enter</kbd> on a file in lf will pick any earlier selection, pick
the file and exit lf.

Note that pressing <kbd>l</kbd> or <kbd>Right</kbd> on a file would open it
instead of picking.

You may have to set `set hidden` to make floating window work.

### Configurations

#### Custom mappings

```vim
" Disable default mappings
let g:lf#set_default_mappings = 0

" Then set your own
nnoremap <silent> <leader>l :LfPicker<CR>


" Or override
" Start lf in the current file's directory
nnoremap <leader>lf :LfPicker %:p:h<CR>
```

#### Layout

```vim
" Opens the lf window in a split
let g:lf#layout = 'new' " or vnew, tabnew etc.

" Or pass a dictionary with window size
let g:lf#layout = { 'left': '~20%' } " or right, up, down

" Floating window (neovim latest and vim with patch 8.2.191)
let g:lf#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
```

#### Action

You can set extra key-bindings for opening files in different ways. Nothing is
set by default to not override lf's own key-bindings.

```vim
let g:lf#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }
```

For example, when inside an lf window, pressing <kbd>ctrl-t</kbd> will open the
selected file in a tab, instead of the current window. <kbd>ctrl-x</kbd> will
open in a split an so on. Meanwhile for multi selected files will be loaded in
the buffer list.

#### Command override

When you want to override the default lf command and add some extra flags.
For example, to automatically start the server after launched, define

```vim
let g:lf#command = 'lf -server'
```

#### `lf#pick()`

The `lf#pick([<dir>][,<opts>])` function can be called with custom directory
and additional options such as opening file in splits or tabs. Basically a more
configurable version of `:LfPicker` command.

```vim
call lf#pick('~/some-files', { 'edit': 'vertical split' })
" Then you can do all kinds of mappings if you want
```

`opts` can be:

- `edit` - type of window the select file will be open.
- `layout` - same as `g:lf#layout` and overrides it if specified.

### Credits

- Main lf program: https://github.com/gokcehan/lf
- Vim/Neovim nnn plugin: https://github.com/mcchrish/nnn.vim
