Rebuilding tackle box
=====================

So I relatively recently decided to give up 1:1 support for rendering cookiecutter templates and decided to rewrite my code. Cookiecutter is the parent project I built tackle-box out of and I thought it would have been really cool to be able to get all those CC users over to TB by supporting their templates. In the end I feel like TB is better by being it's own thing.  Don't want to bemoan all the reasons behind the decision (there are a lot), but now I am dealing with a lot of interesting scenarios as a couple things were enabled by making this switch.

1. New syntax

Before I used the key `type` to indicate the calling of a hook which I thought was A, verbose and B, not very expressive leaving no room for syntactic sugar.  I have hence switched it to an arrow based scheme as below.

Old

.. code-block:: yaml

    a_key:
      type: print
      input: A thing to print

New

.. code-block:: yaml

    a_key:
      ->: print
      input: A thing to print

I also added the notion of arguments and single level calls like so

.. code-block:: yaml

    a_key:
      ->: print A thing to print
    # Is the same as
    b_key->: print A thing to print

This allows two things, the notion of what the arrow looks like (ie `->` / `_>` / `<-` / `<_`). Public and private hook calls look like `->` / `_>` respectively, private being the output is available for successive rendering / calls but not output in context. I am also contemplating the usefulness of the notion of functions which would be writen in tackle files with the `<-` / `<_` arrows and made available as reusable components within scripts.

2. Can parse arbitrary documents

CC had you lay everything out on one level of key value pairs which made nesting logic somewhat complicated. Before the rebuild, TB had a notion of a `block` hook which was a collection of other hooks that allowed users to condition their execution or loop through them based on normal hook logic. For instance this is old:

.. code-block:: yaml

    some_key:
      type: block
      when: some_var == 'something'
      items:
        stuff: things
        a_hook:
          type: another_hook

And now it is like this:

.. code-block:: yaml

    some_key->:
      if: some_var == 'something'
      stuff: things
      a_hook:
        ->: another_hook

This is handled under the hood with a macro that rewrites the input so that common things like the `block` hook are available.

3. Every hook is renderable

In jinja, there are things called extensions and filters which can be applied in via `{{ some_extension(vars) }}` or `{{ vars | some_filter }}` respectively. Now that each hook has the notion of a positional argument, all hooks can be called when rendering. Super helpful when you want to string together a number of hooks to get at something. For instance this would work to dig out the vairable out of a yaml file:

.. code-block:: yaml

    worker_image_tag: "{{yaml(path_join([cluster_env,join([network_name,'-',network_version]),item,'values.yaml'])).worker}}"

4. Functions

Will need to devote a whole blog series to that.  Strongly typed tackle...

Theres more, but I need to just write it all up in an actual medium series.


.. author:: default
.. categories:: none
.. tags:: none
.. comments::
