Terraform + Terragrunt Versioning
=================================

This is awesome.  I used to do this manually but now there is a nice CLI tool that downloads the version of
Terraform and Terragrunt that you want and then replaces a symlink in /usr/local/bin or somewhere else in PATH.

Awesome....

Terraform Switcher - tfswitch
-----------------------------

Installation and use. [Docs](https://github.com/warrensbox/terraform-switcher/)


.. code-block:: bash

curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash
sudo chown -R $USER /usr/local/bin
tfswitch


If running into permissions issues then switch to user install and fix path

.. code-block:: bash

mkdir ~/bin
export PATH=$PATH:~/bin
tfswitch -b ~/bin/terraform

Terragrunt Switcher - tgswitch
------------------------------

Installation and use. [Docs](https://github.com/warrensbox/tgswitch/)

.. code-block:: bash

curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | sudo bash
sudo chown -R $USER /usr/local/bin
tfswitch







.. author:: default
.. categories:: none
.. tags:: none
.. comments::
