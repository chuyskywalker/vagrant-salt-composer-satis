# Getting iptables properly configured with Salt seems to be a bit of a
# pita right now, but that's ok -- just turn it off. In AWS there is a
# higher level firewall and locally I don't really care.

iptables-off:
  service:
    - name: iptables
    - dead
    - enable: False
