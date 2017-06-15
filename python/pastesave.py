from pastebin import PastebinAPI
x = PastebinAPI()
api_dev_key = "2f91bd58d372bd03629b0658be4c43be"
api_user_key = "4dd674c5b30fa17bf04b46cd6852e34e"
username = "lafelabs"
password = "password"

foo = open("cube.txt", 'r')
textout = foo.read()
foo.close()
url = x.paste(api_dev_key,textout,"hypercube",api_user_key,"text",'unlisted','N')
print url

