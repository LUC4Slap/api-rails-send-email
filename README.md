# Como rodar

### Docker

```sh
    docker-compose build
    docker-compose run web bundele exec rails db:create
    docker-compose run web bundele exec rails db:migrate
    docker-compose up --build

    # Rodar o rails em modo de produção no hambiente local
    rails s -C --log-to-stdout -e production
```
