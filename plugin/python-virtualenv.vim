" when vim has no support for python2 (:version to show compilation flags)
" let s:current_dir = expand("<sfile>:p:h")
" let cmd = 'python ' . s:current_dir . '/python-virtualenv.py'
" let output = system(cmd)
"
python <<EOF
import os
import sys

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    # execfile in python2
    #execfile(activate_this, dict(__file__=activate_this))
    exec(open(activate_this).read(), dict(__file__=activate_this))
EOF


