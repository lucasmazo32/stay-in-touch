# Stay in touch: Ruby on Rails project

> This project was created as part of our curriculum in Microverse. The friends relations and how they interact together was the main goal.

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Deployment

> [Stay in touch](https://aqueous-ocean-76424.herokuapp.com/)

- Mock users credentials go from foo1@bar.com to foo20@bar.com, and the password for all of them is foobar.


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Setup postres psql
```
sudo -u postgres psql
```
Create user with a password
```
create user username with password 'foobar';
```
Become a super user for the database
```
alter user username with superuser;
```

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:drop
   rails db:create
   rails db:migrate
   rails db:seed
```



### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

> Tests will be added by Microverse students. There are no tests for initial features in order to make sure that students write all tests from scratch.

## Authors


- Kyankya Raymond: [Github](https://github.com/rkyankya)
- Lucas Mazo: [Github](https://github.com/lucasmazo32)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

MIT

