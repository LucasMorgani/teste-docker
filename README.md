Pequeno projeto que fiz no intuito de descobrir como funciona um container dentro de uma instancia EC2 com AutoScaling e ALB.
O container foi projetado para ser executado na mesma rede da VM, e puxar via curl a Availability Zone em que a VM está alocada.

Como Usar:
Depois de já configurado o AutoScaling e o ALB, crie a VM passando o script que está em user-data.txt. O script criará o container e o deixará 100% funcional.
Após acessar o IP Externo da VM, fique atualizando a página e verá o load balancer em ação!
