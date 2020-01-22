#!/usr/bin/env ruby
require 'sqlite3'
# https://github.com/sparklemotion/sqlite3-ruby/blob/master/faq/faq.yml

DB = SQLite3::Database.new 'eo.db'

WORDS = "SELECT en, eo FROM words WHERE en LIKE ? OR eo LIKE ? ORDER BY eo"
PHRASES = "SELECT en, eo FROM phrases WHERE en LIKE ? OR eo LIKE ? ORDER BY eo"

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
