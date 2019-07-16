include:
  - haproxy.haproxy-install
haproxy-service:
  file.managed:
    - name: /etc/haproxy/haproxy.cfg
    - source: salt://cluster/files/haproxy-outside.cfg
    - user: root
    - group: root
    - mode: 644
  service.running:
    - name: haproxy
    - enable: True
    - reload: True
    - require:
      - cmd: haproxy-init
    - watch:
      - file: haproxy-service
