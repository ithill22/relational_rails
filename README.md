Iteration 1
CRUD
[x] done

User Story 1, Conference Index 

For each Conference table
As a visitor
When I visit '/Conferences'
Then I see the name of each Conference record in the system

[x] done

User Story 2, Conference Show 

As a visitor
When I visit '/Conferences/:id'
Then I see the Conference with that id including the Conference's attributes
(region, power 5, name, national champions)

[x] done

User Story 3, Team Index 

As a visitor
When I visit '/Team_table_name'
Then I see each Team in the system including the Team's attributes
(school name, mascot, rank, private)

[x] done

User Story 4, Team Show 

As a visitor
When I visit '/Team_table_name/:id'
Then I see the Team with that id including the Team's attributes
(data from each column that is on the Team table)

[x] done

User Story 5, Conference Teams Index 

As a visitor
When I visit '/Conferences/:Conference_id/Team_table_name'
Then I see each Team that is associated with that Conference with each Team's attributes
(data from each column that is on the Team table)

ActiveRecord

[x] done

User Story 6, Conference Index sorted by Most Recently Created 

As a visitor
When I visit the Conference index,
I see that records are ordered by most recently created first
And next to each of the records I see when it was created

[x] done

User Story 7, Conference Team Count

As a visitor
When I visit a Conference's show page
I see a count of the number of Teams associated with this Conference

Usability

[ ] done

User Story 8, Team Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Team Index
[ ] done

User Story 9, Conference Index Link

As a visitor
When I visit any page on the site
Then I see a link at the top of the page that takes me to the Conference Index

[ ] done

User Story 10, Conference Team Index Link

As a visitor
When I visit a Conference show page ('/Conferences/:id')
Then I see a link to take me to that Conference's `Team_table_name` page ('/Conferences/:id/Team_table_name') -->