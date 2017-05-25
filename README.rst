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

``reana-env-root6`` provides container image with encapsulated runtime execution
environment containing `ROOT <https://root.cern.ch/>`_ data analysis framework
version 6. It was developed for use in the `REANA
<http://reana.readthedocs.io/>`_ reusable research data analysis platform.

Usage
=====

You can use ``reana-env-root6`` as a base image for containerising your ROOT6
based research data analyses. Just start from this base image and add your
custom ROOT code on top::

   $ vim Dockerfile
   $ cat Dockerfile
   FROM reanahub/reana-env-root6
   ADD my-macro.C /code/
   [...]

Examples
========

Here are several concrete examples on how to use ``reana-env-root6`` environment
in your analyses:

- `<https://github.com/reanahub/reana-demo-root6-rootfit>`_

More information
================

For more information about REANA reusable research data analysis platform,
please see `REANA documentation <http://reana.readthedocs.io/>`_.
