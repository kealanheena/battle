describe "homepage", type: :feature do
  scenario "it says Testing infrastructure working!" do
    visit('/')
    expect(page).to have_content("Testing infrastructure working!")
  end

  scenario "it show players names on screen after they enter them" do
    visit('/')
    fill_in "player_1", with: "Kealan"
    fill_in "player_2", with: "Harry"
    click_on "Submit"
    expect(page).to have_content("Kealan vs Harry")
  end
end