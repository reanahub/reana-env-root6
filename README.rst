=========================
 REANA Environment ROOT6
=========================

.. image:: https://img.shields.io/travis/reanahub/reana-env-root6.svg
   :target: https://travis-ci.org/reanahub/reana-env-root6

.. image:: https://badges.gitter.im/Join%20Chat.svg
   :target: https://gitter.im/reanahub/reana?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge

.. image:: https://img.shields.io/github/license/reanahub/reana-env-root6.svg
   :target: https://github.com/reanahub/reana-env-root6/blob/master/COPYING

About
=====

``reana-env-root6`` provides a container image with encapsulated runtime
execution environment for `ROOT6 <https://root.cern.ch/>`_ based data analyses.
It was developed for use in the `REANA <http://reana.readthedocs.io/>`_ reusable
research data analysis platform.

Usage
=====

You can use ``reana-env-root6`` as a base image for containerising your own
ROOT6-based research data analyses. You can simply start your ``Dockerfile``
from this base image and add your custom ROOT code on top::

   FROM reanahub/reana-env-root6
   ADD my-macro.C /code/
   [...]

Examples
========

Here are several complete examples on how to use ``reana-env-root6`` environment
in your analyses:

- `reana-demo-root6-roofit <https://github.com/reanahub/reana-demo-root6-rootfit>`_

Development
===========

If you would like to contribute to ``reana-env-root6`` development, you can take
advantage of provided ``Makefile``::

   $ make build  # build a new version of the container image
   $ make test   # test the built image
   $ make push   # push it to Docker Hub

More information
================

For more information about `REANA <http://reanahub.io/>`_ reusable research data
analysis platform, please see `its documentation
<http://reana.readthedocs.io/>`_.
