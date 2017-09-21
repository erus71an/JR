def create_word_list
    word_list = []
  
    File.open('/Users/ruslan1/Documents/GitHub/JRCKTS/word_list.txt', 'r') do |file|
      file.each_line { |line| word_list << line if line.length > 4 }
    end
  
    word_list
  end
  
  def replace_random_char_to_random_number(word)
    replace_char_position = rand(0..word.length - 1)
    word.insert(replace_char_position, rand(0..9).to_s)
    word
  end
  
  def random_chr_upper_case(word)
    char_position = rand(0..word.length - 1)
    word[char_position] = word[char_position].upcase
  
    word
  end
  
  def replace_chr_by_hash(word)
    hash = { 'o' => 0, 'O' => 0, 'i' => '1', 'I' => '1', 's' => '$', 'S' => '$', 'a' => '@', '7' => '?', 'p' => '%', 'l' => '1', 'eight' => "8", 'ss' => '2s', 'oo' => 'U', 'vv' => 'w' }
  
    stop_key = rand(0..3)
    counter = 0
  
    hash.each do |key, value|
      word = word.sub(key, value.to_s) if word.include? key
      break if counter > stop_key
      counter += 1
    end
  
    word
  end
  
  def password_transform(word, count_of_transformations = 3)
    until count_of_transformations == 0
      transformation_number = rand(0..2)
  
      word =
        case transformation_number
        when 0 then replace_random_char_to_random_number(word)
        when 1 then replace_chr_by_hash(word)
        when 2 then random_chr_upper_case(word)
        end
  
      count_of_transformations -= 1
    end
  
    word
  end
  
  word_list = create_word_list
  first_num = rand(0..word_list.count) - 1
  first_word = word_list[first_num].gsub!(/[^0-9A-Za-z]/, '')
  second_num = rand(0..word_list.count - 1)
  second_word = word_list[second_num].gsub!(/[^0-9A-Za-z]/, '')
  word_slicer = rand([first_word.length, second_word.length].min / 2..[first_word.length, second_word.length].min - 1)
  prepared_word = first_word[0..word_slicer] + second_word[word_slicer..-1]
  
  puts password_transform(prepared_word).to_s
  