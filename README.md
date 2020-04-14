### [Makers Academy](http://www.makersacademy.com) - Week 3 Project

# Battle Challenge

## User Stories

```
As two Players,
So we can play a personalised game of Battle,
We want to Start a fight by entering our Names and seeing them

As Player 1,
So I can see how close I am to winning
I want to see Player 2's Hit Points

As Player 1,
So I can win a game of Battle,
I want to attack Player 2, and I want to get a confirmation

As Player 1,
So I can start to win a game of Battle,
I want my attack to reduce Player 2's HP by 10

As two Players,
So we can continue our game of Battle,
We want to switch turns

As Player 1,
So I can see how close I am to losing,
I want to see my own hit points

As Player 1,
So I can lose a game of Battle,
I want Player 2 to attack me, and I want to get a confirmation

As Player 1,
So I can start to lose a game of Battle,
I want Player 2's attack to reduce my HP by 10

As a Player,
So I can Lose a game of Battle,
I want to see a 'Lose' message if I reach 0HP first

Additional User Stories
=======================

As a Player,
So I can play a suspenseful game of Battle,
I want all Attacks to deal a random amount of damage

As a lonely Player,
So I can keep my Battle skills up to scratch
I want to play a Computerised opponent

As a Player,
So I can enjoy a game of Battle with more variety,
I want to choose from a range of attacks I could make

As a Player,
So I can better enjoy a game of Battle,
I want some of my attacks to Paralyse an opponent (chance of losing their next attack)

As a Player,
So I can better enjoy a game of Battle,
I want one of my attacks to have a chance of Poisoning my Opponent (Opponent takes a small random amount of damage at the beginning of their turn)

As a Player,
So I can better enjoy a game of Battle,
I want to make an attack that has a chance of sending my Opponent to Sleep (Opponent definitely misses next turn)

As a Player,
So I can extend my joyous experience of Battle,
I want to have an attack that heals some of my Hit Points

As a Player,
So I can enjoy my game of Battle,
I want a sexy user interface
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
