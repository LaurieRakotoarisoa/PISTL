import nltk
from nltk import WordPunctTokenizer


def recup_NN(phrase):
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(phrase)
    tags = nltk.pos_tag(tokens)
    
    noms = []
    
    for (m,t) in tags:
        if ((t == "NN" or t == "NNS") and m not in noms):
            noms.append(m)
    res = ""
    
    for n in noms:
        res+="""'"""+n+"""'"""+"| "
    return res[:-2]

def recup_JJ(phrase):
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(phrase)
    tags = nltk.pos_tag(tokens)
    
    noms = []
    
    for (m,t) in tags:
        if t == "JJ" and m not in noms:
            noms.append(m)
    res = ""
    
    for n in noms:
        res+="""'"""+n+"""'"""+"| "
    return res[:-2]
    

def recup_VBN(phrase):
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(phrase)
    tags = nltk.pos_tag(tokens)
    
    noms = []
    
    for (m,t) in tags:
        if t == "VBN" and m not in noms:
            noms.append(m)
    res = ""
    
    for n in noms:
        res+="""'"""+n+"""'"""+"| "
    return res[:-2]

def recup_VBZ(phrase):
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(phrase)
    tags = nltk.pos_tag(tokens)
    
    noms = []
    
    for (m,t) in tags:
        if t == "VBZ" and m not in noms:
            noms.append(m)
    res = ""
    
    for n in noms:
        res+="""'"""+n+"""'"""+"| "
    return res[:-2]

phrase = "When the cancel button is pressed control returns to the main menu screen"

 
grammar1 = nltk.CFG.fromstring("""
 
  S -> WRB S S | NP VP
  NP -> Det NNS | Det RBS JJS NNS | Det JJS NNS | PP
  VP -> VBZ VBN | VBZ COD | VBZ VBN COD
  COD ->  PP | JJ | JJ PP
  PP -> P NP | P
  JJS -> JJ JJS | JJ 
  RBS -> RB RBS | RB
  NNS -> NN NNS | NN
  NP2 -> NN NP | RB NP2 |JJ NP2 | JJ
  VBN -> """+recup_VBN(phrase)+
  """\nDet -> 'an' | "the" | "a" | "all"
  WRB -> "When"
  RB ->  "only"
  VBZ -> """+recup_VBZ(phrase)+
  """\nP -> "via" | "on" | "in" | "to"
  """+"""NN -> """+recup_NN(phrase)+
   """\nJJ -> """+recup_JJ(phrase))

sent = phrase.split()
rd_parser = nltk.RecursiveDescentParser(grammar1)    
for tree in rd_parser.parse(sent):
    tree.draw() 