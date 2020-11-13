Out with Nukikata, Now it's Tackle Box
======================================

So as cool as nukikata was as a name, nobody could remember it and nobody cares what it translates to in Japanese. So I set out to find a new name.  Meditated hard on it and went through some iterations.  Got stuck on kitchen themed things and instead started to think about the ocean.  Lots of cool names in the ocean like boats (docker) and whales (kubernetes).  But then I remembered when I almost named my plugins hooks and then there it is, what is something that holds hooks?  A tackle box.

Well there it is, `tackle box <https://github.com/insight-infrastructure/tackle-box>`_.

Few features in the works.

1. No more ``{{ cookiecutter.foo }}`` -> supports legacy and ``{{ foo }}``
2. Ability to record a series of options to a file, then easily include that output as a fixture for tests.  This was a major pain with my first soiree with building modules. If you can't test it, it's probably broken. These options are now exposed as modes similar to the legacy ``replay`` option. Calling the new modes, ``record`` -> a way to output a run and dump output in the event of failure and ``rerun`` -> a way to run without inputs from a saved output (ie the output of ``record``).
3. Simpler logic with the input dicts.  The variable names were so confusing for a while and so I just renamed them.  This was part of refactoring all the inputs into pydantic objects. Will be helpful if I want to expose anything as an API but really just gave me out of the box data validation.  New features don't need variables piped from one end of the program to the other. Much cleaner and easier to understand.  Still working out tests as they all broke....
4. Providers with their own requirements. Since tackle is supposed to wrap other libraries, it needs a way of lazily importing modules.  Did the POC and just need to integrate it.

As soon as I am done with #4, I'll write the medium and officially launch the project.


.. author:: default
.. categories:: none
.. tags:: none
.. comments::
