Docker Compose vs SystemD for One-Clicks
========================================

I had been struggling for a while over how to best configure VMs for my one-clicks. SystemD is fantastic but simply put, nobody seems to be contributing much SystemD items these days as everything is docker. It's not like I am late to the docker party, I'm fully bought in.  But for a while when running VMs I was just trying to build vanilla VMs which meant SystemD.

I am now off the SystemD train and fully bought into docker for as much as it makes sense.  I have now transitioned my one-clicks from just Terraform -> Ansible -> SystemD to Terraform -> Ansble -> Docker Compose.

For an example, this stack took me 3 hours to build with docker-compose,

- `TF`_
- `ANS`_
- `DCOMP`_

Where as this stack took me several days with all the debugging...

- `TF2`_
- `ANS2`_

Time is money. I'm officially over SystemD. Give me a couple months and I might just throw away VMs for k8s all together.  In time.

.. author:: default
.. categories:: none
.. tags:: none
.. comments::

.. _TF: https://github.com/insight-infrastructure/terraform-aws-superset-docker
.. _ANS: https://github.com/insight-infrastructure/ansible-role-superset-docker
.. _DCOMP: https://github.com/insight-infrastructure/superset-docker-compose

.. _TF2: https://github.com/insight-infrastructure/terraform-aws-superset
.. _ANS2: https://github.com/insight-infrastructure/ansible-role-superset