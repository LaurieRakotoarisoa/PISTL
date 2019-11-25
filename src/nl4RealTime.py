import nltk
import sys

from nltk import WordPunctTokenizer
from nltk.tree import *

#definition of the grammar for parsing the tokens 
grm = """
  S -> COND COMMA RES | COND RES
  COND -> WRB ACTION | IN ACTION
  RES -> ACTION | RB ACTION
  ACTION -> NP VP
  NP -> DT NOMS PP | DT RBS JJS NOMS | DT JJS NOMS | DT NOMS | NOMS  
  VP -> VERB VBN | VERB CO | VERB VBN CO | MODAL VB | MODAL VB VBN | MODAL VB VBN CO | VERB VB CO | MODAL
  VERB -> VBZ | VBP | VBZ NOT | VBP NOT 
  MODAL -> MD | MD NOT
  CO -> COD | COI
  COD -> JJ | JJ PP | NP
  COI -> PP
  PP -> P NP | P
  P -> TO | IN
  JJS -> JJ JJS | JJ 
  RBS -> RB RBS | RB
  NOMS -> NOM NOMS | NOM
  NOM -> NN | NNS | NNP | NNPS 
  COMMA -> ',' \n"""

# remove unneccessary characters in the statement such as '.', '-' that may induce confusion to the nltk tool
def purge(statement):

    # remove hyphen
    remove_hyphen = statement.split('-')
    no_hyphen = ''.join(remove_hyphen)

    # remove dot
    remove_dot = no_hyphen.split('.')
    no_dot = ''.join(remove_dot)

    # remove contraction of negative form
    no_contraction = negation(no_dot)
    
    # remove apostrophe
    remove_apostrophe =  no_contraction.split('\'')
    no_apostrophe = ''.join(remove_apostrophe)

    # return result
    ret = no_apostrophe
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

#return the position of the comma character ',' if it exists
def get_comma_position(tokens):
    c=-1
    for i in range(0,len(tokens)-1):
        if(tokens[i] == ','):
            c = i
            break
    return c

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
            tree.draw() 
            return tree
        except:
            print("Issue with parsing")
      


    # returning the parse tree
    return trees

# Evaluate from S (<-> Start) Node
def evaluate(tree):
    # the to-be result
    logic_formula = ""

    # a field for counting
    i = 0

    # number of children node -- be careful, do not mix up with subtrees  
    children_size = len(tree)

    # get the label of the current node
    current_node_label = tree.label()

    # begin the evaluation of all children from left to right (it is the right order)
    while i < children_size:
        # get the i-th child's label
        child_label = tree[i].label() 

        # test
        # print(child_label)

        # match the label an existing TOKEN or it doesn't exist
        if child_label == 'COND':
            print('c')
        elif child_label == 'COMMA':
            print(',')
        elif child_label == 'RES':
            print('r')
        else :
            print('Label doesn\'t match with TOKEN. Exiting program')
            sys.exit()

        #incrementing
        i = i+1

    return logic_formula
    

#set of examples for unit testing
example = {
    "1" : "When an error message is displayed the only available user action is acknowledgement via the 'ok' button",
    "2" : "When the cancel button on the identify traveler screen is pressed control returns to the main menu screen" ,
    "3" : "When a match is found all fields are filled in",
    "4" : "When a connection is made to the POP server, mail will be transferred to the local machine",
    "5" : "When the name of a mailbox is double-clicked, that mailbox will be opened.",
    "6" : "If users don't load data, then the information window won't pop-up",
}

# FOR TESTING ONLY : function that determines the pos_tags given by nltk.pos_tag
def test_get_pos_tag(statement):
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(statement)
    tags = nltk.pos_tag(tokens)   
    print(tags)


def main(argv):

    # get the statement to parse
    statement = example.get(str(argv[1]))
    
    # create dictionnary used for constructing the grammar 
    dico = dict()

    # lexical analysis
    pure_statement = purge(statement)
    tokens = tokenize(pure_statement)

    # syntax analysis
    tree = parse(dico,tokens)
    
    # semantic analysis
    evaluate(tree) 



    
 #   except:
 #       print("usage : python nl4rRealTime.py test_number\n ex : python nl4RealTime.py 5\n test_number range from 1 to 6")
 #       sys.exit()



main(sys.argv)
#test_get_pos_tag(example.get("6")) 
#negation(example.get("6")) 
