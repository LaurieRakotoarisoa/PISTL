# PISTL
Système de traduction de langue naturelle pour les énoncés d’informatique temps-réel 

# Installation

- Installer Python 3.5, 3.6, ou 3.7
- Installer Tk : apt-get install python3-tk
- Installer la libraire nltk : pip install --user -U nltk
- Dans l'interpréteur python : 

    >> import nltk

    >> nltk.download('punkt')

    >> nltk.download('averaged_perceptron_tagger')

- S'il manque toujours un module alors toujours dans l'interpréteur python3 :
    
    >> import nltk

    >> nltk.download('nom_du_module_manquant')

# Test

Dans le terminal :

      -	Pour entrer un énoncé à traduire, il faut lancer la commande suivante :

	>> python3 nl4RealTime.py -s ENONCE

	où ENONCE est une chaine de caractère entourée de double apostrophes

-------

      -	Pour entrer un fichier contenant des énoncés à traduire, il faut lancer la commande suivante :
	
	>> python3 nl4RealTime.py -f FILENAME
	
	où FILENAME est le nom d'un fichier contenant des formules séparées par des ';' et devant se trouver dans le dossier NL4RealTime

	Le résultat s'affiche et est également stocker dans un nouveau fichier commençant par "translation_" suivi du nom de fichier



NOTE : On peut tester le fichier exemple.txt en lançant la commande :
	>> python3 nl4RealTime.py

# GRAMMAIRE 

Voici la liste non-définitive des significations des tokens définis ou qui seront utilisés dans la grammaire

    ACTION combination of NP and VP
    CC coordinating conjunction
    CD cardinal digit
    CO complement objet (combination of COD and COI)
    COD complément d'objet direct
    COI complément d'objet indirect
    COMMA comma ','
    COND condition
    DT determiner
    EX existential there (like: “there is” … think of it like “there exists”)
    FW foreign word
    IN preposition/subordinating conjunction
    JJ adjective ‘big’
    JJR adjective, comparative ‘bigger’
    JJS adjective, superlative ‘biggest’
    LS list marker 1)
    MD modal could, will
    NN noun, singular ‘desk’
    NNS noun plural ‘desks’
    NNP proper noun, singular ‘Harrison’
    NNPS proper noun, plural ‘Americans’
    NOMS nouns or one noun
    PDT predeterminer ‘all the kids’
    POS possessive ending parent’s
    PRP personal pronoun I, he, she
    PRP$ possessive pronoun my, his, hers
    RB adverb very, silently,
    RBR adverb, comparative better
    RBS adverb, superlative best
    RES result
    RP particle give up
    TO, to go ‘to’ the store.
    UH interjection, errrrrrrrm
    VB verb, base form take
    VBD verb, past tense took
    VBG verb, gerund/present participle taking
    VBN verb, past participle taken
    VBP verb, sing. present, non-3d take
    VBZ verb, 3rd person sing. present takes
    WDT wh-determiner which
    WP wh-pronoun who, what
    WP$ possessive wh-pronoun whose
    WRB wh-abverb where, when
