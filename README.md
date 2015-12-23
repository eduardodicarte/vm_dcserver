# dc_infra
* Descrição 
    - Repositório com os fontes para a implementação do serviço para arquitetura ágil
    - Servidor Puppet provisionado via Vagrant com Puppet Apply
    - Agentes Puppet provisionados via Vagrant com Puppet Apply

* Requisitos necessários 
    - Vagrant, na versão 1.7.4
        - https://www.vagrantup.com/downloads.html
    - VirtualBox, na versão 4.3.34r104062
        - https://www.virtualbox.org/wiki/Downloads

* Informações adicionais 
    - Será disponibilizado o ambiente completo com Puppet Server + Puppet Agent + Puppet Dashboard, os serviços serão descritos aqui na medida que forem incluídos no servidor.
    - Os scripts Puppet poderão ser utilizandos tanto via VM como numa máquina física, bastando para isso executar o manifest específico ou adaptar conforme necessário, as orientações serão descritas aqui na medida que o ambiente for evoluindo.
    - Servidor com IPTables (Firewall) desativado
    - Puppet na versão 4.3.1

* How-Do
    * Provisionamento do Servidor   
        - Para começar o provisionamento do servidor faça um clone do repositório dc_infra, acesse a pasta puppetserver e digite o comando
"vagrant up" e pressione a tecla enter, aguarde o download da VM e a configuração do servidor (caso já tenha baixado, o vagrant irá apenas importar a vm).
        - Após o vagrant terminar o provisionamento da máquina, o servidor poderá ser acessado via SSH com o IP 192.168.200.101
    * Provisionamento dos Agentes
        - Para começar o provisionamento dos agentes acesse a pasta puppetAgents e digite o comando "vagrant up" e pressione a tecla enter, aguarde a importação da VM, caso já tenha provisionado o servidor ou já tenha feito o download da imagem para a VM. Após a importação, os servidores serão provisionados. Os seguintes servidores estarão disponíveis:
    		- dcview (provisionado, porém não configurado) => Servidor com Servidor Apache instalado e configurado, ip => 192.168.200.211
 			- dcdb (provisionado, porém não configurado) => Servidor com PostgreSQLServer instalado e configurado, ip => 192.168.200.221
    		- dcbsb (provisionado, porém não configurado) => Servidor com WildFly instalado e configurado, ip => 192.168.200.231
    		- dcreport (provisionado, porém não configurado) => Servidor com Jenkins e Sonar instalado e configurado, ip => 192.168.200.241
    		- dcrepositories (não provisionado) => Servidor com Arquiva/ Nexus instalado e configurado, ip => 192.168.200.251

* OBS: Para habilitar a comunicação entre os nodes (clients) e o master (servidor) execute o seguinte comando no servidor para cada node:
     - puppet cert sign "nomedonode"
     


     - Exemplo: 
        - Para habilitar a comunicação entre o node dcview e o master, execute o comando: 
             * puppet cert sign dcview.dicarte.com.br


* A instação dos artefatos nos nodes (clients) via master (servidor) ainda não foram disponibilizados, após habilitar a comunicação do Master com os Nodes, nada será instalado. 



Dúvidas? Entre em contato por aqui mesmo ou via email: eduardo_dicarte@yahoo.com.br


