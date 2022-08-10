import sys
'''
rrplace
Used for replacing the nth appereance of a substring on a string
s: origin String
old: matching string to replace
new: string to replace the old string with
ocurrence: selects the occurrence for the matching string
'''
def rreplace(s,old,new,occurrence):
    li = s.rsplit(old, occurrence)
    return new.join(li)
'''
The next code bit is used to open the desired file and replacing a substring with the content of another file.
'''

oldFile = open(sys.argv[1], "r")
oldFileContent = oldFile.read()
oldFile.close()

contentFile = open(sys.argv[2], "r")
contentFilecontent = contentFile.read()

result = rreplace(oldFileContent, 'exit 0', contentFilecontent,1)

destinationFile = open(sys.argv[1], "w")
destinationFile.seek(0)
destinationFile.write(result)
destinationFile.truncate()
destinationFile.close()
