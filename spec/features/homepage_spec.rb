describe "homepage", type: :feature do
  scenario "it says 'BATTLE TIME!'" do
    visit('/')
    expect(page).to have_content("BATTLE TIME!")
  end
end
