describe "homepage", type: :feature do
  scenario "it says Testing infrastructure working!" do
    visit('/')
    expect(page).to have_content("Testing infrastructure working!")
  end
end