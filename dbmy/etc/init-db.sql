CREATE DATABASE lportal CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE DATABASE lportal_ee CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE DATABASE lportal_test CHARACTER SET utf8 COLLATE utf8_unicode_ci;

CREATE USER 'portal'@'%' IDENTIFIED BY '{{password}}';

GRANT ALL PRIVILEGES ON lportal.* TO 'portal'@'%';
GRANT ALL PRIVILEGES ON lportal_ee.* TO 'portal'@'%';
GRANT ALL PRIVILEGES ON lportal_test.* TO 'portal'@'%';

FLUSH PRIVILEGES;
