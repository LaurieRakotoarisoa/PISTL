"""

Module for translating a statement in pseudo-language to a temporal logic statement

"""
import nltk
import sys
import evaluation
import os
import re
from pathlib import Path

from nltk import WordPunctTokenizer
from nltk.tree import *

#definition of the grammar for parsing the tokens
# add a log
grm = """
  S -> COND COMMA RES | COND RES | ACTION | RES COND
  COND -> WHEN ACTION | IF ACTION | DO ACTION 
  RES -> ACTION | THEN ACTION | DO ACTION | DO ACTION WITHIN TIME | DO ACTION WITHIN TIME AFTER | WHEN ACTION
  ACTION -> NP VP | NP VP OP_L ACTION | VP OP_L ACTION | NP OP_L ACTION | VP | NP 
  OP_L -> AND | OR | WRB | IF
  NP -> NOMS | DT NOMS PP | DT ADVERBS ADJECTIVES NOMS | DT ADJECTIVES NOMS  | ADJECTIVES NOMS | DT NOMS |  DT NOMS GERUND 
  VP -> VERB VBN | VERB CO | VERB VBN CO | MODAL VB | MODAL VB VBN | MODAL VB VBN CO | VERB VB CO | MODAL | VERB 
  VERB -> VB | VBZ | VBP | VBZ NOT | VBP NOT  | VB NOT | NOM | ADVERBS VB | VB ADVERBS | ADVERBS VBZ | VBZ ADVERBS | ADVERBS VBP | VBP ADVERBS | ADVERBS VBZ NOT | ADVERBS VBP NOT | ADVERBS VB NOT | ADVERBS  NOM | VBZ NOT ADVERBS|  VBP NOT ADVERBS | VB NOT  ADVERBS| NOM ADVERBS | DO NOT | MODAL VB
  MODAL -> MD | MD NOT | MD ADVERBS | ADVERBS MD |  MD NOT ADVERBS | ADVERBS MD NOT 
  CO -> COD | PP 
  COD -> ADJECTIVES | ADJECTIVES PP | NP | NP PP  | VP 
  PP -> P NP | P | P VP
  P -> TO | IN 
  ADJECTIVES -> JJ ADJECTIVES | JJ | MC | COMP | JJS
  COMP -> JJR IN
  ADVERBS -> RB ADVERB | RB
  NOMS -> NOM NOMS | NOM | MC 
  NOM -> NN | NNS | NNP | NNPS | CD | VBD
  MC -> NOMS HYPHEN NOMS | ADJECTIVES HYPHEN NOMS | NOMS OP NOMS
  GERUND -> VBG | VBG CO
  COMMA -> ','
  HYPHEN -> '-'
  OP -> '+'
  TIME -> CD NNS
  AFTER -> AFTERWARDS ACTION \n"""

def purge(statement):
    """
        Remove unnecessary punctuation characters in a statement that may induce confusion for the NLTK tool
        and return the result.
        
    Parameters
    ----------
        statement : str ->  Statement to purge 
    """

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

def negation(statement):
    """
        Reformulate a statement without contraction of negative verbs and return the result.
        
    Parameters
    ----------
        statement : str -> Statement that may contain negative verbs contracted
    """
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

def tokenize(statement):
    """ 
        Tokenize a statement using NLTK tokenizer and return the result.

    Parameters
    ----------
        statement : str -> Statement to tokenize

    """
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(statement)
    return tokens

def add_elem(d,tags):
    """
        Add a word as a terminal symbol to a dictionary in their corresponding labels
        and return the updated dictionary
    
    Parameters
    ----------
        d : dict -> dictionary indexed by labels associated 
                    with a list of its corresponding terminal symbols

        tags : list of tuple -> 2-tuples containing a word and its corresponding label
        
    """
    
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
        elif w == 'do' or w == 'Do' or w == 'DO':
            d['DO'] = [w]   
        elif w == 'within':
            d['WITHIN'] = [w]
        elif w == 'afterwards':
            d['AFTERWARDS'] = [w]
        elif w == 'When' or w == 'when' or w == 'WHEN':
            d['WHEN'] = [w]
        elif t not in d:   
            if t.isalpha():
                d[t] = [w]
        else:
            if w not in d[t]:
                d[t].append(w)
    return d

def add_rule(tag,dico):
    """
        Add a line of rules to the grammar for a specific label.
    
    Parameters
    ----------
        tag : str -> label which will have new rules in the grammar

        dico : dict -> dictionary containing all labels and its corresponding terminal symbols
    """
    if len(dico[tag]) > 0:
        res = tag+" -> "
        for n in dico[tag]:
            res+="""'"""+n+"""'"""+"| "
        return res[:-2]+"\n"
    else:
        return ""
 
def add_all_rules(dico):
    """
        Create a string containing the set of rules of all terminal symbols, previously found in a statement and stored in a dictionary, and return it.
    
    Parameters
    ----------
        dico : dict -> dictionary containing all labels 
                        and their corresponding terminal symbols
    """
    res =""
    for t in dico:
        res+=add_rule(t,dico)
    return res

#generate the parse tree
def parse(dico,tokens):
    """
        Generate a parse tree from the grammar `grm` after adding terminal symbols. 

    Parameters
    ----------
        dico : dict -> dictionary containing all labels 
                        and their corresponding terminal symbols
        tokens : list of str -> tokens generated from a statement to be translated
    
    """
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
            #tree.draw() 
            print(tree)
            return tree
        except:
            print("Issue with parsing")
      


    # returning the parse tree
    return trees

def process_statement(statement):
    """ 
        Translate a statement into a logic formula and return the result.

    Parameters
    ----------
        statement : str -> statement to translate

    """

    if statement != '' :

                # create a dictionary used to construct the grammar 
                dico = dict()

                # lexical analysis
                pure_statement = purge(statement)
            
                tokens = tokenize(pure_statement)

                # syntax analysis
                tree = parse(dico,tokens)
                
                # semantic analysis
                try:
                    formula = evaluation.evaluate(tree) 
                    # printing result
                    print('|SUCCESS| '+pure_statement+'\n\t'+formula+'\n')
                    return formula
                except:
                    print(" |ERROR| Pattern statement is not recognized for :\n\t"+pure_statement)
                

                
                

                

def process_file(filename):
    """ 
        Translate each statement from a file into logic formulas and store them into a new file.

    Parameters
    ----------
        filename : str -> name of the file containing statements

    """
    if os.path.isfile(filename):
        contents = Path(filename).read_text()
        statements = re.split(';\n*',contents)
        myfile = open("translation_"+filename,'w')
        formula = ''

        for statement in statements:
            try:
                translation = process_statement(statement)
                formula+= 'STATEMENT : '+statement
                formula += 'RESULT : '+translation+'\n\n'
            except:
                formula+='\nERROR'

        myfile.write(formula)
        myfile.close()
    else:
        print("Le fichier ",filename," n'existe pas")



def main(argv):
    #read set of examples
    if len(argv) == 1:
        try:
            statement = input(" Write a statement\n ")
            process_statement(statement)
        except KeyboardInterrupt:
            print("User interruption")  
    elif len(argv) == 3:
        if argv[1] == '-f':
            process_file(argv[2])
        elif argv[1] == '-s':
            process_statement(argv[2])
    else:
        print("erreur")



main(sys.argv)
