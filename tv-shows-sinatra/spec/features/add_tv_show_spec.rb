require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "successfully add a new show" do
    visit "/television_shows/new"

    fill_in "title", with: "Battlestar Galactica"
    fill_in "network", with: "SciFi"
    fill_in "starting_year", with: "2000"
    fill_in "ending_year", with: "2005"
    select "Fantasy", :from => "genre"
    fill_in "synopsis", with: "The last humans search for Earth and battle Cylons."

    click_button("Add TV Show")

    expect(page).to have_content("Battlestar Galactica (SciFi)")
  end

  scenario "fail to add a show with invalid information" do
    visit "/television_shows/new"

    fill_in "title", with: ""
    fill_in "network", with: "SciFi"
    fill_in "starting_year", with: "2000"
    fill_in "ending_year", with: "2005"
    select "Fantasy", :from => "genre"
    fill_in "synopsis", with: "The last humans search for Earth and battle Cylons."

    click_button("Add TV Show")

    expect(page).to_not have_content("Battlestar Galactica (SciFi)")
    expect(page).to have_content("Data not saved")
  end
end
