require "rspec"
require './find_readable'
require './find_fast'

shared_examples "the algorithm" do
  let(:algo) { described_class.new() }

  it "should not consider spaces and newlines around each word" do

    dictionary = [
        "number    \n", "num", "ber",
        "    azilon", "azi", "lon"
    ]

    matches = algo.find_combinations(dictionary)

    matches.should == [
        "num + ber => number",
        "azi + lon => azilon",
    ]
  end

  it "should only consider words of a 6 characters" do

    dictionary = [
        "number    ", "num", "ber",
        "longword", "long", "word"
    ]

    matches = algo.find_combinations(dictionary)

    matches.should == [
        "num + ber => number",
    ]
  end

  describe "should find combinations of small words that make up bigger words from a dictionary of words" do

    it "from a sample file" do

      # Although not a proper test, this allows to proof the code against the provided fixtures.

      file = File.new('wordlist.txt')
      dictionary = file.readlines()

      time = Time.now
      matches = algo.find_combinations(dictionary)
      time = Time.now - time

      printf "Executed in %s\n", (time)
      puts matches
    end

    it "from example data" do

      dictionary = [
          'al',
          'albums',
          'aver',
          'bar',
          'barely',
          'be',
          'befoul',
          'bums',
          'by',
          'con',
          'convex',
          'ely',
          'foul',
          'here',
          'hereby',
          'jig',
          'jigsaw',
          'or',
          'saw',
          'tail',
          'tailor',
          'vex',
          'we',
          'weaver'
      ]

      matches = algo.find_combinations(dictionary)

      matches.should == [
        "al + bums => albums",
        "bar + ely => barely",
        "be + foul => befoul",
        "con + vex => convex",
        "here + by => hereby",
        "jig + saw => jigsaw",
        "tail + or => tailor",
        "we + aver => weaver",
      ]

    end
  end

end

describe ReadableAlgorithm do

  it_behaves_like "the algorithm"

end

describe FastAlgorithm do

  it_behaves_like "the algorithm"

  # More granular and specific testing

  it "should group words by length" do

    dictionary = ['a', 'b', 'ab', 'abc', 'de']

    finder = FastAlgorithm.new
    groups = finder.group_words_by_length(dictionary, 4)

    groups.should == {
        1 => {'a' => nil, 'b' => nil},
        2 => {'ab' => nil, 'de' => nil},
        3 => {'abc' => nil},
        4 => {},
    }

  end

end