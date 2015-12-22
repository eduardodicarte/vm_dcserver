# dc_infra
* Descrição 
    - Repositório com os fontes para a implementação do serviço para arquitetura ágil
    - Servidor Puppet provisionado via Vagrant com Puppet Apply

* Requisitos necessários 
    - Vagrant, na versão 1.7.4
        - https://www.vagrantup.com/downloads.html
    - VirtualBox, na versão 4.3.34r104062
        - https://www.virtualbox.org/wiki/Downloads

* Informações adicionais 
    - Será disponibilizado o ambiente completo com Puppet Server + Puppet Agent + Puppet Dashboard, os serviços serão descritos aqui na medida que forem incluídos no servidor.
    - Os scripts Puppet poderão ser utilizandos tanto via VM como numa máquina física, bastando para isso executar o manifest específico ou adaptar conforme necessário, as orientações serão descritas aqui na medida que o ambiente for evoluindo.
    - Servidor com IPTables (Firewall) desativado

* How-Do
    - Para começar o provisionamento do servidor faça um clone do repositório dc_infra, acesse a pasta puppetserver e digite o comando
"vagrant up" e pressione a tecla enter, aguarde o download da VM e a configuração do servidor (caso já tenha baixado, o vagrant irá apenas importar a vm).
    - Após o vagrant terminar o provisionamento da máquina, o servidor poderá ser acessado via SSH com o IP 192.168.200.101

* Adicionando nodes 
    - Os scripts para o provisionamento dos nodes serão disponibilizados posteriormente, porém caso queira adicionar algum node manualmente, siga as seguintes orientações:
      - Certifique que o node esteja utilizando Puppet na versão 4
      - É recomendado a utilização do CentOS 7 (devido aos testes terem sido feitos nessa distribuição), e a utilização da mesma imagem do puppetserver (puppetlabs/centos-7.0-64-puppet), de preferência certifique que o Puppet esteja na mesma versão em todas as máquinas.
      - Como o serviço DNS não foi configurado no servidor, adicione as informações dos nodes que você deseja adicionar no servidor, 
    no arquivo /etc/hosts, conforme comando abaixo (Faça isso tanto nos nodes como no servidor):
          - echo "ip_do_node fqdn_da_maquina nome_da_maquina" >> /etc/hosts
    - Exemplo:
        - Adicione as informações do node na máquina do próprio node, ou seja tanto node como master deverão ter as informações, segue um exemplo da inclusão do node agent1.dicarte.com.br com o ip 192.168.200.201 no servidor dcserver.dicarte.com.br:
            - [dcserver.dicarte.com.br]
              - echo 192.168.200.201 dcagent1.dicarte.com.br dcagent1" >> /etc/hosts
            - [dcagent1.dicarte.com.br]
              - echo 192.168.200.201 dcagent1.dicarte.com.br dcagent1" >> /etc/hosts
      


Dúvidas? Entre em contato por aqui mesmo ou via email: eduardo_dicarte@yahoo.com.br


