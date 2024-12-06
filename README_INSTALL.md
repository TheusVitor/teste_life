# Instalação e Execução do Projeto com Docker

Elaborei este guia para demonstrar como configurar e executar o projeto utilizando **Docker** e **Docker Compose**. O objetivo é facilitar a inicialização do ambiente de desenvolvimento e assegurar que tudo funcione corretamente.

---

## **Pré-requisitos**

Certifique-se de ter as seguintes ferramentas instaladas no seu ambiente:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

Para verificar se estão instalados, basta rodar os comandos abaixo no terminal:

```bash
$ docker --version
$ docker-compose --version
```

---

## **Configuração do Ambiente**

1. Clone o repositório do projeto:

   ```bash
   git clone https://github.com/TheusVitor/teste_life.git
   cd teste_life
   ```

2. Certifique-se de que os seguintes arquivos estejam presentes na raiz do projeto:
   - `docker-compose.yml`
   - `Dockerfile`

3. Verifique as configurações no arquivo `docker-compose.yml`:
   - A porta `8080` do host será mapeada para a porta `80` do contêiner.
   - O banco de dados será configurado com as seguintes credenciais:
     - Usuário: `usuario`
     - Senha: `senha`
     - Banco padrão: `teste`

4. Configure a estrutura do banco de dados:

   O arquivo `db/install.sql` contém toda a estrutura e os dados necessários para o banco. Após iniciar os contêineres, basta importar este arquivo no MySQL usando a ferramenta da sua escolha (por exemplo, MySQL Workbench ou DBeaver).

---

## **Execução do Projeto**

1. **Inicie os contêineres:**

   Na raiz do projeto, execute:

   ```bash
   docker-compose up -d
   ```

   Este comando irá:
   - Construir a imagem do PHP com base no `Dockerfile`.
   - Baixar a imagem oficial do MySQL.
   - Inicializar os contêineres configurados.

2. **Verifique se os contêineres estão em execução:**

   ```bash
   docker ps
   ```

   Você deve ver dois contêineres ativos:
   - `php-container` (responsável pela aplicação PHP com Apache)
   - `mysql-container` (banco de dados MySQL)

3. **Acesse a aplicação no navegador:**

   Abra o navegador e acesse o endereço:

   ```
   http://localhost:8080
   ```

---

## **Administração do Banco de Dados**

As credenciais padrão configuradas para o MySQL são:

- **Usuário:** `usuario`
- **Senha:** `senha`
- **Banco de Dados:** `teste`

Para acessar o banco, você pode usar qualquer cliente MySQL (por exemplo, MySQL Workbench ou DBeaver). Utilize as seguintes configurações:

- **Host:** `localhost`
- **Porta:** `3306`

---

## **Comandos Úteis**

- **Reiniciar os contêineres:**
  ```bash
  docker-compose restart
  ```

- **Verificar logs:**
  ```bash
  docker-compose logs -f
  ```

- **Parar os contêineres:**
  ```bash
  docker-compose down
  ```

- **Reconstruir as imagens (após modificações no código ou configuração):**
  ```bash
  docker-compose up -d --build
  ```
---

Estruturei este projeto para que o ambiente de desenvolvimento seja configurado de forma rápida, padronizada e prática. Qualquer dúvida ou sugestão, fico à disposição!

