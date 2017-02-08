#!/usr/bin/env python

import ctags
import sys
import traceback

def main(tags_file, search_expression):
    # read tags file
    tags = ctags.CTags(tags_file)
    status = tags.setSortType(ctags.TAG_SORTED)

    # search
    entry = ctags.TagEntry()
    found = tags.find(entry, search_expression, ctags.TAG_PARTIALMATCH)
    if not found:
        return

    # save entries
    entries = []
    while True:
        file = entry['file']
        pattern = entry['pattern']
        entries.append({'file':file, 'pattern': pattern})
        #print entry['pattern']
        #print entry['file']
        found = tags.findNext(entry)
        if not found:
            break

    for i, entry in enumerate(entries):
        file = entry['file']
        pattern = entry['pattern']
        print("{}:{}".format(file, pattern))

tags_file = sys.argv[1]
search_expression = sys.argv[2]
main(tags_file, search_expression)
