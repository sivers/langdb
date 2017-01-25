#!/usr/bin/env ruby
require 'sqlite3'
DB = SQLite3::Database.new 'eo.db'

module Word
	class << self
		def tx
			{'a'=>'a','b'=>'b','c'=>'c','ĉ'=>'ch','d'=>'d','e'=>'e','f'=>'f','g'=>'g','ĝ'=>'gh','h'=>'h','ĥ'=>'hh','i'=>'i','j'=>'j','ĵ'=>'jh','k'=>'k','l'=>'l','m'=>'m','n'=>'n','o'=>'o','p'=>'p','r'=>'r','s'=>'s','ŝ'=>'sh','t'=>'t','u'=>'u','ŭ'=>'uh','v'=>'v','z'=>'z'}
		end

		def hasaudio(word)
			# cheeky: this word's letters, minus all valid letters, should be empty
			[] == (word.split('') - tx.values)
		end

		def randomword
			begin
				word = DB.get_first_value("SELECT eo FROM words ORDER BY random() LIMIT 1")
			end until hasaudio(word)
			word
		end

		def spell(word)
			mp3s = word.split('').map {|l| "Audio/#{tx[l]}.mp3"}.join(' ')
			outf = '/tmp/out.wav'
			system("sox #{mp3s} #{outf}")
			system("aucat -i #{outf}")
			system("rm #{outf}")
		end
	end
end

loop do
	word = Word::randomword
	Word::spell(word)
	print "what word was it? "
	guess = STDIN.gets.strip
	if word == guess
		puts "RIGHT!"
	else
		puts "NOPE! it was #{word}"
		Word::spell(word)
		puts "hear it now?"
		STDIN.gets.strip
	end
end
