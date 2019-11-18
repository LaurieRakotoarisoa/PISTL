import nltk
from nltk import WordPunctTokenizer    
    
phrase = "When the name of a mailbox is doubleclicked, that mailbox will be opened"
tokenizer = WordPunctTokenizer()
tokens = tokenizer.tokenize(phrase)
tags = nltk.pos_tag(tokens)   

print(tags)