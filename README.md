# umai_test

Getting Started These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

Installing

Ruby version 2.7.0
rvm install 2.7.0
Clone the repository

- git clone https://github.com/badar-shafiq-1/umai_test.git
- cd umai_test

## Install Gems
- bundle install

## How to run the test suite
- rspec

How to run the rubocop
- rubocop

## Execution
- Before running configure DynamoDB and AWS Lambda on your local machine. Open application.yml and add the access_id ans secret_key of AWS there.

- ruby umai_test.rb
- Gems and plugins

- Used rspec gem for test coverage
- Used rubocop as a linter

## Workflow and functionality
- User can signup.
- User can add the posts.
- User can see the Ip addresses.
