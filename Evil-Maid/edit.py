import sys
def rreplace(s,old,new,occurrence):
    li = s.rsplit(old, occurrence)
    return new.join(li)

f = open(sys.argv[1], "r")
content = f.read()
f.close()

f2 = open(sys.argv[2], "r")
content2 = f2.read()

result = rreplace(content, 'exit 0', content2,1)

f1 = open(sys.argv[1], "w")
f1.seek(0)
f1.write(result)
f1.truncate()
f1.close()