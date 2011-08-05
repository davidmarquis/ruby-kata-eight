class CombinationsFinder

  MINIMUM_WORD_LENGTH = 2
  MAXIMUM_WORD_LENGTH = 6

  def initialize(dictionary)
    @words = CombinationsFinder.sanitize(dictionary, MINIMUM_WORD_LENGTH, MAXIMUM_WORD_LENGTH)
    @words_by_length = CombinationsFinder.group_words_by_length(@words, MAXIMUM_WORD_LENGTH)
  end

  def find_combinations()

    result = []

    for word in @words do

      split_start_idx = MINIMUM_WORD_LENGTH - 1
      split_end_idx = word.length - MINIMUM_WORD_LENGTH - 1

      for split_idx in (split_start_idx..split_end_idx) do

        split_left = word[0..split_idx]
        split_right = word[split_idx + 1, word.length]

        if word_exists?(split_left) and word_exists?(split_right)

          result << "#{split_left} + #{split_right} => #{word}"

        end
      end
    end

    result
  end

  def word_exists?(word)
    @words_by_length[word.length].include?(word)
  end

  def CombinationsFinder.sanitize(dictionary, min_length, max_length)
    cleaned = dictionary.collect { |word| word.chomp }
    cleaned.select { |word| word.length >= min_length and word.length <= max_length }
  end

  def CombinationsFinder.group_words_by_length(dictionary, max_length)
    groups = initialize_groups_up_to(max_length)
    for word in dictionary do
      groups[word.length] << word
    end
    groups
  end

  def CombinationsFinder.initialize_groups_up_to(max_length)
    groups = {}
    for length in 1..max_length do groups[length] = [] end
    groups
  end

end