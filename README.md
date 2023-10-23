# Como rodar

### Docker

```sh
    docker-compose build
    docker-compose run web bundele exec rails db:create
    docker-compose run web bundele exec rails db:migrate
    docker-compose up --build
```
