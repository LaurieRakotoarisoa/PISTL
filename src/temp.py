import nltk

from pathlib import Path
from nltk import WordPunctTokenizer
from nltk.tree import *

comparateur = { 'less' : '<',
                'less or equal' : '<=',
                'greater' : '>',
                'greater or equal' : '>=' }

grm2 = """
    ENONCE -> CONJONCTION | COMPARAISON | EGALITE  | NOM | IFSTATEMENT
    CONJONCTION -> ENONCE 'and' ENONCE
    COMPARAISON -> NOM 'is' COMPARATEUR 'than' NOM 
    EGALITE -> ENONCE 'is' BOOLEAN | ENONCE 'is' CD 
    IFSTATEMENT -> ENONCE 'if' ENONCE
    COMPARATEUR -> 'less' | 'greater'
    NOM -> NP | NNP | NN
    BOOLEAN -> 'true' | 'false' \n
        """

def tokenize(sentence):
    tokenizer = WordPunctTokenizer()
    tokens = tokenizer.tokenize(sentence)
    return tokens

def evaluate(tree):
    if(tree.label() == 'ENONCE'):
        return evaluate(tree[0])
    elif tree.label() == 'CONJONCTION':
        return evaluate(tree[0])+' & '+evaluate(tree[2])
    elif tree.label() == 'COMPARAISON':
        return evaluate(tree[0])+' '+comparateur[tree[2][0]]+' '+evaluate(tree[4])
    elif tree.label() == 'EGALITE':
        if tree[2].label() == 'BOOLEAN':
            resultat =""
            if tree[2][0] == 'false':
                resultat+='!'
            return resultat+evaluate(tree[0])
        else:
            return evaluate(tree[0])+' = '+tree[2][0]
    elif tree.label() == 'IFSTATEMENT':
        return evaluate(tree[2])+' -> '+evaluate(tree[0])
    elif tree.label() == 'NOM':
        return tree[0][0]

def process(statement):
    tokens = tokenize(statement)
    grmToAdd = get_terminal_grammar(get_tags(tokens))
    newGrm = update_grammar(grm2,grmToAdd)
    newGrm = nltk.CFG.fromstring(newGrm)
    parser = nltk.BottomUpChartParser(newGrm)
    sentence = statement.split()
    
    for t in parser.parse(sentence):
        print(evaluate(t))
        


def get_tags(tokens):
    return nltk.pos_tag(tokens)

def get_terminal_grammar(tokens_tagged):
    grammar = ""
    for (token,tag) in tokens_tagged:
        elem  = tag+" -> '"+token+"'\n"
        grammar+=elem
    return grammar

def update_grammar(oldGrm,addedGrammar):
    return oldGrm+addedGrammar
    

def main():
    contents = Path("simpleExamples").read_text()
    statements = contents.split('.')

    for s in statements :
        process(s)

main()