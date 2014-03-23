nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/conf.d/satis.conf

{# Remove default config #}
{% for filename in ('default', 'example_ssl', 'ssl', 'virtual') %}
/etc/nginx/conf.d/{{ filename }}.conf:
  file.absent:
    - require:
      - pkg: nginx
{% endfor %}

{# ensure we've got the default config we want #}
/etc/nginx/nginx.conf:
  file:
    - managed
    - template: jinja
    - user: root
    - group: root
    - mode: 440
    - source: salt://files/nginx-config
    - require:
      - pkg: nginx

{# ensure we've got the site config we want #}
/etc/nginx/conf.d/satis.conf:
  file:
    - managed
    - template: jinja
    - user: root
    - group: root
    - mode: 440
    - source: salt://files/nginx-default-vhost
    - require:
      - pkg: nginx