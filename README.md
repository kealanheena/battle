### [Makers Academy](http://www.makersacademy.com) - Week 3 Project

# Battle Challenge

<img src="./public/img/battle.png">

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

=======================
Additional User Stories
=======================

As a Player,
So I can play a suspenseful game of Battle,
I want all Attacks to deal a random amount of damage

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
So I can better enjoy a game of Battle,
I want one of my abilities to heal me for a random amount of health.

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
- HTML
- CSS
- Bootstrap

## Features

You'll be able to:

- Start a battle
- Enter names for each player
- Player 1 & 2 will be able to:
  - Attack
  - Receive damage
  - Poison your opponent(recieve small amount of damage each turn)
  - Paralyse your opponent(skip your go)
  - Put your opponent asleep(skip your go)
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

### Game Class

- #attack
  - should increment the turn counter after an attack
  - should increment the turn counter by 2 after an attack
- #special_attack
  - should increment the turn counter after an attack
  - should increment the turn counter by 2 if immobilised
- #sleep_spell
  - should increment the turn counter after an attack
  - should increment the turn counter by 2 if immobilised
- #heal_spell
  - should increment the turn counter after an attack
  - should increment the turn counter by 2 if immobilised
- #poison_damage
  - should do additional damage if true
  - it should do nothing if false
- #over?
  - should return true if a player is dead
  - should return false if both players are alive
- #self.instance
  - should return an instance of the 'Game' class

### Player Class

- #initialize
  - stores the players name
- #get_damage
  - should reduce the players health by 10 when 10 is passed as an argument
  - should reduce the players health by 20 if attacked twice with 10 as an argument
- #dead?
  - should start a player as alive
  - should still be alive after receiving 50 damage
  - should return true if a players hit points drop to 60
  - should return true if a players hit points below 60
- #special_attack
  - should deal 5 damage
- #sleep_spell
  - should add the immobilised status to the status array when sran(1) is called
  - should return nil when srand(6) is called
- #heal
  - should add 10 to your health
  - should add 5 to your health
  - shouldn't heal you past your max health(60)
  - shouldn't heal you past your max health(60)
- #poisoned?
  - should return false if player doesn\'t have poisoned status
  - should return true if player has poisoned status
- #immobilised?
  - should return false if player doesn't have immobilised status
  - should return true if player has immobilised status

### Status Class

- #add
  - should add a status to the current array
  - should add different statuses to the current array
  - should be able to add multiple statuses to the current array
  - should not add the same status twice
- #remove
  - should remove statuses
  - should only remove the specified statuses
  - should retrun the current array if the remove item is not present
- #effect?
  - should return true when the status is in the current array
  - should return false when the status is not in the current array

### Feature Tests

### Homepage

- it says 'BATTLE TIME!'

### Player Info

- it show players names on screen after they enter them
- it shows player 1's hp
- it shows player 2's hp
- a player should see be able to see if they're poisoned

### Attack

- enable player 1 to attack
- enable player 2 to attack
- poison attacks should decrease health by 5
- electric attacks should decrease health by 5
- a player turn should be skipped if they are paralysed
- sleep attack should should not decrease health
- a players turn should be skipped when the sleep attack is used
- a players health should not go over 60
- a players health should be healed by 10 points when srand(6) is run

### Winner

- a win screen should be displayed when a player 2 HP drops to 0
- a lose screen should be displayed when a player 1 HP drops to 0

## Versioning

"battle" is using ruby version 2.6.3, to change ruby versions run "rvm install ruby-2.6.3" in terminal.
