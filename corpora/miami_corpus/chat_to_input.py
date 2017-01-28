# -*- coding: utf-8 -*-
import codecs
import re
"""
Parses any .cha file from the Miami en-es codeswitched corpus
Steps:
- Find participants: @Participants:	LAU Lauren Adult, CHL Chloe Adult, OSE non_participant Adult
- Parse all lines that start with * (participants' sentences),
    e.g. *CHL:	well she was telling me about this thing with Oprah@s:eng&spa . 124_3849

Language markers:
@s:spa = Spanish,
@s:eng = English,
@s:eng&spa = Undetermined,   [will probably ignore]
@s:spa+eng = word with first morpheme(s) Spanish, second morpheme(s) English,
@s:eng+spa = word with first morpheme(s) English, second morpheme(s) Spanish.
Untagged words are English except where part of an utterance headed [- spa], in which untagged words are Spanish

'Maria's interlocutors did not sign consent forms or fill in
questionnaires and so the transcripts of the15 recordings only represent
Maria’s speech, while utterances from other speakers are transcribed as
“www”.' Remove all 'www' instances.
No idea what "+<" indicates

%xaut: automatically generated gloss tier for the closest English equivalent for each word (including morphological
        information where relevant)
%eng: free translation
%com: comments
"""

cha_file = 'chats/herring2.cha'

with codecs.open(cha_file, 'rb', encoding="utf-8") as f:
    cha_lines = f.readlines()

print cha_lines[917]
print cha_lines[918]
print cha_lines[919]
dialogue = [line for line in cha_lines if line.startswith('*')]
pos = [line.split('%aut:')[1].strip() for line in cha_lines if line.startswith('%aut')]
# Example of dialogue line : *CHL:	that she's a new age thing . 4031_6182
# We want to keep only the core sentence
# "www" indicates non transcribed utterances from other speakers
for i, line in enumerate(dialogue):
    #print "----\nLINE:%s" % line
    try:
        sentence = re.search(r"\w{3}:(.*?)([0-9\_]{6,})?", line).groups()[0].strip()
    except:
        sentence = re.search(r"\w{3}:(.*?)", line).groups()[0].strip()
    sentence = re.sub(r"\(be\)cause", "because", sentence)
    sentence = re.sub(r"i\(f\)", "if", sentence)
    sentence = re.sub(r"www|@s:eng&spa|\+(<?)|<|\"/.|\"|&da:|&uwi|&(=?)laugh( \.?)|xxx|\[[\?|\/]\]|&me|&=mumble|&=cough", "", sentence).strip()  # these tags don't really say anything, remove them

    if len(sentence) <= 3:  # means that the sentence is empty after all the redundant annotations
        dialogue.pop(i)
        i -= 1
        #print "IGNORE:%s" % sentence
    else:
        print sentence
        first_word = sentence.split(' ')[0]
        '''if first_word not in pos[i] and first_word.split("'")[0] not in pos[i] \
                and not sentence.startswith("[- spa]") and not "@s:spa" in first_word and not 'unk' in pos[i] \
                and not (first_word == ',' and sentence.split(' ')[1] in pos[i]) \
                and not pos[i].split(' ')[0] == 'name' and first_word != "don't":
            print i '''
        print pos[i]


