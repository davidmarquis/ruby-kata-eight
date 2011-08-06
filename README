An exercise of Kata #8 (Conflicting Objectives) which can be found at: http://codekata.pragprog.com/2007/01/kata_eight_conf.html

Only steps 1 and 2 (readable and fast) have been implemented.
Both are tested using RSpec by the test suite that can be found in "algorithms_spec.rb". They have been implemented using TDD.

Things to note:

## Readable implementation

* Uses the original words array throughout the algorithm. Thus, numerous lookups required by the algorithms each require traversal of the entire list.

## Fast implementation

* The use of hashes greatly improves the time required for the generous amount of lookups required by the algorithm
* By grouping words by length in separate hashes, this also reduces the scope of each lookup operation
* It is interesting to note that although the "fast" implementation is more verbose and has more steps, it is still perfectly readable for a developer

## Performance data

* "readable" using the sample word list executes in around 110 seconds on my computer
* "fast" using the same list executes in around 0.2 seconds
