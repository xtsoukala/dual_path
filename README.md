# Bilingual Dual path model

Dual path is a computational model of (monolingual) sentence production by Chang, 2002

Take a look at this tutorial: https://sites.google.com/site/sentenceproductionmodel/Home/tutorial


From Chang F., 2002:
```
Learning algorithm: back-propagation, using a modified momentum algorithm (doug momentum)
Doug momentum: similar to standard momentum descent with the exception that the pre-momentum
weight step vector is bounded so that its length cannot exceed 1.0 (Rohde, 1999).

The cwhere and word units used the soft-max activation function.
Soft-max units caused the output to be passed through an exponential function, which magnified
small differences, and the result was then normalized (leaving only the most activated unit, and
squashing the activation of all the weaker competitors). Because soft-max units were used for 
the word output units, the error function for these units was the divergence function 
(sum over all units: target × log(target/output)). 
All other units used the logistic activation function.
```

To run the model: 


```
python dual_path.py -h 
```

to see all the parameters of the model.

```
usage: dual_path.py [-h] [-hidden HIDDEN] [-lrate LRATE] [-epochs EPOCHS]
                    [-dir DIR] [-resdir RESDIR] [-lexicon LEXICON]
                    [-concept CONCEPT] [-role ROLE] [-eventsem EVENTSEM]
                    [-trainfile TRAINFILE] [-testfile TESTFILE]
                    [-rolecopy ROLECOPY] [-debugmsg DEBUGMSG]

optional arguments:
  -h, --help            show this help message and exit
  -hidden HIDDEN        number of hidden layer units. Default: 20
  -lrate LRATE          Learning rate. Default: 0.2
  -epochs EPOCHS        Number of iterations during training. Default: 3000
  -dir DIR              Folder that contains the input files (lexicon,
                        concepts etc)
  -resdir RESDIR        Results folder name. Timestamp will be added (default
                        format: results+timestamp, e.g.
                        results2016-03-30T00.09.56)
  -lexicon LEXICON      File name that contains the lexicon. Default:
                        lexicon.in
  -concept CONCEPT      File name that contains the concepts. Default:
                        concepts.in
  -role ROLE            File name that contains the roles. Default: roles.in
  -eventsem EVENTSEM    File name that contains the event semantics. Default:
                        event-sem.in
  -trainfile TRAINFILE  File name that contains the message-sentence pair for
                        training. Should be under the same dir as the input
                        files. Default: train_c.en
  -testfile TESTFILE    File name that contains the message-sentence pair for
                        testing. Default: test_c.en
  -rolecopy ROLECOPY    Whether to copy the produced role layer or not
  -debugmsg DEBUGMSG    Whether to keep debugging info for SRN layers and
                        deltas
```


The output is stored under the given results folder (-resdir) in the following format:

```
OUT:the girl is hit -ing a ball .
TRG:the girl is hit -ing a ball .
OUT_POS:DET NOUN AUX VERB PR_PARTICIPLE DET NOUN EOS
TRG_POS:DET NOUN AUX VERB PR_PARTICIPLE DET NOUN EOS
----------------
```

Where OUT: is the produced sentence, TRG: the target (intended) sentence, OUT_POS: the produced sentence structure 
and TRG_POS: the target sentence structure.