# laddr

Laddr -- pronounced "ladder" and named after the essential tool for fire brigades -- is a web application designed to create an online home-base for [Code for America brigades](http://brigade.codeforamerica.org).

## Features
- [Projects Directory]
  - Each project can have a users URL, developers URL, markdown README
  - Projects can be tagged by topic, tech, and event
  - [Projects list available via dynamic CSV] for linking to [CfAPI](https://github.com/codeforamerica/cfapi)
- [Members Directory]
  - Members can upload photos, write a bio in markdown, and tag themselves with topic and tech tags
- Meetup.com integration
  - Upcoming events pulled from meetup.com API for homepage sidebar
  - Current and next event highlighted
  - Members can checkin to current event and optionally pick what project they're working on
- Project Updates
  - Any project member can post markdown-formatted "updates" to a project
  - Updates show up on the [project's page], the [home page], the [global updates feed]
  - [RSS feeds for global] and [per-project updates]
- Project Buzz
  - Any site member can log a media article about a project
  - Attach photo and an exerpt
  - Buzz shows up on the [project's page], the [home page], and the [global buzz feed]
- [Big Screen]
  - A live status page for display during events
  - Latest member checkins to event
  - Markdown box for announcements
- Localizable
  - Language selector in the footer for visitors and configurable site-wide default language
  - English and Spanish translations available
  - Croatian and Korean translations in progress

## Brigades using Laddr
- [Code for Philly](http://codeforphilly.org)
- [Code for Miami](http://projects.codeformiami.org)
- [Code for Croatia](http://codeforcroatia.org)
- [Creative Commons Korea](http://labs.cckorea.org/)
- [Code for Cary](http://www.codeforcary.org/)
- [Code for Charlotte](http://codeforcharlotte.org)

## Requirements
Laddr is built on the Emergence PHP framework and deployement engine, and requires an Emergence server to host it.

Emergence takes just a few minutes to setup on a Linux VM, and is designed to have a fresh system to itself. Once launched
it will configure services on the machine as-needed to host an instance of the application along with any other
sites, clones, or child sites. The guides for Ubuntu and Gentoo are most up-to-date: http://emr.ge/docs/setup

## Installation via Emergence (linked child)
-  Create an emergence site that extends v1.laddr.io (access key: MaPG1YxorgU6ew64)

## Installation from Git
-  Create an emergence site that extends skeleton.emr.ge (access key: 8U6kydil36bl3vlJ)
-  Upload contents of git repository using WebDAV client (CyberDuck is the best open-source option)

## Vagrant

From the project root run `vagrant up` and Vagrant will download a Ubuntu 14.04 image, download the Emergence quick install script, and execute said script.

Vagrant will forward the following ports:

* 9021 = 9021
* 9023 => 9023
* 80 => 8080

You can access the emergence console on `127.0.0.1:8080`. If you have software running that is operating on port `8080` then you'll need to specify a different port to forward to.

When the box has fully initialized and you can access the emergence console then you'll be able to create a new site. Emergence has some sort of voodoo magic that can pull in the Laddr code and run it. As a note, CORS protection will prevent you from creating a user and logging in. To prevent that you'll need to provided a comma deliminated list of alernate hostnames: `localhost:8080`, `127.0.0.1:8080`. The PHP code that drives Laddr will iterate over that array.

[Projects Directory]: http://codeforphilly.org/projects
[Projects list available via dynamic CSV]: http://codeforphilly.org/projects.csv
[Members Directory]: http://codeforphilly.org/people
[project's page]: http://codeforphilly.org/projects/Bike_Route_Tracker
[home page]: http://codeforphilly.org
[global updates feed]: http://codeforphilly.org/project-updates
[RSS feeds for global]: http://codeforphilly.org/project-updates?format=rss
[per-project updates]: http://codeforphilly.org/project-updates?format=rss&ProjectID=40
[global buzz feed]: http://codeforphilly.org/project-buzz
[Big Screen]: http://codeforphilly.org/bigscreen
