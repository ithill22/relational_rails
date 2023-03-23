Iteration 2
CRUD
[ ] done

User Story 11, Conference Creation 

As a visitor
When I visit the Conference Index page
Then I see a link to create a new Conference record, "New Conference"
When I click this link
Then I am taken to '/parents/new' where I  see a form for a new parent record
When I fill out the form with a new parent's attributes:
And I click the button "Create Conference" to submit the form
Then a `POST` request is sent to the '/parents' route,
a new parent record is created,
and I am redirected to the Conference Index page where I see the new Conference displayed.
[ ] done

User Story 12, Conference Update 

As a visitor
When I visit a parent show page
Then I see a link to update the parent "Update Conference"
When I click the link "Update Conference"
Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
When I fill out the form with updated information
And I click the button to submit the form
Then a `PATCH` request is sent to '/parents/:id',
the parent's info is updated,
and I am redirected to the Conference's Show page where I see the parent's updated info
[ ] done

User Story 13, Conference Team Creation 

As a visitor
When I visit a Conference Teams Index page
Then I see a link to add a new adoptable Team for that parent "Create Team"
When I click the link
I am taken to '/parents/:parent_id/Team_table_name/new' where I see a form to add a new adoptable Team
When I fill in the form with the Team's attributes:
And I click the button "Create Team"
Then a `POST` request is sent to '/parents/:parent_id/Team_table_name',
a new Team object/row is created for that parent,
and I am redirected to the Conference Teams Index page where I can see the new Team listed
[ ] done

User Story 14, Team Update 

As a visitor
When I visit a Team Show page
Then I see a link to update that Team "Update Team"
When I click the link
I am taken to '/Team_table_name/:id/edit' where I see a form to edit the Team's attributes:
When I click the button to submit the form "Update Team"
Then a `PATCH` request is sent to '/Team_table_name/:id',
the Team's data is updated,
and I am redirected to the Team Show page where I see the Team's updated information
ActiveRecord
[ ] done

User Story 15, Team Index only shows `true` Records 

As a visitor
When I visit the Team index
Then I only see records where the boolean column is `true`
[ ] done

User Story 16, Sort Conference's Teams in Alphabetical Order by name 

As a visitor
When I visit the Conference's Teams Index Page
Then I see a link to sort Teams in alphabetical order
When I click on the link
I'm taken back to the Conference's Teams Index Page where I see all of the parent's Teams in alphabetical order
Usability
[ ] done

User Story 17, Conference Update From Conference Index Page 

As a visitor
When I visit the parent index page
Next to every parent, I see a link to edit that parent's info
When I click the link
I should be taken to that parent's edit page where I can update its information just like in User Story 12
[ ] done

User Story 18, Team Update From Teams Index Page 

As a visitor
When I visit the `Team_table_name` index page or a parent `Team_table_name` index page
Next to every Team, I see a link to edit that Team's info
When I click the link
I should be taken to that `Team_table_name` edit page where I can update its information just like in User Story 14