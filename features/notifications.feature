Feature: Notifications
	In order to be kept updated on changes to topics
	As a user
	I want to receive notifications of new topics and comments.

	Background: 
		Given I am logged in as a normal user
		And I have access to a project

	Scenario: Subscribe to an existing topic
		Given a topic exists
		And I subscribe to that topic
		When a new comment is created for that topic
		Then I should receive a new notification
