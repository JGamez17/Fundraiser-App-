# Fundraiser App 

This app was created to fundraise for Pancreatiac Cancer. The app allows users to signup, login, view different raffles and make a donation to a raffle of their choice. 

##Tech Framework

Gems included in this project are:

- gem 'byebug'

- gem 'rails', '~> 6.0.3', '>= 6.0.3.2'

- gem 'sqlite3', '~> 1.4'

- gem 'puma', '~> 4.1'

- gem 'sass-rails', '>= 6'

- gem 'bcrypt'

- gem 'dotenv'

- gem 'omniauth-google-oauth2'

- gem 'dotenv-rails'

- gem 'omniauth'

- gem 'omniauth-rails_csrf_protection'


Program's database consists of 3 tables and relationships are set as follows: - Users (has many donations through raffles, has many donations) - Raffles (has many users through donations, has many donations) - Donations (belong to a user, belong to a raffle)

Program utilizes nested routes and forms to streamline and speed up data entry. Effort has been made to make the code dry through the use of reusable methods.

To use the program after downloading it, make sure to run bundle install, run migrations and then run the server. 

