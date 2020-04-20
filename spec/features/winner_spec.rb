describe "winner", type: :feature do
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
