# Gym Tracker

## Introduction

At the start of the year I began tracking my gym visits.  I have been looking for an excuse to learn [R](https://en.wikipedia.org/wiki/R_(programming_language)), and building my own data set seemed like a good first step.

The gym is located in one our offices.  I try my best to go every morning, but as you will see from the data this doesn't always happen.  I'm particularly bad on Mondays, which is just insight I gained from this project.

Every day is assigned a `gym_visit_type`.  Here are the values.

| Id  | Caption | Description                                                      |
| --- | ------- | ---------------------------------------------------------------- |
| 0   | Offsite | Sometimes I visit clients or work from one of our other offices. |
| 1   | Workout | Yippee!  I found my willpower.                                   |
| 2   | Lazy    | I went to work, but I didn't workout.  :(                        |
| 3   | Holiday | I had the day off                                                |

You can view the raw data [here](db/gym-visits.csv).

🏃🏋💪
David

## Requirements

You will need R installed.

This project was tested on Windows 10, using R 3.5.1.
