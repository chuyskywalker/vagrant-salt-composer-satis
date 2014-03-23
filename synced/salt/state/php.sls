include:
 - remi-repo

php:
  pkg.installed:
    - name: php
    - pkgs:
      - php-cli
      - php-common
      
php-timezone:
  cmd.run:
    - name: echo 'date.timezone = "UTC"' >> /etc/php.ini
    - unless: grep UTC /etc/php.ini
    - require:
      - pkg: php