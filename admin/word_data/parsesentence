#!/usr/bin/env python

import json
import sys

for fileName in sys.argv[2:]:
    delim = sys.argv[1]
    print (delim)
    with open(fileName) as f:
        sentenceList = {}
        id = 0

        for line in f:
            line = line.strip('\n')
            line = line.split(delim)
            tag = []
            sentence = []

            for word in line:
                if word != '':
                    if word.isdigit():
                        tag.append( int(word) )
                    else:
                        tag.append(0)
                        sentence.append(word)

            sentenceList[id] = {'sentence':sentence, 'tag':tag}
            id += 1

        print (sentenceList)
        json_sentenceList = json.dumps(sentenceList, indent=4)

    fileName = fileName.rsplit('.', maxsplit=1)

    #print (fileName)
    fj = open(fileName[0] + '.json', "w+")
    fj.write(json_sentenceList)
    fj.close()

    #print (json_wordList)
