" Author: geam <mdelage@student.42.fr>
" Description: gcc linter for ALE sade files
"
call ale#Set('cpp_sade_executable', 'mklocal')
call ale#Set('cpp_sade_options', '')

function! ale_linters#cpp#sade#GetCommand(buffer, output) abort
    let l:cflags = ale#c#GetCFlags(a:buffer, a:output)

    " -iquote with the directory the file is in makes #include work for
    "  headers in the same directory.
    "
    " `-o /dev/null` or `-o null` is needed to catch all errors,
    " -fsyntax-only doesn't catch everything.
    return '%e -S -x c++'
    \   . ' -o ' . g:ale#util#nul_file
    \   . ' -iquote ' . ale#Escape(fnamemodify(bufname(a:buffer), ':p:h'))
    \   . ale#Pad(l:cflags)
    \   . ale#Pad(ale#Var(a:buffer, 'cpp_sade_options')) . ' -'
endfunction

call ale#linter#Define('cpp', {
\   'name': 'sade',
\   'aliases': [],
\   'output_stream': 'stderr',
\   'executable': {b -> ale#Var(b, 'cpp_sade_executable')},
\   'command': {b -> ale#c#RunMakeCommand(b, function('ale_linters#cpp#sade#GetCommand'))},
\   'callback': 'ale#handlers#gcc#HandleGCCFormatWithIncludes',
\})
