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

$yum update -y && yum install docker* ( For CE )

Next setp would be vault start & initialization,as per below.
 $vault server  -config=/etc/vault.json &  OR you can create the bash shell script for starting and stopping i.e deamon
 $vault init
 
Once, you execute above command it will generate unseal key and root token.
Take it in notepad and kill the vault process
 $kill %1 OR vault process id

Create the docker file, supervisor and vault config file, you can take the reference from existing files.

e.g 
$ls 
[root@chefclient1 ubuntu]# ls -lhtr
total 12K
-rw-r--r--. 1 root root 620 Jan 17 16:43 dockerfile
-rw-r--r--. 1 root root 202 Jan 23 16:11 vaultconfig.hcl
-rw-r--r--. 1 root root 543 Jan 23 16:19 supervisord.conf

$docker build -t prodvault:1 .

$docker run -d -p 8200:8200 --name=<<container name>> <<imageid>>
 
$docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
0e8bc825f2e2        2fb86aedc172        "/bin/sh -c 'supervis"   29 minutes ago      Up 29 minutes       0.0.0.0:8200->8200/tcp   prodvault9425343

[root@0e8bc825f2e2 /]# vault status
Sealed: false
Key Shares: 5
Key Threshold: 3
Unseal Progress: 0
Unseal Nonce:
Version: 0.7.3
Cluster Name: vault-cluster-853fbc39
Cluster ID: 4d7a74b6-1662-c36e-9d25-c82046b8b19f

High-Availability Enabled: true
        Mode: active
        Leader: http://192.168.56.101:8200
        
[root@0e8bc825f2e2 /]# vault write secret/artificial value="example"
Success! Data written to: secret/artificial
[root@0e8bc825f2e2 /]# vault read secret/artificial
Key                     Value
---                     -----
refresh_interval        768h0m0s
value                   example

[root@0e8bc825f2e2 /]# vault list secret
Keys
----
artificial
satish

It looks good for first docker container, follow the same steps from docker file creation till the testing.

Enjoy !! 

"It's hard to beat a person who never ever gives up !"
            

 


