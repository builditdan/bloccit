
### URL
[https://peaceful-shore-6087.herokuapp.com/](https://peaceful-shore-6087.herokuapp.com/)

### Github URL
[https://github.com/builditdan/bloccit](https://github.com/builditdan/bloccit)

### Getting Started

**Clone the Github application**

```
$ git clone https://github.com/YOUR-USERNAME/YOUR-REPOSITORY
```

**Create the database**

```
rake db:create
```

**Migrating and seeding the database**

```
rake db:migrate
rake db:seed
```

**Starting the local server**

```
rails s

```

### Background and General Information
I built this web application during my foundation training  with [bloc.io](https://bloc.io) using Ruby on Rails.

The application is just like Reddit where people can post topics, add comments, and vote items up or down.

### Design Information
Bloccit has all the basic elements of a [CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete) application and more. It is a fantastic foundation for building various web applications. It handles user management and security ([bcrypt](https://github.com/codahale/bcrypt-ruby) to secure your data) natively in the code. Seeds the database with test data and uses [RSpec](http://rspec.info/) to test all key aspects of the application. It uses the simple awesome [Bootstrap](http://getbootstrap.com/) gem to ease page layout and design aspects.

### Highlights on Gem's used
* [`rspec`](https://github.com/rspec/rspec-rails) for testing
* [`postgres`](http://www.postgresql.org/) for my production database, mysql for development
* [`bcrypt`](https://github.com/codahale/bcrypt-ruby) for securing data stored in the database
* [`bootstrap-sass`](https://github.com/twbs/bootstrap-rubygem) for easing web page design and layout
*

### Additional comments
None

### Disclaimer
I provide this Web site as an example of my work. It is **not a production site** and subject to **removal** along with any content that you may have created. If you are interested in using this site or the code - feel free to download or contact me with your questions.
