import nltk
import sys
import evaluation
from pathlib import Path

from nltk import WordPunctTokenizer
from nltk.tree import *

#definition of the grammar for parsing the tokens 
grm = """
  S -> COND COMMA RES | COND RES | ACTION
  COND -> WRB ACTION | IF ACTION
  RES -> ACTION | THEN ACTION
  ACTION -> NP VP | NP VP OP_L ACTION | VP OP_L ACTION | NP OP_L ACTION | VP | NP 
  OP_L -> AND | OR | WRB | IF
  NP -> NOMS | DT NOMS PP | DT ADVERBS ADJECTIVES NOMS | DT ADJECTIVES NOMS  | ADJECTIVES NOMS | DT NOMS |  DT NOMS GERUND 
  VP -> VERB VBN | VERB CO | VERB VBN CO | MODAL VB | MODAL VB VBN | MODAL VB VBN CO | VERB VB CO | MODAL | VERB 
  VERB -> VB | VBZ | VBP | VBZ NOT | VBP NOT  | VB NOT | NOM | ADVERBS VB | VB ADVERBS | ADVERBS VBZ | VBZ ADVERBS | ADVERBS VBP | VBP ADVERBS | ADVERBS VBZ NOT | ADVERBS VBP NOT | ADVERBS VB NOT | ADVERBS  NOM | VBZ NOT ADVERBS|  VBP NOT ADVERBS | VB NOT  ADVERBS| NOM ADVERBS
  MODAL -> MD | MD NOT | MD ADVERBS | ADVERBS MD |  MD NOT ADVERBS | ADVERBS MD NOT 
  CO -> COD | PP 
  COD -> ADJECTIVES | ADJECTIVES PP | NP | NP PP  | VP 
  PP -> P NP | P | P VP
  P -> TO | IN 
  ADJECTIVES -> JJ ADJECTIVES | JJ | MC | COMP | JJS
  COMP -> JJR IN
  ADVERBS -> RB ADVERB | RB
  NOMS -> NOM NOMS | NOM | MC
  NOM -> NN | NNS | NNP | NNPS | CD 
  MC -> NOMS HYPHEN NOMS | ADJECTIVES HYPHEN NOMS
  GERUND -> VBG | VBG CO
  COMMA -> ','
  HYPHEN -> '-' \n"""

# remove unneccessary characters in the statement such as '.', '-' that may induce confusion to the nltk tool
def purge(statement):

    # remove hyphen
   # remove_hyphen = statement.split('-')
   # no_hyphen = ''.join(remove_hyphen)

    # remove dot
    remove_dot = statement.split('.')
    no_dot = ''.join(remove_dot)

    # remove contraction of negative form
    no_contraction = negation(no_dot)
    
    # remove apostrophe
    remove_apostrophe =  no_contraction.split('\'')
    no_apostrophe = ''.join(remove_apostrophe)

    # remove end of line
    remove_eol =  no_apostrophe.split('\n''')
    no_eol = ''.join(remove_eol)

    # return result
    ret = no_eol
    return ret

# reformulate the statement without contraction of a negative verb
def negation(statement):
    list =  statement.split(' ')
    new_list = []
    for w in list:
        if 'won\'t' == w:
            new_list.append('will')
            new_list.append('not')
        elif 'n\'t' in w:
            new_list.append(w[0:-3])
            new_list.append('not')
        else:
            new_list.append(w)
    s = ""
    for w in new_list:
        s+= w+" "

    return s

#tokenize the statement
def tokenize(statement):
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(statement)
    return tokens

# add an word as an terminal symbol to the dictionnary in their rightful labels
def add_elem(d,tags):
    for (w,t) in tags:
        if w == 'not':
            d['NOT'] =[w]
        elif w == 'If' or w == 'if' or w == 'IF':
            d['IF'] =[w]
        elif w == 'then' or w == 'Then' or w == 'THEN':
            d['THEN'] =[w]    
        elif w == 'Or' or w == 'or' or w == 'OR':
            d['OR'] =[w]
        elif w == 'And' or w == 'and' or w == 'AND':
            d['AND'] =[w]     
        elif t not in d:   
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

#create a string containing the set of rules of all terminal symbols we found in the statement 
def add_all_rules(dico):
    res =""
    for t in dico:
        res+=add_rule(t,dico)
    return res

#generate the parse tree
def parse(dico,tokens):
    tags = nltk.pos_tag(tokens)   
    dico = add_elem(dico,tags)

    #print(dico)

    # first we add all the terminals symbols to the grammar
    grammar = nltk.CFG.fromstring(grm+add_all_rules(dico))
     # then we execute a bottom up parsing 
    rd_parser = nltk.BottomUpChartParser(grammar)

    # storing the parse tree generated
    trees = rd_parser.parse(tokens)

    # displaying the parse tree generated
    #there is a for loop but it only contains one tree, hence we return the tree in the for loop
    for tree in trees:
        try:
            #tree.draw() 
            return tree
        except:
            print("Issue with parsing")
      


    # returning the parse tree
    return trees

#set of examples for unit testing
#example = {
#    "1" : "When an error message is displayed or the message is on screen the only available user action is acknowledgement via the 'ok' button",
#    "2" : "When the cancel button on the identify traveler screen is pressed control returns to the main menu screen" ,
#    "3" : "When a match is found all fields are filled in",
#    "4" : "When a connection is made to the POP server, mail will be transferred to the local machine",
#    "5" : "When the name of a mailbox is double-clicked, that mailbox will be opened.",
#    "6" : "When a connection is not made to the server, report an error and reset network component to initial state.",
#}

# FOR TESTING ONLY : function that determines the pos_tags given by nltk.pos_tag
def test_get_pos_tag(statement):
    print(statement)
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(statement)
    tags = nltk.pos_tag(tokens)   
    print(tags)


def main(argv):

    #read set of examples
    contents = Path("exemple.txt").read_text()
    statements = contents.split(';')
    print("\n")
    
    for statement in statements:
        
        if statement != '' :
            # get the statement to parse
            #statement = example.get(str(argv[1]))


            #test_get_pos_tag(statement)
            
            # create dictionnary used for constructing the grammar 
            dico = dict()

            # lexical analysis
            pure_statement = purge(statement)
           
            tokens = tokenize(pure_statement)

            # syntax analysis
            tree = parse(dico,tokens)
            
            # semantic analysis
            formula = evaluation.evaluate(tree) 

            # printing result
            print(pure_statement+'\n'+formula+'\n')


    
 #   except:
 #       print("usage : python nl4rRealTime.py test_number\n ex : python nl4RealTime.py 5\n test_number range from 1 to 6")
 #       sys.exit()



main(sys.argv)
#test_get_pos_tag(example.get("6")) 
#negation(example.get("6")) 
