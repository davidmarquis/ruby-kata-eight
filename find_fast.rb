require "./config"

class FastAlgorithm

  def find_combinations(dictionary)

    @words = sanitize(dictionary, MINIMUM_WORD_LENGTH, MAXIMUM_WORD_LENGTH)
    @words_by_length = group_words_by_length(@words, MAXIMUM_WORD_LENGTH)

    result = []

    for word in words_of_maximum_length do

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

  def words_of_maximum_length()
    @words_by_length[MAXIMUM_WORD_LENGTH].keys
  end

  def word_exists?(word)
    @words_by_length[word.length].has_key?(word)
  end

  def sanitize(dictionary)
    dictionary = cleanup_words(dictionary)
    keep_only_usable_words(dictionary)
    dictionary
  end

  def cleanup_words(dictionary)
    dictionary.collect { |word| word.chomp().strip() }
  end

  def keep_only_usable_words(dictionary)
    dictionary.select { |word| word.length >= MINIMUM_WORD_LENGTH and word.length <= MAXIMUM_WORD_LENGTH }
  end

  def group_words_by_length(dictionary, max_length)
    groups = initialize_groups_up_to(max_length)
    for word in dictionary do
      groups[word.length][word] = nil
    end
    groups
  end

  def initialize_groups_up_to(max_length)
    groups = {}
    for length in 1..max_length do groups[length] = {} end
    groups
  end
end