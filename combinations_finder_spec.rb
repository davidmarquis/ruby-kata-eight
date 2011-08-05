require "rspec"
require './combinations_finder'

describe CombinationsFinder do

  describe "should find combinations of small words that make up bigger words from a dictionary of words loaded from the sample file" do

    it "from a sample file" do

      # Although not a proper test, this allows to proof the code against the provided fixtures.

      file = File.new('wordlist.txt')
      dictionary = file.readlines()

      time = Time.now
      finder = CombinationsFinder.new(dictionary)
      matches = finder.find_combinations()
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

      finder = CombinationsFinder.new(dictionary)
      matches = finder.find_combinations()

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

  # More granular testing

  it "should only consider words of a certain length as usable" do

    dictionary = ["short", "", "a", "verylongword"]

    groups = CombinationsFinder.sanitize(dictionary, 2, 5)

    groups.should == ["short"]

  end

  it "should only consider alpha characters" do

    dictionary = ["short    ", "    short", "short", "verylongword"]

    groups = CombinationsFinder.sanitize(dictionary, 2, 5)

    groups.should == ["short"]

  end

  it "should group words by length" do

    dictionary = ['a', 'b', 'ab', 'abc', 'de']

    groups = CombinationsFinder.group_words_by_length(dictionary, 4)

    groups.should == {
        1 => ['a', 'b'],
        2 => ['ab', 'de'],
        3 => ['abc'],
        4 => [],
    }

  end

end