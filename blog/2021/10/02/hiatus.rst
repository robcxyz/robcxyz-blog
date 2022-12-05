hiatus
======

Been a minute since I blogged but figured it was time to start writing. Been a tumultuous year since I last blogged. Founded a blockchain startup, moved to two different states, but most relevantly through long hours on the weekends am seeing the light at the end of the tunnel for finishing up tackle-box. Tackle box has been good enough to release for about a year but I have been super apprehensive to do so as once I do release it, I am bound to maintain the syntax and since it's success depends on community adoption, the last thing I want to do in this case is release a half finished product.  That was my thought at least 8 months ago and now it is finally paying off.  I had a little inspiration about a month ago to just say fuck it, and put in all the features I was dreaming about.  These included:

1. A new callout for a tackle hooks which are keys ending with `->`. Before tackle always looked for keys called `type` which I thought had a couple problems. First it is verbose, second it conflicts with keys that people might use.

1. Being able to support args and kwarg cli arguments. These I thought were the key to being able to get really compact syntax along with the ability to use the tool as a declarative CLI. From the command line you can now do:

.. code-block:: shell

    tackle thing.yaml arg arg_n --kwarg=kwarg --kwarg_n=kwarg_n


Or from a yaml you can do:

.. code-block:: yaml

    key->: print this and that

Basically the semantics of how to language interprets args, kwargs, and flags is the same as how it is expressed internally within the syntax as it is when you call it from the command line.

Many other features I am thinking about though so we'll see when this thing actually gets released. I don't want to deal with a community until it is actually ready. Changing the syntax later is going to be a nightmare for users so best I get it all settled right now.

.. author:: default
.. categories:: none
.. tags:: none
.. comments::
