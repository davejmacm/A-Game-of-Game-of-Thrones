# A-Game-of-Game-of-Thrones
CodeClan project

A Game of Game of Thrones is a fantasy application for Game of Thrones. 
The application will host/run a fantasy game of Game of Thrones [based on fantasy football; players add characters to their team and gain points for actions on screen].

## Resources
The project follows an MVC model to produce the backend, webserver and frontend. It utilises Ruby, Sinatra and PSQL.

The development environment was achieved on Mac from homebrew:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
From a terminal prompt.

## Operation
The project aims are detailed in the document 'A Game of Game of Throne brief' in the root of the repo.

At time of writing the Minimum Viable Product stated in the brief has been achieved allowing users to view characters, their team and edit team names. It also allows the admin additional privileges to actively run the fantasy league. These include complete CRUD actions for creation, insertion, editing, updating and deletion for both teams and characters. Views for these CRUD actions follow RESTful routing in the controller.rb file.

In additon the first two extensions have been achieved; allowing players to drop characters on their team and add un-assigned characters "free-agents" to their team. This also includes a limit check on the amount of characters permissible on a team.

## Testing
Within the db folder there are two files used for testing. 

The specs.rb file tests the setters and getters used to ensure the characters and teams can be created correctly and that information is able to be used. 

The seeds.rd file populates the tables with characters & teams and runs method checks (printed out to the terminal) to ensure all is working correctly.


## Author
David MacMurray

## Disclaimer
This application is not for commercial use, it is a project for educational purposes only
