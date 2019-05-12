# Table Top Meet Up

Need help setting up game night? Trying to get the D&D sessions back up and running? Putting together a tournament? Look no further!

Everyone involved can sign up and check when and where the entertainment will be.  Add specefic meet ups to your profile and mark your favorite games.

Admin is set up for CRUD functions on locations, meet ups, and games.

## Getting Started

Fork and clone the application to your machine, add provided data to database, startup the server, and you are good to go. See deployment for notes on Google Omniauth.

### Prerequisites

You need to have Ruby on Rails to run this application.

https://guides.rubyonrails.org/getting_started.html#installing-rails

### Installing

Fork and clone the application to your machine.

```
$ git clone git@github.com:username/table-top-meet-up-with-js.git
```

Change directory into the application.

```
$ cd username/folder/table-top-meet-up-with-js.git
```

Install Gems.

```
$ bundle install
```

Set up the database and migrations.

```
$ rake db:migrate
```

Add data to database
***Must do this for full functionality of application***

```
rake db:seed
```

Start Rails server

```
rails s
```

Open your browser and go to provided url.  Usually: http://localhost:3000

Log in and get gaming!
***use login: admin@admin.com password: admin for CRUD functions***

## Deployment

Google Log in with Omniauth is set up, all you need is a .env file with GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET

https://github.com/zquestz/omniauth-google-oauth2

## Built With

* [Ruby on Rails](https://github.com/rails/rails) - The web framework used
* [Bulma](https://github.com/jgthms/bulma) - CSS Framework

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
