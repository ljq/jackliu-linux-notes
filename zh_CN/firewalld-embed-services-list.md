### firewalld services 防火墙内嵌服务

####  Configuration file path: /usr/lib/firewalld/services 


amanda-client.xml  
amanda-k5-client.xml  
bacula-client.xml  
bacula.xml  
bitcoin-rpc.xml  
bitcoin-testnet-rpc.xml  
bitcoin-testnet.xml  
bitcoin.xml  
ceph-mon.xml  
ceph.xml  
cfengine.xml  
condor-collector.xml  
ctdb.xml  
dhcpv6-client.xml  
dhcpv6.xml  
dhcp.xml  
dns.xml  
docker-registry.xml  
dropbox-lansync.xml  
elasticsearch.xml  
freeipa-ldaps.xml  
freeipa-ldap.xml  
freeipa-replication.xml  
freeipa-trust.xml  
ftp.xml  
ganglia-client.xml  
ganglia-master.xml  
high-availability.xml  
__<span style="color:red;">https.xml</span>__  
__<span style="color:red;">http.xml</span>__  
imaps.xml  
imap.xml  
ipp-client.xml  
ipp.xml  
ipsec.xml  
iscsi-target.xml  
kadmin.xml  
kerberos.xml  
kibana.xml  
klogin.xml  
kpasswd.xml  
kshell.xml  
ldaps.xml  
ldap.xml  
libvirt-tls.xml  
libvirt.xml  
managesieve.xml  
mdns.xml  
mosh.xml  
mountd.xml  
mssql.xml  
ms-wbt.xml  
mysql.xml  
nfs.xml  
nrpe.xml  
ntp.xml  
openvpn.xml  
ovirt-imageio.xml  
ovirt-storageconsole.xml  
ovirt-vmconsole.xml  
pmcd.xml  
pmproxy.xml  
pmwebapis.xml  
pmwebapi.xml  
pop3s.xml  
pop3.xml  
postgresql.xml  
privoxy.xml  
proxy-dhcp.xml  
ptp.xml  
pulseaudio.xml  
puppetmaster.xml  
quassel.xml  
radius.xml  
RH-Satellite-6.xml  
rpc-bind.xml  
rsh.xml  
rsyncd.xml  
samba-client.xml  
samba.xml  
sane.xml  
sips.xml  
sip.xml  
smtp-submission.xml  
smtps.xml  
smtp.xml  
snmptrap.xml  
snmp.xml  
spideroak-lansync.xml  
squid.xml  
__<span style="color:red;">ssh.xml</span>__  
synergy.xml  
syslog-tls.xml  
syslog.xml  
telnet.xml  
tftp-client.xml  
tftp.xml  
tinc.xml  
tor-socks.xml  
transmission-client.xml  
vdsm.xml  
vnc-server.xml  
wbem-https.xml  
xmpp-bosh.xml  
xmpp-client.xml  
xmpp-local.xml  
xmpp-server.xml  

___

#### ssh.xml:  

```
<?xml version="1.0" encoding="utf-8"?>
<service>
  <short>SSH</short>
  <description>Secure Shell (SSH) is a protocol for logging into and executing commands on remote machines. It provides secure encrypted communications. If you plan on accessing your machine remotely via SSH over a firewalled interface, enable this option. You need the openssh-server package installed for this option to be useful.</description>
  <port protocol="tcp" port="22"/>
</service>

```
