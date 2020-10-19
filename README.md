# IKEv2 docker container

## Prerequisites

Before running the container, you need to create the following two directories.

- `clients`: where client certificates are located
- `ipsec.d`: where authorities and server certificates are located

## Running the container

The following environment variables can be used.

- `COUNTRY`: used as a country code when generating the certificate files
- `ORG`: used as an organization name when generating the certificate files
- `HOSTNAME`: used as a server name of a subject name field of the server certificate
- `DOMAIN`: used as a domain name of a subject name field of the server certificate
- `DNS` (optional): DNS server addresses for VPN clients

## Creating a new user

Run the `generate-client` command under the `bin` directory, while the docker container is running.

The generated certificates will be located under the `clients` directory. The VPN user must install the following two certificates.

- The certificate authority file, generated at `ipsec.d/cacert/ca.cert.pem`
- The user certificate generated at `clients/p12/USERNAME.p12`

## TODO

Need more thoughts on SPLIT_TUNNELING configuration.

## Acknowledgements

The start script is stolen from [https://github.com/gaomd/docker-ikev2-vpn-server](https://github.com/gaomd/docker-ikev2-vpn-server).

The config file template is stolen from [https://webnetforce.net/strongswan-ikev2-on-sakura-vps/](https://webnetforce.net/strongswan-ikev2-on-sakura-vps/)
