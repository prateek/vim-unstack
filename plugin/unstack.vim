if exists('g:loaded_unstack')
  finish
endif
let g:loaded_unstack = 1

"Settings {{{
if !exists('g:unstack_mapkey')
  let g:unstack_mapkey = '<leader>s'
endif
exe 'nnoremap '.g:unstack_mapkey.' :set operatorfunc=unstack#Unstack<cr>g@'
exe 'vnoremap '.g:unstack_mapkey.' :<c-u>call unstack#Unstack(visualmode())<cr>'

"List of text extractors
if (!exists('g:unstack_extractors'))
  let g:unstack_extractors = unstack#extractors#GetDefaults()
endif

"populate quickfix with stack
if (!exists('g:unstack_populate_quickfix'))
  let g:unstack_populate_quickfix = 0
endif

"open stack in vsplits in a new tab
if (!exists('g:unstack_open_tab'))
  let g:unstack_open_tab = 1
endif

"Either landscape (vsplits) or portrait (splits)
if (!exists('g:unstack_layout'))
  let g:unstack_layout = "landscape"
endif

"Whether or not to show signs on error lines (highlights them red)
if !exists('g:unstack_showsigns')
  let g:unstack_showsigns = 1
endif "}}}
"Commands {{{
command! -nargs=1 UnstackFromText call unstack#UnstackFromText(<f-args>)
command! UnstackFromClipboard call unstack#UnstackFromText(@+)
"}}}

" vim: et sw=2 sts=2 foldmethod=marker foldmarker={{{,}}}
