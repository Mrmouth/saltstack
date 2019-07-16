php-install:
  pkg.installed:
    - names:
      - php
      - php-fpm
      - php-cli
      - php-mysql
      - php-common
  service.running:
    - name: php-fpm
    - enable: True
  file.managed:
    - name: /etc/php.ini
    - source: salt://php/files/php.ini
    - user: root
    - group: root
    - mode: 644
