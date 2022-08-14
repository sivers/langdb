#!/usr/bin/env ruby
require 'sqlite3'

DB = SQLite3::Database.new 'eo.db'

WORDS = "select en, eo from words where en like ? or eo like ? order by eo"
PHRASES = "select en, eo from phrases where en like ? or eo like ? order by eo"

def wild(txt)
  '%' + txt.strip + '%'
end

def showrows(rows)
  rows.each do |row|
    puts "%s\t\t%s" % [row[1], row[0]]
  end
end

showrows DB.execute(WORDS, wild(ARGV[0]), wild(ARGV[0]))
puts "-----"
showrows DB.execute(PHRASES, wild(ARGV[0]), wild(ARGV[0]))
