setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab
setlocal textwidth=80
setlocal formatoptions=cq
setlocal wrapmargin=0
if exists('+colorcolumn')
  setlocal colorcolumn=+1
else
  autocmd BufEnter <buffer> match ColorColumn /\%81v.*/
endif
"let python_highlight_py2=1
let python_highlight_common=1
