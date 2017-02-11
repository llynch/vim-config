# encofing=utf8
import re
import sys

matches = []
for arg in sys.argv[1:]:
    match = re.compile(arg, re.IGNORECASE)
    matches.append(match)

n=0
for line in  sys.stdin.readlines():
    found = True
    for match in matches:
        if match.search(line) is None:
            found = False
            break

    if not found:
        continue

    print line

    # limit as an argument should be implemented but for now just dont return
    # more than 50
    n = n + 1
    if n == 50:
        break
