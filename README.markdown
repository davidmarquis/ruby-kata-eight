An exercise of Kata #8 (Conflicting Objectives) which can be found at: http://codekata.pragprog.com/2007/01/kata_eight_conf.html

Only steps 1 and 2 (readable and fast) have been implemented.
Both are tested using RSpec by the test suite that can be found in "spec/algorithms_spec.rb". They have been implemented using TDD.

To run the tests, make sure:
1. that your LOAD_PATH includes "./lib"
1. that your working directory is set to "./spec" in order for the wordlist.txt file to be found
1. to be patient, the last test takes a while to run

# Things to note:

## Readable implementation

* The kata article was not very clear on what is "readable" code, so I considered the following:
** Code that is readable *to a software developer*
** Code that prohibits duplications (DRY)
** Code that uses well named symbols (variables, methods, classes)
** Code that is well indented and formatted to language best practices
** Code that is self-explanatory
** In short, code that is *clean*.
* Uses the original words array throughout the algorithm. Thus, numerous lookups required by the algorithms each require traversal of the entire original array.

## Fast implementation

* The use of hashes greatly improves the time required for the generous amount of word lookups required by the algorithm
* By grouping words by their length in separate hashes, this also reduces the scope of each sub-word lookup operation
* It is interesting to note that although the "fast" implementation is more verbose and has more steps, it is still perfectly readable according to my definition of "readable" above

## Performance data

* "readable" using the sample word list (45K words) executes in around 110 seconds on my computer
* "fast" using the same list executes in around 0.2 seconds
