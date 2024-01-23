# README



<img width="1408" alt="Screenshot 2024-01-23 at 8 52 01 AM" src="https://github.com/zremboldt/RootExperiences/assets/19367659/bd40565e-33f2-4e9d-9216-de8338a40434">



## Steps to run the project

Using Ruby version: 3.1.2

1. Run `bundle`
2. Run `rails db:purge db:create db:migrate db:seed`
3. Run `rails server`



## ❄️ Holiday Hackdays ❄️

Hey! Wanted to share a Rails project I was hacking on over the Holiday!

My main goal here was just to get more experience building things with Rails by starting from scratch. I thought it’d be fun to attempt building our “Root experience dashboard” so that when it comes time for the team to build it for real, I’ll hopefully have more useful thoughts and questions. Comparing how I accomplished things in Rails vs how Shivang or Vishal will accomplish them will help me learn. The way I modeled this is pretty simple (maybe not realistic but good for my experience):

A `Feature` is basically just a container that can hold, Enabled, Condition, and/or Bucket models.

In the old root-server/.env file we would’ve used two different envvars for something like:

`PAID_REFFERALS_ENABLED` and `PAID_REFFERAL_MARKETS`. But a Feature lets you group those kinds of related things together.

The dashboard lets you search for what you’re looking for and if you click into a feature you can make certain changes.



## TODOS

Add tags to features allowing you to filter them by team or other criteria.
