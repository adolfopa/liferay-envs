# MySQL environment

VM with Ubuntu Trusty (64bit), and MySQL. A *portal* user will be
created automatically along with three databases: *lportal*,
*lportal_ee* and *lportal_test*.

To use this VM you'll need to edit the Vagrant file in order to set
the password for the database user. For that, replace the `` `secret
mysql` `` by whatever suits you.