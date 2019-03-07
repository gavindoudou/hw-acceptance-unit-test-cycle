Feature: create movie

  As a rottenpotatoes user 
  So that I am able to manage movies list
  I want to create a new movie

Background: movies in database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |


Scenario: creating a new movie
  When I am on the RottenPotatoes home page
  And I follow "Add new movie"
  And I fill in "Title" with "The Magnificent Six"
  And I select "G" from "Rating"
  And I select "2022" from "movie_release_date_1i"
  And I select "August" from "movie_release_date_2i"
  And I select "11" from "movie_release_date_3i"
  And I press "Save Changes"
  Then I should see "The Magnificent Six was successfully created."
  And I should see "G"
  And I should see "2022-08-11 00:00:00 UTC" 