import nltk
import sys

from nltk import WordPunctTokenizer

#definition of the grammar for parsing the tokens 
grm = """
  S -> COND COMMA RES | COND RES
  COND -> WRB NP VP 
  RES -> NP VP
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
  NOM -> NN | NNS | NNP | NNPS 
  COMMA -> ',' \n"""

#remove unneccessary characters in the sentence such as '.', '-' that may induce confusion to the nltk tool
def purge(sentence):
    remove_hyphen = sentence.split('-')
    no_hyphen = ''.join(remove_hyphen)
    remove_dot = no_hyphen.split('.')
    no_dot = ''.join(remove_dot)
    remove_apostrophe =  no_dot.split('\'')
    no_apostrophe = ''.join(remove_apostrophe)
    ret = no_apostrophe
    return ret

#return the position of the comma character ',' if it exists
def get_comma_position(tokens):
    c=-1
    for i in range(0,len(tokens)-1):
        if(tokens[i] == ','):
            c = i
            break
    return c

#tokenize the sentence
def tokenize(sentence):
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(sentence)
    return tokens

# add an word as an terminal symbol to the dictionnary in their rightful labels
def add_elem(d,tags):
    for (w,t) in tags:
        if t not in d:   
            if t.isalpha():
                d[t] = [w]
        else:
            if w not in d[t]:
                d[t].append(w)
    return d

#add a line of rules to the grammar for a specific label 
def add_rule(tag,dico):
    if len(dico[tag]) > 0:
        res = tag+" -> "
        for n in dico[tag]:
            res+="""'"""+n+"""'"""+"| "
        return res[:-2]+"\n"
    else:
        return ""

#create a string containing the set of rules of all terminal symbols we found in the sentence 
def add_all_rules(dico):
    res =""
    for t in dico:
        res+=add_rule(t,dico)
    return res

#generate the parse tree
def parse(dico,tokens):
    tags = nltk.pos_tag(tokens)   
    dico = add_elem(dico,tags)

    # first we add all the terminals symbols to the grammar
    grammar = nltk.CFG.fromstring(grm+add_all_rules(dico))
     # then we execute a bottom up parsing 
    rd_parser = nltk.BottomUpChartParser(grammar)

    for tree in rd_parser.parse(tokens):
        tree.draw() 
        

#set of examples for unit testing
example = {
    "1" :  "When an error message is displayed the only available user action is acknowledgement via the 'ok' button",
    "2" :  "When the cancel button on the identify traveler screen is pressed control returns to the main menu screen" ,
    "3" :  "When a match is found all fields are filled in",
    "4" : "When a connection is made to the POP server, mail will be transferred to the local machine",
    "5" : "When the name of a mailbox is double-clicked, that mailbox will be opened.",
}

def main(argv):
    try:
        sentence = example.get(str(argv[1]))

        #create dict 
        dico = dict()

        #lexical analysis
        pure_sentence = purge(sentence)
        tokens = tokenize(pure_sentence)

        #syntax analysis
        parse(dico,tokens)
    
    except:
        print("usage : python nl4rRealtime.py test_number\n ex : python test_nltk 5\n test_number range from 1 to 5")
        sys.exit()

main(sys.argv)