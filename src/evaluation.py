"""
Module for evaluating the parse tree

"""

import nltk
import sys
from nltk.tree import *


#global variable 

#check if there's negation
negation = False

#check if there arekeywords referring to 'always' event
always = False

#check  if there's only one 'if' 
if_unary = False

#tricky one : its purpose is to break the ambiguity with 'is' that may be equivalent to 'equals'
is_equal = False
is_cd = False

#check if there's a WHEN ... DO ... CASE
do_exist = False

#check if there's WITHIN
within = False
within_value = "infinity"

#check if there's AFTERWARDS event
afterwards = False
afterwards_value = "infinity"

#check if there are 'all' events
a = False

#check if there are keywords referring to 'F' event (eventually, finally, ultimately)
f = False

#check if there are keywords referring to 'X' event (next)
x = False

#check if there are adverbs before VB for precedence
negationBeforeFinally = False

#check if there is a condition -> only one component
conditionExists = False

#check if the sentence is in form DO....WHEN
isDoWhen = False
doWhen_do = ""

#grammar
arr_nom = ['NN','NNS','NNP','NNPS','CD','VBD']

#logic
arr_sup = ['bigger','greater','large','larger','superior','more']
arr_inf = ['smaller','inferior','less']
arr_eq = ['equal', 'identical']

#temporal
u_arr = ['until','unless']
f_arr = ['eventually','ultimately','finally']
x_arr = ['next']
all_arr = ['all','every']


def apply_temporal_logic(formula):
    """
       Add temporal logic to a given formula according to boolean values which check if an 
       operator was present in the statement
        
    Parameters
    ----------
        statement : formula -> logic formula
    """

    global if_unary
    if if_unary == True:
        tmp1 = formula.split("->")[0]
        tmp2 = formula.split('->')[1]
        if tmp2.endswith(')'):
            tmp2 = tmp2[0:-1]
            tmp1 = tmp1+")"
        formula = tmp2 + " -> " + tmp1
        if_unary = False      

    global always
    if always == True:
        formula = "AG("+formula+")"
        always = False

    formula = apply_finally(formula)

    formula = apply_next(formula)

    return formula

def apply_next(formula):
    """
       Add X operator to a given formula according to its boolean values which check if X
        was present in the statement
        
    Parameters
    ----------
        statement : formula -> logic formula
    """
    global x 
    if x == True:
        formula = "X("+formula+")"
        x= False
    return formula

def apply_finally(formula):
    """
       Add F operator to a given formula according to its boolean values which check if F
        was present in the statement
        
    Parameters
    ----------
        statement : formula -> logic formula
    """
    global f
    if f == True:
        formula = "F("+formula+")"
        f = False
    return formula

def apply_do(formula):
    """
       Add F{...}(...) operator to a given formula according to its boolean values which check if a 
       DO...WHEN was present in the statement
        
    Parameters
    ----------
        statement : formula -> logic formula
    """
    global do_exist
    global within
    global within_value
    if do_exist == True:
        formula = "F{"+within_value+"}("+formula+")"
        do_exist = False
        if within == True:
            within_value = "infinity"
            within = False
    return formula

def apply_negation(formula):
    """
       Add ! operator to a given formula according to its boolean values which check if a negation
        was present in the statement
        
    Parameters
    ----------
        statement : formula -> logic formula
    """
    global negation
    if negation == True:
        formula = "!("+formula+")"
        negation = False
    return formula

def apply_afterwards(formula):
    """
       Add G{...}(...) operator to a given formula according to its boolean values which check if the key word afterwards
        was present in the statement
        
    Parameters
    ----------
        statement : formula -> logic formula
    """
    global afterwards
    global afterwards_value
    if afterwards == True:
        formula = "G{"+afterwards_value+"}("+formula+")"
        afterwards = False
    return formula




def evaluate(tree):
    """
    Evaluate a tree from its starting node : S, and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    # the to-be result   
    logic_formula = ""

    # a field for counting
    i = 0

    # number of children node -- be careful, do not mix up with subtrees  
    children_size = len(tree)

    #current_node_label = tree.label()
    # begin the evaluation of all children from left to right (it is the right order)
    res_set = False
    while i < children_size:
        # get the i-th child's label
        child_label = tree[i].label() 

        # match the label an existing TOKEN or it doesn't exist
        if child_label == 'COND':
            if res_set:
                logic_formula = evaluate_cond(tree[i])+logic_formula
            else:
                logic_formula += evaluate_cond(tree[i])
        elif child_label == 'COMMA':
            pass
        elif child_label == 'RES':
            logic_formula += evaluate_res(tree[i])
            res_set = True
        elif child_label == 'ACTION':
            logic_formula += evaluate_action(tree[i])
        else :
            print('Label doesn\'t match with any TOKEN in S. Exiting program')
            sys.exit()

        #incrementing
        i = i+1

    global conditionExists
    global isDoWhen
    conditionExists = False
    isDoWhen = False

    # if we found any temporal logics keywords then we have to add them to the formula
    global always
    print(always)
    logic_formula = apply_temporal_logic(logic_formula)

    logic_formula = logic_formula.replace(' .','')
    logic_formula = logic_formula.replace('=.','= ')
    return logic_formula.replace('.)',')').replace('.=','=').replace('. ',' ').replace(' .',' ')
    
    
# Evaluate from COND(<-> Condition) Node
def evaluate_cond(tree):
    """
    Evaluate a tree from its condition node : COND, and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    global conditionExists
    global do_exist
    global always
    global isDoWhen
    global doWhen_do
    conditionExists = True
    cond = ""
    i = 0  
    global always
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'WHEN':
            always = True
        elif child_label == 'IF':
            always = True
        elif child_label == 'DO':
            isDoWhen = True
            do_exist = True
        elif child_label == 'ACTION':
            cond += evaluate_action(tree[i])
            cond = apply_next(cond)
            cond = apply_finally(cond)
            cond = apply_negation(cond)
        else :
            print('Label doesn\'t match with any TOKEN in COND. Exiting program')
            sys.exit()
        i = i+1
    if isDoWhen:
        doWhen_do = cond
        return ""
    else:
        return cond+" ->"

# Evaluate from RES(<-> Condition) Node
def evaluate_res(tree):
    """
    Evaluate a tree from its result node : RES, and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    res = ""
    i = 0  
    children_size = len(tree)
    global do_exist
    global always
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'ACTION':
            res += evaluate_action(tree[i]) 
            res = apply_next(res)
            res = apply_finally(res)
            res = apply_negation(res)
        elif child_label == 'THEN':
            pass
        elif child_label == 'DO' :
            do_exist = True
        elif child_label == 'WITHIN' :
            global within
            within = True
        elif child_label == 'TIME':
            evaluate_time(tree[i])
        elif child_label == 'AFTER':
            res += " && "+evaluate_after(tree[i])
        elif child_label == 'WHEN' :
             always = True
        else :
            print('Label doesn\'t match with any TOKEN in RES. Exiting program')
            sys.exit()
        i = i+1

    global a
    if a == True:
        res = "A("+res+")"
        a= False

    global isDoWhen
    global doWhen_do

    if isDoWhen:
        cond = res+" -> "
        res = apply_do(doWhen_do)
        return cond + res
    else:
        res = apply_do(res)
        return res

def evaluate_action(tree):
    """
    Evaluate a tree from its action node : ACTION, and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    action = ""
    i = 0  
    children_size = len(tree)
    global negationBeforeFinally
    global conditionExists
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'NP':
            action += evaluate_np(tree[i])
        elif child_label == 'VP':
            action += evaluate_vp(tree[i])
        elif child_label == 'ACTION':
            action += evaluate_action(tree[i])
            action = apply_next(action)
            if conditionExists:
                action = apply_finally(action)
                action = apply_negation(action)
                conditionExists = False
        elif child_label == 'OP_L' : 
            action += evaluate_op_l(tree[i])
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in ACTION. Exiting program')
            sys.exit()
        i = i+1

    if not negationBeforeFinally:
       action = apply_negation(action)
       negationBeforeFinally = True

    if not conditionExists and negationBeforeFinally:
        action = apply_finally(action)
        action = apply_negation(action)
   # elif not conditionExists:


    
    return action

def evaluate_op_l(tree):
    """
    Evaluate a tree from its logic operator node : OP_L, and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """

    op = ""
    i = 0
    global always
    global if_unary
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
                if w == 'whenever' or w == 'always ':
                    always = True
                    if_unary = True
                    op += " -> "
        elif child_label == 'IF':
            l = tree[i].leaves()
            always = True
            if_unary = True
            op += " -> "
                    
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in OP_L. Exiting program')
            sys.exit()
        i = i+1
    return op

def evaluate_np(tree):
    """
    Evaluate a tree from its noun node : NP, and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """

    np = ""
    i = 0  
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'DT':
            l = tree[i].leaves()
            for w in l :
                if w in all_arr:
                    global a
                    a = True
                else :
                    pass
        elif child_label == 'NOMS':
            np += evaluate_noms(tree[i])
        elif child_label == 'PP':
             np += evaluate_pp(tree[i])
        elif child_label == 'ADJECTIVES':
            np += evaluate_adjectives(tree[i])
        elif child_label == 'ADVERBS':
            np += evaluate_adverbs(tree[i])
        elif child_label == 'GERUND':
            pass
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in NP. Exiting program')
            sys.exit()
        i = i+1
    
    return np

def evaluate_vp(tree):
    """
    Evaluate a tree from its verb node : VP, and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    
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

    global is_equal
    global is_cd

    if is_equal == True and is_cd == True :
        vp = vp.replace('.','=')
        is_equal = False
        is_cd = False

    return vp

def evaluate_noms(tree):
    """
    Evaluate a tree from its noms node : NOMS, and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    
    """
 
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
    """
      Evaluate a tree from node NOM, and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    nom = ""
    i = 0  
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label in arr_nom:
            l = tree[i].leaves()
            if child_label == 'CD':
                global is_cd
                is_cd = True
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
    """
      Evaluate a tree from node VERB, and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    verb = ""
    i = 0  
    global is_equal
    posNegation = 0
    posAdverb = 0 
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'VB' or child_label == 'VBZ' or child_label == 'VBP' :
            l = tree[i].leaves()
            for v in l:
                if v == 'is' or v == 'be' :
                    is_equal = True
                    verb += "."
                elif v == 'does':
                    is_equal = False
                    verb += "."
                elif v == 'equals' or v == 'equal' :
                    is_equal = False
                    verb += " = "
                elif 'hold' in v:
                    is_equal = False
                    pass
                else:         
                    if v.endswith('s'):
                        v = v[0:-1]
                    is_equal = False
                    verb += "."+v        
        elif child_label == 'NOM':
            verb += evaluate_nom(tree[i])        
        elif child_label == 'NOT':
           global negation
           negation = True
           posNegation = i
        elif child_label == 'ADVERBS' :
            verb += evaluate_adverbs(tree[i])
            posAdverb = i
        elif child_label == 'DO' :
            is_equal = False
            verb += "."
        elif child_label == 'MODAL': 
            pass
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in VERB. Exiting program')
            sys.exit()
        i = i+1

    global negationBeforeFinally
    if posNegation < posAdverb:
        negationBeforeFinally = True
    else:
         negationBeforeFinally = False

    return verb

def evaluate_adverbs(tree):
    """
      Evaluate a tree from node ADVERBS and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    adv = ""
    i = 0  
    global always
    global negation
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'RB' :
            l = tree[i].leaves()
            for w in l :
                if w == 'always':
                    always = True
                if w in f_arr:
                    global f
                    f = True
                if w == 'never':
                    always = True
                    negation = True
                    

        elif child_label == 'ADVERBS':
            adv += evaluate_adverbs(tree[i])
        else :
            print('Label'+ tree[i].label() +'doesn\'t match with any TOKEN in ADVERB. Exiting program')
            sys.exit()
        i = i+1
    return adv

def evaluate_co(tree):
    """
       Evaluate a tree from node CO (objet complement) and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
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
    """
      Evaluate a tree from node COD (direct object complement) and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
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
    """
       Evaluate a tree from node ADJECTIVES and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    adj = ""
    i = 0  
    global is_equal
    is_equal = False
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
             elif  j in x_arr:
                 global x
                 x = True
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
    """
         Evaluate a tree from node PP (prepositional pronouns) and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
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
    """
        Evaluate a tree from node P (preposition) and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
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
             if w in u_arr:
                p = " U "
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in P. Exiting program')
            sys.exit()
        i = i+1
    return p


def evaluate_mc(tree):
    """
    Evaluate a tree from node MC (composed words separated with an hyphen) and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
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
        elif child_label == 'OP':
              l = tree[i].leaves()
              for w in l :
                  mc += w
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in MC. Exiting program')
            sys.exit()
        i = i+1
    return mc

def evaluate_comp(tree):
    """
    Evaluate a tree from node COMP (comparator keywords) and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    comp = ""
    i = 0  
    children_size = len(tree)
    global is_equal
    is_equal = False
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
            print('Label doesn\'t match with any TOKEN in COMP. Exiting program')
            sys.exit()
        i = i+1
    return comp


def evaluate_time(tree):
    """
    Evaluate a tree from node TIME (nouns that indicate time) and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    i = 0  
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'CD':
            l = tree[i].leaves()
            for w in l:
                global within_value
                within_value = w 
        elif child_label == 'NNS':
            pass
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in TIME. Exiting program')
            sys.exit()
        i = i+1

def evaluate_after(tree):
    """
    Evaluate a tree from node AFTER (afterwards keywords) and convert it into a temporal logic formula  
        
    Parameters
    ----------
        tree -> nltk.tree
    """
    after = ""
    i = 0  
    children_size = len(tree)
    while i < children_size:
        child_label = tree[i].label()
        if child_label == 'AFTERWARDS':
            global afterwards
            afterwards = True
        elif child_label == 'ACTION':
            after += evaluate_action(tree[i])
        else :
            print(tree[i].label())
            print('Label doesn\'t match with any TOKEN in TIME. Exiting program')
            sys.exit()
        i = i+1
    after = apply_afterwards(after)
    return after