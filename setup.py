from setuptools import setup, find_packages
import sys, os

version = '0.3a'

setup(name='hello-octapus',
      version=version,
      description="Notin",
      long_description="""""",
      classifiers=[], # Get strings from http://pypi.python.org/pypi?%3Aaction=list_classifiers
      keywords='nothingness helloworld',
      author='Michail Alexakis',
      author_email='',
      url='',
      license='GPL',
      packages=find_packages(exclude=['ez_setup', 'examples', 'tests']),
      include_package_data=True,
      zip_safe=False,
      install_requires=[
          # -*- Extra requirements: -*-
          'nose',
          'autopep8',
      ],
      entry_points="""
      # -*- Entry points: -*-
      """,
      )
