
{#
php composer.phar create-project composer/satis --stability=dev --keep-vcs 
php ./satis/bin/satis build ./mirrored-packages.conf ./packages-mirror
#}

satis:
  cmd.run:
    - name: '/usr/local/bin/composer create-project composer/satis --stability=dev --keep-vcs'
    - unless: test -f /root/satis/bin/satis
    - cwd: /root/
    - require:
      - cmd: composer
  
satis-config:
  file.managed:
    - name: /root/satis-config
    - source: salt://files/satis-config
    - template: jinja
    - require:
      - cmd: satis

satis-directory:
  file.directory:
    - name: /var/www/satis
    - makedirs: True
    - user: nginx
    - dir_mode: 755
    - require:
      - pkg: nginx

update-satis-repo-files:
  cmd.wait:
    - name: php ./satis/bin/satis build /root/satis-config /var/www/satis
    - cwd: /root/
    - watch:
      - file: satis-config
    - require:
      - file: satis-directory
