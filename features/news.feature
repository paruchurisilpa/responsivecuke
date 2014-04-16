Feature: See topstories on the responsive news page

Background:
	Given I am on the mobile news page

Scenario: Audience wants to view today's top stories	
	Then we see one lead story
	And ten top stories
 