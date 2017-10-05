p_word = String.new()

def random_chr_upper_case(word)
    char_position = rand(0..word.length - 1)
    word[char_position] = word[char_position].downcase
  
    word
end

def password_transform(word, count_of_transformations = 3)
    count_of_transformations.times do |i|
      word = random_chr_upper_case(word)
      count_of_transformations -= 1
    end
  
    word
  end

vowels = "A,AI,AU,E,EA,EE,I,IA,IO,O,OA,OI,OO,OU,U".split(',')
consonants = "B,C,CH,CL,D,F,FF,G,GH,GL,J,K,L,LL,M,MN,N,P,PH,PS,R,RH,S,SC,SH,SK,ST,T,TH,V,W,X,Y,Z".split(',')

#complex_consonants = consonants.select { |c| c.length >1}
#consonants.select! { |c| c.length == 1}

complex_vowels = vowels.select { |c| c.length >1}
vowels.select! { |c| c.length == 1}

password_length = 6

is_consonant = true

until p_word.length > password_length
    
    p_word << (is_consonant ? consonants.sample  : vowels.sample)
    is_consonant = is_consonant.!
end

puts  password_transform(p_word)