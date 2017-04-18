import os
import sys

#f = open('/tmp/log', 'a')
#f.write(str(os.environ))
#f.write('running {}\n'.format(__file__))
#f.write('\n')
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    #f.write('running {}\n'.format(activate_this))
#f.flush()
#f.close()
