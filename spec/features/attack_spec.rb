describe "homepage", type: :feature do
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

  scenario "electric attacks should decrease health by 5" do
    sign_in_and_play
    click_button 'Electrocute'
    expect(page).to have_content("Harry's Health: 55")
  end

  scenario "a player turn should be skipped if they are paralysed" do
    sign_in_and_play
    srand(6)
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
end
