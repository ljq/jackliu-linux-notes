# network

## IP address classification

### IP address classification / the difference between the beginning of IP address 10 and the beginning of 172 and the beginning of 192 / judging whether they are on the same network segment

In simple terms, what you see inside a company or enterprise is basically the intranet IP, the common IP segment in the three types of ABC IP addresses.

Each IP address contains two parts, namely the network number and the host number.

### InterNIC classifies IP addresses into five categories:
    Class A is reserved for ZF or large enterprises,
    Class B is allocated to medium-sized companies,
    Class C is allocated to small companies or individuals,
    Class D is used for multicast,
    Type E is used for experiments,
    Note: The number of addresses that can be accommodated in each type is different.

### Characteristics of three types of IP addresses: A, B, and C:

When writing the IP address in binary form

The first bit of the address of class A is always O, for example, 10.0.0.1 == 00001010-00000000-00000000-00000001
==》 1.0.0.0-127.255.255.255, the default subnet mask is 255.0.0.0, which can hold up to 16,777215 computers

The first two bits of a class B address are always 10, for example, 172.16.0.1 == 10101100-00010000-00000000-00000001
==》 128.0.0.0-191.255.255.255, the default subnet mask is 255.255.0.0, and can hold up to 65535 computers

The first three digits of a class C address are always 110. For example, 192.168.0.1 == 11000000-10101000-00000000-00000001
==》 192.0.0.0-223.255.255.255, the default subnet mask is 255.255.255.0, and can accommodate up to 254 computers

### Reserved address in IP address:
    IP addresses with a host part of all 0s are reserved for network addresses, IP addresses with a host part of all 1s are reserved as broadcast addresses, and 224-255 are reserved for multicast and experimental purposes. Also note that when assigning IP addresses, the addresses with the last digits 0 and 255 cannot be used, because this is a broadcast address and cannot be used on ordinary computers, but it can be used on gateways and routers.

### Dedicated IP address:
    It is the IP segment that we commonly reach the intranet among the three types of addresses.

    10.0.0.0--10.255.255.255
    172.16.0.0--172.31.255.255
    192.168.0.0--192.168.255.255

    Intranet computers use the NAT (Network Address Translation) protocol to access the Internet through a public gateway. Intranet computers can send connection requests to other computers on the Internet, but other computers on the Internet cannot send connection requests to computers on the intranet.

### Host address type

Overview
Different types of IP addresses are distinguished by the leading bit (highest bit) of the IP address:

Note: n is the network number bit, h is the host number bit

Class A address
Class A address: 0nnnnnnn.hhhhhhhh.hhhhhhhh.hhhhhhhh
    Class A addresses have a 7-digit network number, so 126 Class A networks can be defined {2 ^ 7-2 (network number cannot be all 0s or all 1s) 1-1 (127 is loopback address 2)} each The number of hosts that the network can have is 16777214 {2 ^ 24-2 (the host bit cannot be all 0s or all 1s)}
Decimal representation range: 1.0.0.1-126.255.255.254, any network address between 0 and 127 is a class A address.

Class B address
Class B address: 10nnnnnn.nnnnnnnn.hhhhhhhh.hhhhhhhh
Class B addresses have a 14-digit network number, so 16382 Class B networks can be defined {2 ^ 14-2}
Each network can have 65534 hosts {2 ^ 16-2}

Decimal representation range: 129.0.0.1-191.255.255.254, any network address between 128 and 191 is a class B address.

Class C address
Class C address: 110nnnnn.nnnnnnnn.nnnnnnnn.hhhhhhhh
Class C addresses have a 21-digit network number, so 2097152 Class C addresses can be defined {2 ^ 21-2}
Each network can have 254 {2 ^ 8-2}
Decimal representation range: 192.0.0.1-223.255.255.254, any network address between 192 and 223 is a type C address.

Class D address
Class D address: 1110xxxx.xxxxxxxx.xxxxxxxx.xxxxxxxx
Class D addresses are used for multicast. The first 4 bits are 1110 bootstrap, and the last 28 bits are the multicast address ID.
Decimal representation range: 224.0.0.0-239.255.255.255

Class E address
Class E address: always boot with 1111 four digits

Class E addresses are used for research

Decimal representation range: 240-

The IP address is uniformly assigned by InterNIC (Internet Information Center) to ensure the uniqueness of the IP address, but there is a type of IP address that can be used directly in the intranet without applying for it. This is Private Address, Private Address will not be on the Internet Any router forwarding, if you want to access the Internet must pass NAT / PAT conversion, access in the form of public IP.