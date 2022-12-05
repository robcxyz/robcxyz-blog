buying-a-lottery-ticket-with-tackle
===================================

When I started writing tackle-box, I never thought it would actually turn into an actual language but that is how it has evolved. Initially I was just trying to learn how to code and didn't know how to properly contribute my changes back to the original project I was modifying (cookiecutter).  The changes grew too great so when I then tried to PR them back to the original code base, maintainers were like "nice work but we can't do anything with that".  Fast forward almost two years and now the project has evolved into a full blown programming language.

Dennis Ritchie, the creator of C, once said about creating languages, "It's a lottery, and some can buy a lot of the tickets. There are plenty of beautiful languages (more beautiful than C) that didn't catch on. But someone does win the lottery, and doing a language at least teaches you something." Thats basically where I am at, someone who bought a ticket and might have something more elegant than what is around but has a slim chance of actually catching on. That being said, I did a number cool things not normal in other languages.

1. My language is serializable - ie the whole thing can be expressed in yaml / json which is super useful for a variety of config management tasks
2. It is the first serializable language (as far as I can tell) that is turing complete with loops, conditionals, and branching
3. It can easily be embedded within configuration files like yaml, json, toml, and init files
4. Its simpler to understand than any other language of its type out there.

To be clear, it isn't something to build anything super complicated but I can imagine there being a community built around building small building blocks for code generators. I can also see people (me) building cool reference implementations and using tackle to wrap various tools like kubectl and helm to manage clusters.

Anyways, we'll see where this goes.

.. author:: default
.. categories:: none
.. tags:: none
.. comments::
