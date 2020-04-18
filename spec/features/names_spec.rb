describe "homepage", type: :feature do
  scenario "it says 'BATTLE TIME!'" do
    visit('/')
    expect(page).to have_content("BATTLE TIME!")
  end

  scenario "it show players names on screen after they enter them" do
    sign_in_and_play
    expect(page).to have_content("Kealan vs. Harry")
  end

  scenario "it shows player's 2 hp" do
    sign_in_and_play
    expect(page).to have_content("Harry's Health: 60")
  end

  scenario "enable player 1 to attack" do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to_not have_content("Harry's Health: 60")
  end

  scenario "enable player 2 to attack" do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Attack'
    expect(page).to_not have_content("Kealan's Health: 60")
  end

  scenario "poison attacks should decrease health by 5" do
    sign_in_and_play
    srand(1)
    click_button 'Poison'
    expect(page).to have_content("Harry's Health: 55")
  end

  scenario "a player should see be able to see if they're poisoned" do
    sign_in_and_play
    srand(6)
    click_button 'Poison'
    expect(page).to have_content("Harry's (PSN'd)")
  end

  scenario "electric attacks should decrease health by 5" do
    sign_in_and_play
    click_button 'Electrocute'
    expect(page).to have_content("Harry's Health: 55")
  end

  scenario "a player turn should be skipped if they are paralysed" do
    sign_in_and_play
    srand(7)
    click_button 'Electrocute'
    click_button 'Electrocute'
    expect(page).to have_content("Harry's Health: 50")
    expect(page).to have_content("Kealan's Health: 60")
  end

  scenario "sleep attack should should not decrease health" do
    sign_in_and_play
    click_button 'Sleep'
    expect(page).to have_content("Harry's Health: 60")
  end

  scenario "a players turn should be skipped when the sleep attack is used" do
    sign_in_and_play
    srand(7)
    click_button 'Sleep'
    click_button 'Electrocute'
    expect(page).to have_content("Harry's Health: 55")
  end

  scenario "a win screen should be displayed when a player 2 HP drops to 0" do
    sign_in_and_play
    Game.instance.attack(59)
    2.times {
      click_button 'Attack'
    }
    expect(page).to have_content("Winner: Kealan")
  end

  scenario "a lose screen should be displayed when a player 1 HP drops to 0" do
    sign_in_and_play
    click_button 'Attack'
    Game.instance.attack(59)
    2.times {
      click_button 'Attack'
    }
    expect(page).to have_content("Winner: Harry")
  end

end
