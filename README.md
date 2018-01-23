# prodvault
3 node vault docker container cluster & backend as consul.

--- Before we start, please make sure consul cluster is ready ---

Below are the steps for vault :

Steps to install vault:( as root users on physical machine or VM )
Download binary file
Download binary files for your system based on your operating system type from download link

we are downloading vault for Linux 64 bit operating system

$ wget https://releases.hashicorp.com/vault/0.7.3/vault_0.7.3_linux_amd64.zip

Saving to: ‘vault_0.7.3_linux_amd64.zip’

 

Unzip vault file
 $ unzip vault_0.7.3_linux_amd64.zip

$ unzip vault_0.7.3_linux_amd64.zip
Archive: vault_0.7.3_linux_amd64.zip
 inflating: vault
Copy vault binary file PATH location or /usr/local/bin
$ sudo cp –avr vault /usr/local/bin

$ sudo cp -avr vault /usr/local/bin
‘vault’ -> ‘/usr/local/bin/vault’
Verify vault installation by using below command
$ vault version

 $ vault version
Vault v0.7.3 ('0b20ae0b9b7a748d607082b1add3663a28e31b68')

Next setp would be vault start & initialization,as per below.
 $vault server  -config=/etc/vault.json &  OR you can create the bash shell script for starting and stopping i.e deamon
 $vault init
 
Once, you execute above command it will generate unseal key and root token.
Take it in notepad

Create the docker file, supervisor and vault config file, you can take the reference from existing files.



