import qrcode
"""from pyzbar.pyzbar import decode
from PIL import Image"""

myqr=qrcode.make("https://www.youtube.com/watch?v=PyDn2gU9DJo&t=40s")
#myqr1=qrcode.make("https://www.simplilearn.com/?utm_source=bing&utm_medium=cpc&utm_term=simplilearn&utm_content=392503905-1320514564874663-&utm_device=c&utm_campaign=B-Search-Brand-Exact-IN-AllDevice-adgroup-Brand-Simplilearn&msclkid=dfa8227894d8151879ed44932df7a38c")
myqr.save("myqr.png")
#myqr1.save("myqr1.png")

"""b=decode (Image.open("myqr.png"))
print(b[0].data.decode("ascii"))"""