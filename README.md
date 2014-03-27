encyclopedia
============

205 Encyclopedia Construction

http://rubyquiz.strd6.com/quizzes/205-encyclopedia-construction

This week’s quiz comes from Tim Hunter. Thank you Tim for the great write up!

When I was a kid we had an encyclopedia. It had thousands of articles in alphabetical order, divided into about 25 volumes. Sometimes there were so many articles with the same initial letter (”M”, for example) that an entire volume was dedicated to articles with that initial letter. In some cases, though, there weren’t enough articles with the same initial letter to devote an entire volume to them, so those articles were grouped in with alphabetically adjacent articles in the same volume. For example, all the articles starting with W, X, Y, and Z were in the same volume. Of course, all the articles that started with the same initial letter were always in the same volume. Each volume was labeled with the initial character of the articles it contained. For example, the “M” volume was simply labeled “M”. If the articles were spread over more than one initial character, the label displayed the first and last characters in the range. The W, X, Y, and Z volume was labeled “W-Z”.

The quiz is to devise a way of grouping a list of encyclopedia articles into volumes. Since this is Ruby Quiz, we’ll say that for “articles” we have a list of about 100 words composed of alphabetical characters, a-z. A “volume” is an array.

Sort the list and then put the words into arrays using the following rules.

1. All the words with the same initial character must be in the same array.
2. If an array contains words with different initial characters, the words must be alphabetically adjacent to each other. That is, if “cat”, “dog”, and “elephant”, are in the list of articles, and you put “cat” and “elephant” in the same array, then “dog” must also be in that array.
3. Without breaking rules 1 and 2, divide the words into about 10 arrays.
4. Without breaking rules 1 and 2, each of the arrays should contain about the same number of words.

To display the encyclopedia, make a hash with one element for each array. The element value is the array. The element key is a single letter (”M”) when the array only contains words with the same initial character, and a range (“W-Z”) when the array contains words with more than one initial character. Print the hash with the “pp” command.

Here’s the list of words:

ape apple apricot aquamarine architect artichoke azure baboon badger banana bat battleship beeswax beetles black blogger blue bricklayer Brigadoon card cat cherry chokeberry coconut coral crimson currant dam debate deliberations demagogue dog durian elephant empathy encyclopedia fig fox gazelle giraffe goldenrod gray hippopotamus huckleberry ibex imprint indigo ivory jab jackrabbit jake khaki kiwi kudzu lavender lemming leopard lime loganberry mango maroon memory mole monkey mouse muskox Nigeria Navajo olive opera panther party peach pear penguin persimmon plum poet politician privy programmer rabbit red research rhino Rumpelstiltskin salmon silver snow soldier songsmith squirrel starship steel strawberry student tan tapir theater thesaurus tree turquoise umbrella warthog waterloo wildebeest wolf woodchuck xylophone yahoo yellow zebra
