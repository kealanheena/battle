describe "player info", type: :feature do
  scenario "it show players names on screen after they enter them" do
    sign_in_and_play
    expect(page).to have_content("Kealan vs. Harry")
  end

  scenario "it shows player 1's hp" do
    sign_in_and_play
    expect(page).to have_content("Harry's Health: 60")
  end

  scenario "it shows player 2's hp" do
    sign_in_and_play
    expect(page).to have_content("Kealan's Health: 60")
  end

  scenario "a player should see be able to see if they're poisoned" do
    sign_in_and_play
    srand(6)
    click_button 'Poison'
    expect(page).to have_content("Harry's (PSN'd)")
  end
end
