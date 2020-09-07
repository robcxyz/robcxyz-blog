Back to blogging, this time about Nuki
======================================

So it is time I get back on this.  Number of things have changed since I was last active.  Started working full time with Insight and building out a collection of different terraform deployments for blockchain networks.

Biggest thing going on is Nuki though which I'm excited to start actively blogging about. It is a fork of `cookiecutter <https://github.com/cookiecutter/cookiecutter>`_ but made a ton of changes that have opened a whole realm of new possibilities beyond code generation. Specifically, I am now building out my own DSL based on yaml that has a lot of turing-like capabilities. The whole thing is modular and plugins based where the DSL is only supposed to wrap plugins with some simple helper utilities like `loop` and `when`.  Also have some branching capabilities but not quite there yet. Just got pydantic integrated and stuck on a few bugs.  Planning on building providers for each plugin which will then make it ready for promotion and getting open source contributors.

Anyways, will be blogging more as new updates get pushed.  Just about to declar independence from cookiecutter by doing some massive refactors that will basically make it it's own project and hence, deserves it's own un-forked repo.

Also updated this blog's deployment. Now using `this terraform module <https://github.com/insight-infrastructure/terraform-aws-cloudfront-static-site>`_ to deploy the s3 and cloudfront.  Much cleaner now.

Anyways, will update more soon once nuki starts rolling.

.. author:: default
.. categories:: none
.. tags:: none
.. comments::
