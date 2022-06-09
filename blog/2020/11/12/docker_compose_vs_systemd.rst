Docker Compose vs SystemD for One-Clicks
========================================

I had been struggling for a while over how to best configure VMs for my one-clicks. SystemD is fantastic but simply put, nobody seems to be contributing much SystemD items these days as everything is docker. It's not like I am late to the docker party, I'm fully bought in.  But for a while when running VMs I was just trying to build vanilla VMs which meant SystemD.

I am now off the SystemD train and fully bought into docker for as much as it makes sense.  I have now transitioned my one-clicks from just Terraform -> Ansible -> SystemD to Terraform -> Ansble -> Docker Compose.

For an example, this stack took me 3 hours to build with docker-compose,

- `Terraform module <https://github.com/insight-infrastructure/terraform-aws-superset-docker>`_
- `Ansible role <https://github.com/insight-infrastructure/ansible-role-superset-docker>`_
- `docker-compose <https://github.com/insight-infrastructure/superset-docker-compose>`_

Where as this stack took me several days with all the debugging...

- `Terraform module <https://github.com/insight-infrastructure/terraform-aws-superset>`_
- `Ansible role <https://github.com/insight-infrastructure/ansible-role-superset>`_

I think the real key is just getting systemd to play nice with docker-compose.  Have yet to figure out best way of doing that.

Starting to really hate VMs...

.. author:: default
.. categories:: none
.. tags:: none
.. comments::
