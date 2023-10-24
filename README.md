# Como rodar

### Docker

```sh
    # Comandos docker-compose para subir aplicação
    docker-compose build
    docker-compose run web bundele exec rails db:create
    docker-compose run web bundele exec rails db:migrate
    docker-compose up --build

    # Comando para gerar migration para adicionar campo na tabela ou remover
    rails g migration <NomeMigration> <campo:tipo>

    # Rodar o rails em modo de produção no hambiente local
    rails db:drop:_unsafe RAILS_ENV=production
    rails db:create RAILS_ENV=production
    rails db:migrate RAILS_ENV=production
    rails s -C --log-to-stdout -e production
```
