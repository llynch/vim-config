" when vim has no support for python2 (:version to show compilation flags)
let s:current_dir = expand("<sfile>:p:h")
let cmd = 'python ' . s:current_dir . '/python-virtualenv.py'
let output = system(cmd)
