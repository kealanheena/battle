### [Makers Academy](http://www.makersacademy.com) - Week 3 Project

# Battle Challenge

## User Stories

```
```

## Code style

- OOD
- TDD

## Tech Used

- RSpec
- Ruby
- Capybara
- Sinatra

## Features

You'll be able to:

- Start a battle
- Enter names for each player
- Player 1 & 2 will be able to:
  - Attack
  - Receive damage
- See a victory page when you've defeated your opponent

## Getting Started

### Local Setup

```sh
$ git clone https://github.com/kealanheena/battle.git
```

```sh
$ cd battle
```

#### To Start

- Run "ruby  app.rb" file in terminal.
- Open [http://localhost:4567/](http://localhost:4567/)

## Running the tests

You can run tests by running "rspec" in battle file.

## Tests 

### Unit Tests

#### Game Class

- #initialize
  - initializes with a player 1 variable
  - initializes with a player 2 variable
- #attack
  - should increment the turn counter after an attack
  - should increment the turn counter by 2 after an attack

#### Player Class

- #initialize
  - stores the players name
  - initializes with a health of 60
- #receive_damage
  - should reduce the players health by 10
  - should reduce the players health by 20 if attacked twice
- #dead?
  - should start a player as alive
  - should still be alive after 5 attacks
  - should return true if a players hit points drop to 60
  - should return true if a players hit points below 60

### Feature Tests

- homepage
  - it says 'BATTLE TIME!'
  - it show players names on screen after they enter them
  - it shows player's 2 hp
  - enable player 1 to attack
  - enable player 2 to attack
  - a lose screen should be displayed when a players HP drops to 0

## Versioning

"battle" is using ruby version 2.6.3, to change ruby versions run "rvm install ruby-2.6.3" in terminal.
