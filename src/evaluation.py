import nltk
import sys
from nltk.tree import *

negation = False

when = False

if_only = False

is_equal = False

# Evaluate from S (<-> Start) Node
def evaluate(tree):
    # the to-be result   
    logic_formula = ""

    # a field for counting
    i = 0

    # number of children node -- be careful, do not mix up with subtrees  
    children_size = len(tree)

    #current_node_label = tree.label()
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
        elif child_label == 'ACTION':
            logic_formula += evaluate_action(tree[i])
        else :
            print('Label doesn\'t match with any TOKEN in S. Exiting program')
            sys.exit()

        #incrementing
        i = i+1


    global if_only
    if if_only == True:
        tmp1 = logic_formula.split("->")[0]
        tmp2 = logic_formula.split('->')[1]
        logic_formula = tmp2 + " -> " + tmp1
        if_only = False      

    global when
    if when == True:
        logic_formula = "AG("+logic_formula+")"
        when = False

    return logic_formula.replace('.)',')').replace('.=','=').replace('. ',' ').replace(' .',' ')
    
    
# Evaluate from COND(<-> Condition) Node
def evaluate_cond(tree):
    cond = ""
    i = 0  
    global when
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'WRB':
            when = True
        elif child_label == 'IF':
            when = True
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
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'NP':
            action += evaluate_np(tree[i])
        elif child_label == 'VP':
            action += evaluate_vp(tree[i])
        elif child_label == 'ACTION':
            action += evaluate_action(tree[i])
        elif child_label == 'OP_L' : 
            action += evaluate_op_l(tree[i])
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in ACTION. Exiting program')
            sys.exit()
        i = i+1

    global negation
    if negation == True:
        action = "!("+action+")"
        negation = False
    


    return action

def evaluate_op_l(tree):
    op = ""
    i = 0
    global when
    global if_only
    children_size = len (tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'AND':
           op += " && "
        elif child_label == 'OR':
            op += " || "
        elif child_label == 'WRB':
            l = tree[i].leaves()
            for w in l :
                if w == 'whenever' or w == 'when ':
                    when = True
                    op += " -> "
        elif child_label == 'IF':
            l = tree[i].leaves()
            when = True
            if_only = True
            op += " -> "
                    
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in OP_L. Exiting program')
            sys.exit()
        i = i+1
    return op


def evaluate_np(tree):
    np = ""
    i = 0  
    all = False
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'DT':
            l = tree[i].leaves()
            for dt in l :
                if dt == 'all':
                    all = True
                    np = 'A(' + np
        elif child_label == 'NOMS':
            np += evaluate_noms(tree[i])
        elif child_label == 'PP':
             np += evaluate_pp(tree[i])
        elif child_label == 'ADJECTIVES':
            np += evaluate_adjectives(tree[i])
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
    
    if all :
        np += ")"
    return np

def evaluate_vp(tree):
    vp = ""
    i = 0  
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'VERB':
            vp += evaluate_verb(tree[i])      
        elif child_label == 'VBN':
            l = tree[i].leaves()
            for vbn in l:
             vp += vbn
        elif child_label == 'CO':
            vp += evaluate_co(tree[i])
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
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'NOM':
            noms +=  evaluate_nom(tree[i])
        elif child_label == 'NOMS':
            noms += evaluate_noms(tree[i])
        elif child_label == "MC" :
            noms += evaluate_mc(tree[i]) 
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
    arr_nom = ['NN','NNS','NNP','NNPS','CD']
    while i < children_size:
        child_label = tree[i].label()
        if child_label in arr_nom:
            l = tree[i].leaves()
            for n in l:
             if n == 'equals' :
                nom += " = "
             else :
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
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'VB' or child_label == 'VBZ' or child_label == 'VBP' :
            l = tree[i].leaves()
            for v in l:
                if v == 'is' or v == 'does':
                    verb += "."
                else:         
                    verb += v        
        elif child_label == 'NOM':
            verb += evaluate_nom(tree[i])        
        elif child_label == 'NOT':
           global negation
           negation = True
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in VERB. Exiting program')
            sys.exit()
        i = i+1
    return verb

def evaluate_co(tree):
    co = ""
    i = 0  
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'COD' :
            co += evaluate_cod(tree[i])
        elif child_label == 'PP':
            co += evaluate_pp(tree[i])
        else :
            print('Label'+ tree[i].label() +'doesn\'t match with any TOKEN in CO. Exiting program')
            sys.exit()
        i = i+1
    return co

def evaluate_cod(tree):
    cod = ""
    i = 0  
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'ADJECTIVES' :
            adj = evaluate_adjectives(tree[i])
            if adj == "f" :
                global negation
                negation = True
            elif adj == "t":
                pass
            else:
                cod = cod + " " + adj
        elif child_label == 'PP':
            cod += evaluate_pp(tree[i])
        elif child_label == 'NP':
            cod += evaluate_np(tree[i])
        elif child_label == 'VP':
            cod += evaluate_vp(tree[i])
        else :
            print('Label'+ tree[i].label() +'doesn\'t match with any TOKEN in COD. Exiting program')
            sys.exit()
        i = i+1
    return cod

def evaluate_adjectives(tree):
    adj = ""
    i = 0  
    arr_eq = ['equal', 'identical']
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'JJ':
            l = tree[i].leaves()
            for j in l:
             if j == "false":
                 adj += "f"
             elif j == "true":
                 adj += "t"
             elif j in arr_eq:
                 adj += " = "
             else:
                 adj += j  
        elif child_label == 'ADJECTIVES':
            adj += evaluate_adjectives(tree[i])
        elif child_label == 'MC':
            adj += evaluate_mc(tree[i])
        elif child_label == 'COMP':
            adj += evaluate_comp(tree[i])
        elif child_label == 'JJS':
            pass
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in ADJECTIVES. Exiting program')
            sys.exit()
        i = i+1
    return adj

def evaluate_pp(tree):
    pp = ""
    i = 0  
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'P':
            pp += evaluate_p(tree[i])
        elif child_label == 'NP':
            pp += evaluate_np(tree[i])
        elif child_label == 'VP':
            pp += evaluate_vp(tree[i])
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in PP. Exiting program')
            sys.exit()
        i = i+1
    return pp


def evaluate_p(tree):
    p = ""
    i = 0  
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'TO':
            p = "."  
        elif child_label == 'IN':
            l = tree[i].leaves()
            for w in l:
             if w == 'until' or w == 'unless':
                p = "U"
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in P. Exiting program')
            sys.exit()
        i = i+1
    return p


def evaluate_mc(tree):
    mc = ""
    i = 0  
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'NOMS':
            mc += evaluate_noms(tree[i])
        elif child_label == 'ADJECTIVES':
            mc += evaluate_adjectives(tree[i])
        elif child_label == 'HYPHEN' :
            mc += '-'
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in MC. Exiting program')
            sys.exit()
        i = i+1
    return mc

def evaluate_comp(tree):
    comp = ""
    i = 0  
    children_size = len(tree)

    arr_sup = ['bigger','greater','large','larger','superior','more']
    arr_inf = ['smaller','inferior','less']

    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'JJR':
            l = tree[i].leaves()
            for p in l:
             if p in arr_sup:
                comp = " > "
             elif p in arr_inf:
                comp = " < "
        elif child_label == 'IN':
            pass
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in MC. Exiting program')
            sys.exit()
        i = i+1
    return comp

