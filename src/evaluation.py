import nltk
import sys
from nltk.tree import *

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
            logic_formula += evaluate_cond(tree[i])
        elif child_label == 'COMMA':
            pass
        elif child_label == 'RES':
            logic_formula += evaluate_res(tree[i])
        else :
            print('Label doesn\'t match with any TOKEN in S. Exiting program')
            sys.exit()

        #incrementing
        i = i+1

    return logic_formula
    
# Evaluate from COND(<-> Condition) Node
def evaluate_cond(tree):
    cond = ""
    i = 0  
    children_size = len(tree)
    current_node_label = tree.label()
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'WRB':
            cond +='AG '
        elif child_label == 'IF':
            cond +='AG'
        elif child_label == 'ACTION':
            cond += "("+evaluate_action(tree[i])
        else :
            print('Label doesn\'t match with any TOKEN in COND. Exiting program')
            sys.exit()
        i = i+1
    return cond

# Evaluate from RES(<-> Condition) Node
def evaluate_res(tree):
    res = " -> "
    i = 0  
    children_size = len(tree)
    current_node_label = tree.label()
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'ACTION':
            res += evaluate_action(tree[i])+")"
        elif child_label == 'THEN':
            pass
        else :
            print('Label doesn\'t match with any TOKEN in RES. Exiting program')
            sys.exit()
        i = i+1
    return res

def evaluate_action(tree):
    action = ""
    i = 0  
    children_size = len(tree)
    current_node_label = tree.label()
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'NP':
            action += evaluate_np(tree[i])
        elif child_label == 'VP':
            action += evaluate_vp(tree[i])
        elif child_label == 'AND':
            action += " && "
        elif child_label == 'OR':
            action += " || "
        elif child_label == 'ACTION':
            action += evaluate_action(tree[i])
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in ACTION. Exiting program')
            sys.exit()
        i = i+1
    return action


def evaluate_np(tree):
    np = ""
    i = 0  
    children_size = len(tree)
    current_node_label = tree.label()
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'DT':
            pass
        elif child_label == 'NOMS':
            np += evaluate_noms(tree[i])
        elif child_label == 'PP':
            pass
           # np += evaluate_pp(tree[i])
        elif child_label == 'ADJECTIVES':
            pass
           # np += evaluate_adjectives(tree[i])
        elif child_label == 'ADVERBS':
            pass
           # np += evaluate_adverbs(tree[i])
        elif child_label == 'GERUND':
            pass
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in NP. Exiting program')
            sys.exit()
        i = i+1
    return np

def evaluate_vp(tree):
    vp = ""
    i = 0  
    children_size = len(tree)
    current_node_label = tree.label()
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'VERB':
            vp += evaluate_verb(tree[i])      
        elif child_label == 'VBN':
            l = tree[i].leaves()
            for vbn in l:
             vp += vbn
        elif child_label == 'CO':
            pass
        elif child_label == 'VB':
            pass
        elif child_label == 'MODAL':
            pass
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in VP. Exiting program')
            sys.exit()
        i = i+1
    return vp

def evaluate_noms(tree):
    noms = ""
    i = 0  
    children_size = len(tree)
    current_node_label = tree.label()
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'NOM':
            noms +=  evaluate_nom(tree[i])
        elif child_label == 'NOMS':
            noms += evaluate_noms(tree[i])
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in NOMS. Exiting program')
            sys.exit()
        i = i+1
    return noms

def evaluate_nom(tree):
    nom = ""
    i = 0  
    children_size = len(tree)
    current_node_label = tree.label()
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'NN' or child_label == 'NNS'or child_label == 'NNP'or child_label == 'NNPS' :
            l = tree[i].leaves()
            for n in l:
             nom += n  
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in NOM. Exiting program')
            sys.exit()
        i = i+1
    return nom

def evaluate_verb(tree):
    verb = ""
    i = 0  
    children_size = len(tree)
    current_node_label = tree.label()
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'VB' or child_label == 'VBZ' or child_label == 'VBP' :
            l = tree[i].leaves()
            for v in l:
                if v != 'is':
                    verb += v
        elif child_label == 'NOT':
            verb = '!'+verb
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in VERB. Exiting program')
            sys.exit()
        i = i+1
    return verb
