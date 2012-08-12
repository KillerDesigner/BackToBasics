

class Tokenizer {
    def article = new URL('http://apply.embed.ly/static/data/2.html').getText()
      
    def iter = article.iterator()
    def getNextToken() {
        def c = '', current = ''
        def inTag = false
        while ( iter.hasNext()) { 
              c = iter.next()
              if(c == '>')      return current
              else if(c == '<') inTag = true
              else if(inTag)    current += c
          }
      }
 }
 
def list = new ArrayList()
def tok = new Tokenizer()
def processToken
processToken = { level, tag ->
    list << ["tag":tag, "level": level]
    def nextToken = tok.getNextToken()
    while(nextToken != null) {
        if(nextToken.startsWith('/')) {
            return
        } else if(nextToken.endsWith('/')) {
            list << ["tag":nextToken, "level": level+1]
        } else {
            processToken(level+1, nextToken)
        } 
        nextToken = tok.getNextToken()
     } 
}


processToken(0, tok.getNextToken())
def plist = list.findAll{ it.tag == 'p' }
def sum = plist.collect {it.level}.sum()
def avg = sum/plist.size()
def num = plist.collect{ Math.pow((avg - it.level),2) }.sum() / plist.size()
println Math.sqrt(num)





