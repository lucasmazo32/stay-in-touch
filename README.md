# Stay in touch: Ruby on Rails project

> This repo includes intial code for social media app with basic styling. Its purpose is to be a starting point for Microverse students.

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Live Demo

TBA


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
   rails db:create
   rails db:migrate
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

### Deployment

TBA

## Authors


- Kyankya Raymond: [Github](https://github.com/rkyankya)
- Lucas Mazo: [Github](https://github.com/lucasmazo32)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

TBA

## 📝 License

MIT

