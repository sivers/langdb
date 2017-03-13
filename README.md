language learning tools, written in Ruby + SQLite

# IMPORTANT:

**These are meant to be run in the terminal (“command line”).**  Once you download this git repository, go into its directory in your terminal, and get ready to type things, shown below.

I'm just sharing these tools I've written for my own use, learning Esperanto from English.

So for now it's using English — “en” — as the source language, and Esperanto — “eo” — as the target language.

You can use this for any source and target language if you just think of “en” as code for “source” and “eo” as code for “target”.

# HOW TO START:

## Must have sqlite3 and ruby and Ruby's sqlite3 gem

```
sqlite3 --version
ruby -v
gem install sqlite3
```

Either make sure that “.” is in your $PATH, or else add “./” in front of all commands below.
(Example: ./add ./q ./dict ./log …)

# USAGE:

## type “add” to add a word, phrase, or fact

Just type “add” and you should see this:

```
add
./add:35:in `<main>': needs first word: word,phrase,fact (RuntimeError)
```

That shows you that it needs another word following it.  Either “word”, “phrase”, or “fact”

So type “add word” and you should see this:

```
add word
en: 
```

Enter an English (or source language) word, then hit [Enter].  Then an Esperanto (or target language) word, then hit [Enter].

```
add word
en: tree
eo: arbo
{"en"=>"tree", "eo"=>"arbo"}
```

That reply in curly-braces just shows you what was added to the database. So those words are now in your database.

If you prefer, you can put words all on one line first, instead of waiting to be prompted. To do so, you must use **en:** and **eo:** before those words.

```
add word eo: tre en: very, quite
{"en"=>"very, quite", "eo"=>"tre"}
```

You can do this in any order:

```
add word en: truth eo: vero
{"en"=>"truth", "eo"=>"vero"}
```

If you leave off one, it will prompt you for the other.

```
add word eo: trudi
en: to force, to impose
{"eo"=>"trudi", "en"=>"to force, to impose"}
```

Now let's add a **phrase**.  It's exactly the same process.  I keep them separate because later I will write a tool to find which words have not yet been used in phrases.

```
add phrase
en: somehow we will succeed
eo: iel ni sukcesos
{"en"=>"somehow we will succeed", "eo"=>"iel ni sukcesos"}
```

To add a phrase all on one line, if you might use parentheses or quotes or special words, it helps to use quote marks around each phrase

```
add phrase eo: "mi ne havas tempon por klarigi nun" en: "I don't have time to explain now"
{"en"=>"I don't have time to explain now", "eo"=>"mi ne havas tempon por klarigi nun"}
```

Add a **fact** just to quiz yourself in Anki later, but not to be included in dictionary lookups:

```
add fact
q: what letters are silent in Esperanto?
a: no letters are silent in Esperanto
{"q"=>"what letters are silent in Esperanto?", "a"=>"no letters are silent in Esperanto"}
```

## type “q” plus a word, to search

Sorry just one word, or even just a few letters, but notice **it will search both source and target language!**

```
q tre
arbo            tree
tre             very, quite
-----

q ver
tre             very, quite
vero            truth
-----
```

Very handy for quick lookups of either source or target words.  **It searches both words and phrases.**

## type “dict” for a summary

```
dict
TOTAL: 4 words, 2 phrases, 1 facts
TO EXPORT: 4 words, 2 phrases, 1 facts
```

## type “dict export” to send to Anki!

```
dict export
TOTAL: 4 words, 2 phrases, 1 facts
TO EXPORT: 4 words, 2 phrases, 1 facts
Go import /tmp/anki.tab.
TYPE ok WHEN DONE: 
```

Now go into Anki, and under File → Import, choose **/tmp/anki.tab** and open it.

Type = Basic. Deck = Esperanto (or whatever). Fields separated by Tab. And **[x] Allow HTML in fields**.

Then click [Import].

It created **two cards per word, phrase, and fact**, so you get quizzed both directions.

I'm thinking of removing the 2nd card for the “facts”, since they're meant to go one direction.  But you can delete them by hand in Anki, when you come across them, if they're awkward.

**Did it import successfully?  Then type “ok”**, and it will update the database to say these words, phrases, and facts were successfully imported.

Now notice if you type “**dict**” again that it shows 0 to export:

```
dict
TOTAL: 4 words, 2 phrases, 1 facts
TO EXPORT: 0 words, 0 phrases, 0 facts
```

Now keep adding more more more, and sometimes remember to export them to Anki.  It will know to just export the new ones since last time.

# time log

I like to keep a log of how long I've practiced, and what I did in each session.

## log start

When you begin, type “**log start**”, and say what actions you'll be taking:

```
log start
actions? using this little tool
OK GO
```

## log finish

When done practicing, even just stopping to take a break, type “**log finish**”, and optionally enter some thoughts about this past session, or notes for later.

```
log finish
thoughts? writing this README is taking a long time!
2017-01-26 10:36:38     12      using this little tool  writing this README is taking a long time!
```

It shows you the finished log entry, including the number of minutes you were working on that last session.

## log show

This shows you all your past log entries, oldest to newest.  Right now I just have one in this demo:

```
log show
2017-01-26 10:36:38     12      using this little tool  writing this README is taking a long time!
```

## log sum

For seeing the total number of hours and minutes you've spent on learning this language

```
log sum
0 hours and 12 minutes
```

# Audio spelling quiz!

Sorry probably have different tools for this, so this probably won't work on your computer without a little tweaking.

I'm using **sox** - <http://sox.sourceforge.net/> - to combine multiple audio files into one.

And **aucat** - <http://man.openbsd.org/aucat> - to play the combined audio file.

Edit the **spell.rb** file to replace sox or aucat with your own commands for that, if you know them.

Then just type **spell.rb** to begin a quiz:

```
spell.rb
(( plays audio now ))
what word was it? trudi
RIGHT!
(( plays audio now ))
what word was it? vor
NOPE! it was vero
(( plays audio again ))
hear it now?
```

# That's all

Feel free to use or alter it however you'd like.  It's working well for me so far:

```
$ log sum
55 hours and 55 minutes

$ dict
TOTAL: 691 words, 195 phrases, 44 facts
TO EXPORT: 17 words, 23 phrases, 3 facts
```

