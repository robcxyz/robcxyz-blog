No Idiomatic Dev Ops
=====================

Recently I heard something that resonated, that building idiomatic dev ops is still an undefined problem.  There are a lot of great solutions out there for building architectures but very few examples of these tools actually being used in the wild.  Almost all the implementations are reference architectures because typically the infrastructure side of a company has no chance of ever being open sourced for too many reasons to get into.  But that is not really the case in the blockchain field where I work where not only is open source the status quo, but the value of open sourcing dev ops source translates well across individual deployments.  This is because 1, everyone is trying to manage the same application and 2, all the applications (ie eth and other POS networks) typically behave the same (checkout kotal).

Anyways, idiomatic dev ops is still not a thing and there are a lot of smart people working on it but I think the biggest blocker at the moment is this idea.

* Most dev ops applications are simply ways of getting config files into target applications
    - See helm, helmfile, terragrunt (more on this one later), etc
* Applications typically don't care about anything past what exactly they are being fed
* This creates a situation where you have a lot of great tools but it is on the user to actually get it working well within their environment's specifications
    - For instance if you have multiple envs like most do, you typically need to engineer how these envs have shared attributes and individual ones
* Brass tax - everything ends up in yaml or some file like it which is static and so workflows have to resolve to something like that

For these issues, tackle-box is going to crush for a couple reasons:

* It is free form as in the user has the perfect tooling to implement the way that they want to implement their custom dry solution. There is no one size fits all but given a little bit of tackle knowledge, building something that is dry is not hard
* All the tools that people use (ie terraform, ansible, helm, helmfile etc) have a schema that you can simply code generate or even better create an abstract interface to implement
    - Code generation is pretty straightforward in that you make a tackle that generates the files needed and then hook into something that can call them (open source examples for all major tools coming)
    - Implementing an abstract interface is another story...

That is what this blog is going to really be about, how to implement a generic abstract interface to couple all the other tools together. Obviously I wouldn't be writing this if it wasn't for tackle which I see as a potential solution for this challenge but to be real, I haven't seen anyone actually formalize this challenge in this light yet but I think this is the right framing. How exactly do you knit together your favorite tool / process to generate a config file that is callable by you favorite dev ops tool.

This will have to be a multi-part thing as frankly, it is hard enough to find inspiration to get my day to day work done, let alone craft compelling stories that promote tackle box. Shit is still a WIP and my brain is jelly most of the time.

.. author:: default
.. categories:: none
.. tags:: none
.. comments::
