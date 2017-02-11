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
        name = entry['name']
        kind = entry['kind']
        entries.append({
            'file':file,
            'pattern': pattern,
            'name': name,
            'kind': kind})
        # https://github.com/jonashaag/python-ctags3
        #print
        #print entry['name']
        #print entry['kind']
        #print entry['url']
        #print entry['fileScope']
        #print entry['line']
        found = tags.findNext(entry)
        if not found:
            break

    for i, entry in enumerate(entries):
        file = entry['file']
        pattern = entry['pattern']
        name = entry['name']
        kind = entry['kind']
        print("{}\t{}\t{}\t{}".format(file, pattern, name, kind))

tags_file = sys.argv[1]
search_expression = sys.argv[2]
main(tags_file, search_expression)
