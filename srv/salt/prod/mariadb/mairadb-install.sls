include:
  - pkg.pkg-init
mariadb-install:
  pkg.installed:
    - name: mariadb
    - name: mariadb-server
  file.managed:
    - name: /etc/my.cnf
    - source: salt://mariadb/files/my.cnf
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: mariadb
    - enable: True
