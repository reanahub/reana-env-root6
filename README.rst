=========================
 REANA Environment ROOT6
=========================

.. image:: https://github.com/reanahub/reana-env-root6/workflows/CI/badge.svg
   :target: https://github.com/reanahub/reana-env-root6/actions

.. image:: https://badges.gitter.im/Join%20Chat.svg
   :target: https://gitter.im/reanahub/reana?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge

.. image:: https://img.shields.io/github/license/reanahub/reana-env-root6.svg
   :target: https://github.com/reanahub/reana-env-root6/blob/master/LICENSE

About
=====

``reana-env-root6`` provides a container image with encapsulated runtime
execution environment for `ROOT6 <https://root.cern.ch/>`_ based data analyses.

``reana-env-root6`` was developed for use in the `REANA <http://www.reana.io/>`_
reusable and reproducible research data analysis platform.

Usage
=====

You can use ``reana-env-root6`` provided "as is" and simply mount your own ROOT
macros to the running container.

Alternatively, you can also use ``reana-env-root6`` as a base image for
containerising your own ROOT6-based analyses. Just start your ``Dockerfile``
from this base image and add your own custom ROOT code on top::

   FROM docker.io/reanahub/reana-env-root6
   ADD my-macro.C /code/
   [...]

Here are several complete examples on how to use ``reana-env-root6``
environment in your analyses:

- `reana-demo-root6-roofit <https://github.com/reanahub/reana-demo-root6-roofit>`_
- `reana-demo-bsm-search <https://github.com/reanahub/reana-demo-bsm-search>`_
- `reana-demo-lhcb-d2pimumu <https://github.com/reanahub/reana-demo-lhcb-d2pimumu>`_

Development
===========

If you would like to contribute to ``reana-env-root6`` development, you can take
advantage of provided ``Makefile``::

   $ make build  # build a new version of the container image
   $ make test   # test the built image
   $ make push   # push it to Docker Hub

More information
================

For more information about the REANA reusable analysis platform, please see the
`REANA project <http://www.reana.io>`_ home page and the general `REANA
documentation <http://reana.readthedocs.io/>`_ pages.
