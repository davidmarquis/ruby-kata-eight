MAXIMUM_WORD_LENGTH = 6

class ReadableAlgorithm

  def find_combinations(dictionary)

    result = []

    dictionary = cleanup_words(dictionary)
    six_letter_words = extract_six_letter_words(dictionary)

    for word in six_letter_words do

      for split_idx in (1..word.length) do

        left_part = word[0..split_idx]
        right_part = word[split_idx + 1, word.length]

        if word_exists?(dictionary, left_part) and
            word_exists?(dictionary, right_part)

          result << "#{left_part} + #{right_part} => #{word}"

        end
      end
    end

    result
  end

  def extract_six_letter_words(dictionary)
    dictionary.select { |word| word.length == 6 }
  end

  def cleanup_words(dictionary)
    dictionary.collect { |word| word.chomp().strip() }
  end

  def word_exists?(dictionary, word)
    dictionary.include?(word)
  end
end