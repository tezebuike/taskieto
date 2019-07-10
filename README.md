# Taskieto

Taskieto is a simple todo app built with Rails application that allows you to:
 - Create tasks
 - View all tasks at the same time
 - Complete single tasks
 - Delete a completed task

In order to set this application run running on your machine, you would need to note the following.

## Prerequisites

You would need to have the following running:
  - Ruby `at least version 2.4.2`
  - Database - `postgreSQL`
  - Bundler

## Setting Up

  1. Clone the repository into the folder of your choice
```
$ git clone https://github.com/tezebuike/taskieto.git
cd taskieto
```
  2. Run setup to install the gems configurations and setup the database.

```
$ rails setup
```

  3. Run rails server

```
$ rails s
```

  4. Go to http://localhost:3000/

## To run the test suite and check coverage
  On the terminal, navigate to taskieto folder
  * Type `rspec` to run the full tests specs
  * Go to Coverage/index.html to check the coverage
