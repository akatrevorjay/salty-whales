Salty Whales
============

> A *salty* whale is a *happy* whale.
> You *do* want your whales to be *happy*, don't you?

Gimme the rundown like motown
-----------------------------

* Docker Hub: https://hub.docker.com/r/trevorj/salty-whales
* CircleCI: https://circleci.com/gh/akatrevorjay/salty-whales
* A whale named *Salt*: http://www.whaleswithnames.com/salt/

Why?
----

* Automated builds through CircleCI, pushed to Docker hub.
* Every pair of *OS Codename* + *Salt Release* is available.
  * Hub: https://github.com/akatrevorjay/salty-whales
* Easily add more via a simple variable. No really.
* Originally named `docker-ubuntu-salt-minion`. (boo)
* No longer named `docker-ubuntu-salt-minion` as I chose to include the rest of Salt as it was tiny in comparison. (woo)

How?
----

* There are some helpers included; it's insanely easy, check out `bin/sls` after dropping `salt` and `pillar` folders in your `$PWD`.
* All helpers are included in your PATH, as you'd expect from a sane container.
* Mount them in as volumes on, say the standard `/srv/pillar` and `/srv/salt`.
* Utilize `pytest-testinfra`, or `salt-layers`, go wild! Beyond your wildest fantasies! Wowzers!

Troubleshooting
---------------

`Q:` My whales are far too salty, they seem uncomfortable

`A:` Nonsense! A *salty* whale is a *happy* whale. It says that right in the `README`.


