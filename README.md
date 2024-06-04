LEMBRE-SE:

- Fazer alteração das informações no main.tf, para declarar corretamente seu bucket, region e tags

- Criar as chaves "aws-key" e "aws-key.pub" para a criação da VM na AWS e "azure-key" e "azure-key.pub" para a criação da VM na AZURE.
Para a criação, caso esteja usando o VS Code, utilizando o comando "ssh-keygen -f aws-key" já irá criar na devida formatação.

OBS: se fizer alterações nos nomes dos blocos, precisará alterar também as chamadas de id que mencionem os blocos alterados e também ajusta-los no outputs.tf.

Outro ponto: Essa criação irá utilizar uma VPC já criada, com isso valide as regras da VPC em questão, também usará a VNET já criada em outro código como recurso.

Código pronto para uso de gitlab pipeline CI/CD
