# Foodie-Reloaded

In library OAuthclient, a section has a 'ImportError: cannot import name 'urlresolvers'', which is deprecated for Django 2+. It's fixed with a hack, so take note when setting up the dev environment in another machine

SETTING UP DATABASE CONFIG IN THE BEGINNING:

1. Install GDAL packages (if not already existing) from here: https://stackoverflow.com/questions/37294127/python-gdal-2-1-installation-on-ubuntu-16-04

2. Install postgresql from here https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04

3. Install postgis
   sudo apt-get install postgis

4. If you get, Django Loaddata errors:
   Check stack overflow answer https://stackoverflow.com/questions/36213769/django-1-9-loaddata-errors/57480096#57480096
