import nltk
from nltk import WordPunctTokenizer

dico = dict()

def add_elem(d, phrase):
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(phrase)
    tags = nltk.pos_tag(tokens)   

    for (m,t) in tags:
        if t not in d:
            if t.isalpha():
                d[t] = [m]
        else:
            if m not in d[t]:
                d[t].append(m)
    return d

phrase = "When an error message is displayed the only available user action is acknowledgement via the ok button"
phrase2 = "When the cancel button on the identify traveler screen is pressed control returns to the main menu screen" 
phrase3 = "When a match is found all fields are filled in"
phrase4 = "When a connection is made to the POP server, mail will be transferred to the local machine "
phrase5 = "When the name of a mailbox is double-clicked, that mailbox will be opened"

dico = add_elem(dico,phrase5)

def add_string(tag,dico):
    if len(dico[tag]) > 0:
        res = tag+" -> "
        for n in dico[tag]:
            res+="""'"""+n+"""'"""+"| "
        return res[:-2]+"\n"
    else:
        return ""

def add_tags(dico):
    res =""
    for t in dico:
        res+=add_string(t,dico)
    return res
 


grm = """
  L -> NP VP
  NP -> DT NOMS PP | DT RBS JJS NOMS | DT JJS NOMS | DT NOMS | NOMS
  VP -> VERB VBN | VERB CO | VERB VBN CO | MD VB | MD VB VBN | MD VB VBN CO
  VERB -> VBZ | VBP 
  COD -> JJ | JJ PP
  CO -> COD | COI
  COI -> PP
  PP -> P NP | P
  P -> TO | IN
  JJS -> JJ JJS | JJ 
  RBS -> RB RBS | RB
  NOMS -> NOM NOMS | NOM
  NOM -> NN | NNS | NNP | NNPS \n"""

grammar1 = nltk.CFG.fromstring("""
     S -> WRB L L | WRB L L\n"""+
  grm+add_tags(dico))

def with_comma(p):
    dico = dict()
    tokens = nltk.word_tokenize(p)
    dico = add_elem(dico,p)
    c = -1
    for i in range(0,len(tokens)-1):
        if(tokens[i] == ','):
            c = i
            break
    
    if c!= -1:
        grammar2 = nltk.CFG.fromstring(grm+add_tags(dico))
        rd_parser = nltk.RecursiveDescentParser(grammar2)
        trees = []
        for tree in rd_parser.parse(tokens[1:c]):
            trees = trees + [tree]
        for tree in rd_parser.parse(tokens[c+1:]):
            trees = trees + [tree]

        tree1 = nltk.Tree('WRB', ['When'])
        tree = nltk.Tree('S',[tree1]+trees)
        tree.draw()



sent = phrase2.split()
rd_parser = nltk.RecursiveDescentParser(grammar1)    
#for tree in rd_parser.parse(sent):
 #   tree.draw() 

with_comma(phrase5)
