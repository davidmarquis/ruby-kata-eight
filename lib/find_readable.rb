require "config"

class ReadableAlgorithm

  def find_combinations(dictionary)

    result = []

    for word in dictionary do

      word = word.chomp().strip()

      if (word.length != 6)
        next
      end

      split_start_idx = MINIMUM_WORD_LENGTH - 1
      split_end_idx = word.length - MINIMUM_WORD_LENGTH - 1

      for split_idx in (split_start_idx..split_end_idx) do

        split_left = word[0..split_idx]
        split_right = word[split_idx + 1, word.length]

        if word_exists?(dictionary, split_left) and word_exists?(dictionary, split_right)

          result << "#{split_left} + #{split_right} => #{word}"

        end
      end
    end

    result
  end

  def word_exists?(dictionary, word)
    dictionary.include?(word)
  end
end