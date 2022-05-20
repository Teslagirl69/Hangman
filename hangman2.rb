# игра виселица

# Задаем массив со списком используемых для игры слов
word_list = %w[
	abruptly absurd askew axiom azure banjo bayou blitz boxcar boxful buxom caliph croquet crypt curacao dirndl
	disavow duplex dwarves equip espionage exodus faking fixable fjord fuchsia galaxy gazebo giaour gizmo glyph gnarly
	gnostic haiku iatrogenic icebox ivory ivy jackpot jaundice jaywalk jigsaw jinx jockey joking jovial joyful
	juicy jukebox jumbo khaki kilobyte kiosk kitsch klutz knapsack larynx lengths lucky lymph marquis matrix microwave
	mystify naphtha nymph onyx ovary oxygen phlegm pixel pneumonia polka pshaw psyche quartz quips quiz quorum rhubarb
	rhythm rickshaw schnapps scratch shiv sphinx spritz squawk stymied subway swivel syndrome thriftles thumbscrew topaz
	transcript transplant triphthong twelfth twelfths unworthy unzip uptown vaporize vixen vodka vortex voyeurism waltz wave
	wavy waxy	whiskey whomever wimpy wizard wyvern xylophone yippee yoked youthful zephyr zilch zodiac zombie
]

# Определяем уровень сложности массива
puts "Choose the difficulty level: (L)ight (4-5 word), (M)edium (6-7 word) or (H)ard (8-10 word)"
level = gets.strip.capitalize
	if level == "L"
			difficulties = "light"
		elsif  level == "M"
			difficulties = "medium"
		elsif  level == "H"
			difficulties = "hard"
		else puts "Something goes wrong, try again"
		exit
	end
# Определяем количество символов для каждорго уровня сложности массива

level_arr = if level == "L"
  word_list.select {|word| (4..5).include?(word.length)}

elsif level == "M"
  word_list.select {|word| (6..7).include?(word.length)}

elsif level == "H"
  word_list.select {|word| (8..10).include?(word.length)}

end
# Определяем слово, выбранное по уровню сложности

choosen_word = level_arr[rand (0..level_arr.length-1)]

# Вывод количества букв в слове
puts "There are #{choosen_word.size} letters in word #{choosen_word}"

	split_word_arr = choosen_word.split(//) # Разбиваем по символам в массиве из выбранное ранее слово
	arr_matrix = Array.new(choosen_word.size, "_")

1.upto(10) do
	puts "Enter the letter, you think is in the word"
	chosen_letter = gets.strip.downcase

		# создаем новый массив, в котором проверяем каждую букву на соответствие (сравниваем) введенной пользователем букве

	new_split_arr = split_word_arr.map do |letter|
			if letter == chosen_letter  # Если letter (элемент массива) равно выбранной пользователем букве
				ind = split_word_arr.index chosen_letter
				arr_matrix[ind] = chosen_letter #
			else
				"_ " # иначе выводится нижнее подчеркивание "_"
			end
	end.join #Соединяем полученный split_word_arr.map массив в строку с введенной буквой и "_"


		if new_split_arr.include?(chosen_letter)
		 puts "Congratulations, you guessed it, there is a letter \"#{chosen_letter}\" in the word \"#{arr_matrix.join(" ")}\""
		else
		 puts "There is no #{chosen_letter} in this word. You have  attempts left" #дописать количество оставшихся попыток
		end
		if arr_matrix.join == choosen_word

			puts "Congratulations, you guessed it all"
			break
		end

end

