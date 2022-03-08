" **************************************************************************** "
"                                                                              "
"                                                       :::      ::::::::      "
"    plugsettings.vim                                 :+:      :+:    :+:      "
"                                                   +:+ +:+         +:+        "
"    By: taskylizard                              +#+  +:+       +#+           "
"                                               +#+#+#+#+#+   +#+              "
"    Created: 2021/12/13 12:12:47 by taskylizard     #+#    #+#                "
"    Updated: 2021/12/13 12:12:47 by taskylizard    ###   ########.fr          "
"                                                                              "
" **************************************************************************** "
" INFO: Setup lua stuff so my ass doesn't hurt

let g:cursorhold_updatetime = 100

" coc calls
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" jump stuff
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jy <Plug>(coc-type-definition)
nmap <leader>ji <Plug>(coc-implementation)
nmap <leader>jr <Plug>(coc-references)

" kept this for wilder.nvim but that didn't work huh
" let s:scale = ['#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
"       \ '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
"       \ '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
"       \ '#c8d43a', '#bfde43', '#b6e84e', '#aff05b']
" let s:gradient = map(s:scale, {i, fg -> wilder#make_hl(
"       \ 'WilderGradient' . i, 'Pmenu', [{}, {}, {'foreground': fg}]
"       \ )})

