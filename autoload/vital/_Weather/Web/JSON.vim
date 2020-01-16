" ___vital___
" NOTE: lines between '" ___vital___' is generated by :Vitalize.
" Do not modify the code nor insert new lines before '" ___vital___'
function! s:_SID() abort
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')
endfunction
execute join(['function! vital#_Weather#Web#JSON#import() abort', printf("return map({'decode': '', '_vital_depends': '', '_vital_created': '', 'encode': '', '_vital_loaded': ''}, \"vital#_Weather#function('<SNR>%s_' . v:key)\")", s:_SID()), 'endfunction'], "\n")
delfunction s:_SID
" ___vital___
let s:save_cpo = &cpo
set cpo&vim

function! s:_true() abort
  return 1
endfunction

function! s:_false() abort
  return 0
endfunction

function! s:_null() abort
  return 0
endfunction

function! s:_resolve(val, prefix) abort
  let t = type(a:val)
  if t == type('')
    let m = matchlist(a:val, '^' . a:prefix . '\(null\|true\|false\)$')
    if !empty(m)
      return s:const[m[1]]
    endif
  elseif t == type([]) || t == type({})
    return map(a:val, 's:_resolve(v:val, a:prefix)')
  endif
  return a:val
endfunction


function! s:_vital_created(module) abort
  " define constant variables
  if !exists('s:const')
    let s:const = {}
    let s:const.true = function('s:_true')
    let s:const.false = function('s:_false')
    let s:const.null = function('s:_null')
    lockvar s:const
  endif
  call extend(a:module, s:const)
endfunction

function! s:_vital_loaded(V) abort
  let s:V = a:V
  let s:string = s:V.import('Data.String')
endfunction

function! s:_vital_depends() abort
  return ['Data.String']
endfunction

" @vimlint(EVL102, 1, l:null)
" @vimlint(EVL102, 1, l:true)
" @vimlint(EVL102, 1, l:false)
function! s:decode(json, ...) abort
  let settings = extend({
        \ 'use_token': 0,
        \}, get(a:000, 0, {}))
  let json = iconv(a:json, 'utf-8', &encoding)
  let json = join(split(json, "\n"), '')
  let json = substitute(json, '\\u34;', '\\"', 'g')
  let json = substitute(json, '\\u\(\x\x\x\x\)', '\=s:string.nr2enc_char("0x".submatch(1))', 'g')
  if settings.use_token
    let prefix = '__Web.JSON__'
    while stridx(json, prefix) != -1
      let prefix .= '_'
    endwhile
    let [null,true,false] = map(['null','true','false'], 'prefix . v:val')
    sandbox return s:_resolve(eval(json), prefix)
  else
    let [null,true,false] = [s:const.null(),s:const.true(),s:const.false()]
    sandbox return eval(json)
  endif
endfunction
" @vimlint(EVL102, 0, l:null)
" @vimlint(EVL102, 0, l:true)
" @vimlint(EVL102, 0, l:false)

function! s:encode(val, ...) abort
  let settings = extend({
        \ 'indent': 0,
        \}, get(a:000, 0, {})
        \)
  if type(a:val) == 0
    return a:val
  elseif type(a:val) == 1
    let json = '"' . escape(a:val, '\"') . '"'
    let json = substitute(json, "\r", '\\r', 'g')
    let json = substitute(json, "\n", '\\n', 'g')
    let json = substitute(json, "\t", '\\t', 'g')
    return iconv(json, &encoding, 'utf-8')
  elseif type(a:val) == 2
    if s:const.true == a:val
      return 'true'
    elseif s:const.false == a:val
      return 'false'
    elseif s:const.null == a:val
      return 'null'
    else
      " backward compatibility
      return string(a:val)
    endif
  elseif type(a:val) == 3
    return s:_encode_list(a:val, settings)
  elseif type(a:val) == 4
    return s:_encode_dict(a:val, settings)
  else
    return string(a:val)
  endif
endfunction

" @vimlint(EVL102, 1, l:ns)
function! s:_encode_list(val, settings) abort
  if empty(a:val)
    return '[]'
  elseif !a:settings.indent
    let encoded_candidates = map(copy(a:val), 's:encode(v:val, a:settings)')
    return printf('[%s]', join(encoded_candidates, ','))
  else
    let previous_indent = get(a:settings, '_previous_indent')
    let indent = previous_indent + a:settings.indent
    let ns = extend(copy(a:settings), {
          \ '_previous_indent': indent,
          \})
    let encoded_candidates = map(
          \ copy(a:val),
          \ printf('''%s'' . s:encode(v:val, ns)', repeat(' ', indent)),
          \)
    return printf(
          \ "[\n%s\n%s]",
          \ join(encoded_candidates, ",\n"),
          \ repeat(' ', previous_indent)
          \)
  endif
endfunction
" @vimlint(EVL102, 0, l:ns)

" @vimlint(EVL102, 1, l:ns)
function! s:_encode_dict(val, settings) abort
  if empty(a:val)
    return '{}'
  elseif !a:settings.indent
    let encoded_candidates = map(keys(a:val),
          \ 's:encode(v:val, a:settings) . '':'' . s:encode(a:val[v:val], a:settings)'
          \)
    return printf('{%s}', join(encoded_candidates, ','))
  else
    let previous_indent = get(a:settings, '_previous_indent')
    let indent = previous_indent + a:settings.indent
    let ns = extend(copy(a:settings), {
          \ '_previous_indent': indent,
          \})
    let encoded_candidates = map(keys(a:val),
          \ printf(
          \   '''%s'' . s:encode(v:val, ns) . '': '' . s:encode(a:val[v:val], ns)',
          \   repeat(' ', indent),
          \ ),
          \)
    return printf("{\n%s\n%s}",
          \ join(encoded_candidates, ",\n"),
          \ repeat(' ', previous_indent),
          \)
  endif
endfunction
" @vimlint(EVL102, 0, l:ns)

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et ts=2 sts=2 sw=2 tw=0:
