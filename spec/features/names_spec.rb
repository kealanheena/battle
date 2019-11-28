describe "homepage", type: :feature do
  scenario "it says Testing infrastructure working!" do
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

  scenario "enable player to attack" do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content("Kealan attacked Harry")
  end

  

end