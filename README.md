# Student Organization Management Application
By now you should be familiar with basic sinatra apps and creating simple websites.  This problem will give you a chance to demonstrate your proficiency with the web by writing code for controllers, authentication, views, and basic HTML forms with a little bit of CSS. We're going full [CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete) and building a student oranization management application.

The problem is broken into 4 parts.  You will need to complete each part to move on. We've given approximate timing for each part.  If you find you are taking a lot longer be sure to ask questions.

## Objectives

### Part 1: Authentication (Timing ~ 30 min)

Authentication is a central concern of most web applications.  We're going to start by creating a simple app that does nothing more than authenticate a student.


#### Student Model

You have an empty `Student` model and a database with a `students` table.  Add validations to the `Student` model which guarantee the following:

1. Every student has an email
2. Every student's email is unique
3. Every email looks like `* @ *.*`
4. Every student has a password

You should not store the student's password directly in the database.

#### Sign Up, Log In, Log Out

Create views to allow a student to:

1. Sign up as a new student
2. Log in as an existing student
3. Log out as an existing student

### Part 2: Organizations  (Timing ~ 30 min)
We have students and organizations.
* Students can be members of many organizations.
* Organizations need leadership, so an organization belongs to president.

#### Associations

We've already defined the three models for you.  You'll need to create the associations between them.

The `Student` model should have:

1. ``student.presidencies
`` should return the list of organization led by the student
2. ``student.organizations`` should return the list of organization the student is a member, but not a leader

To be clear, ```presidencies``` and ```organizations``` should return completely different results.

The `Organization` model should have:

1. ``organization.president`` should return the student that is leading the organization
2. ``organization.members`` should return a list of members

To help you along your way, we recommend reviewing the ActiveRecord documentation, specifically the available options for the association methods you'll be using.

Once your associations have been set up, you should be able to run ```bundle exec rake db:seed``` without any errors.  This will populate the data for you.

### Part 3: CRUD It Up (Timing ~ 45 min)

With student authentication in place it's time to add the functionality needed to manage organizations. As a user to the application, you must be able to do the following:

#### Minimum

* View all organizations
* View a single organization; the organization page should look similar to the [mockup](mockup.png)
* Create a new organization
* Delete an organization

#### Stretch

* Edit

### Part 4: AJAXify it (Timing ~ 30 min)
On the page that lists all the organizations, add the form for creating a new organization.  Use AJAX on this form so that when a student adds a new organization, that new organization is appended to the list of organization without refreshing the page.
