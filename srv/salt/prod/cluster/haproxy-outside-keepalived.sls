include:
  - keepalived.install
keepalived-server:
  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://cluster/files/haproxy-outside-keepalived.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    {% if grains['fqdn'] == 'lo_node2' %}
    - ROUTERID: haproxy_ha
    - STATEID: MASTER
    - PRIORITYID: 150
    {% elif grains['fqdn'] == 'lo_node3' %}
    - ROUTERID: haproxy_ha
    - STATEID: BACKUP
    - PRIORITYID: 100
    {% endif %}
  service.running:
    - name: keepalived
    - enable: True
    - watch:
      - file: keepalived-server
