#
#   GYM TRACKER
#   Visualises my gym activities using data collected in the db\ folder.
#
#   PLEASE NOTE
#   This script assumes the project root folder is also the current working
#   directory.
#

    # SECTION ONE ---------------------------------------------------------
    # Prep data -----------------------------------------------------------

    # Import raw data.
    gym_visits <- read.csv("./db/gym-visits.csv")
    gym_visit_types <- read.csv("./db/gym-visit-types.csv")
    days_of_week <- read.csv("./db/days-of-week.csv")

    # Add visit descriptions.
    gym_visits$gym_visit_type_description <- factor(
        gym_visits$gym_visit_type,
        levels = gym_visit_types$gym_visit_type,
        labels = gym_visit_types$gym_visit_type_description
    )

    # Add days of the week.
    gym_visits$day_of_week_name <- factor(
        gym_visits$day_of_week,
        order = TRUE,
        levels = days_of_week$day_of_week,
        labels = days_of_week$day_of_week_name
    )

    # Extract only the days where I attended the gym.
    # Used in two of the charts below.
    gym_visits_workout <- gym_visits[gym_visits$gym_visit_type == "1", ]



    # SECTION TWO ---------------------------------------------------------
    # Display data --------------------------------------------------------

    # Three charts will be displayed together.
    opar <- par(no.readonly = TRUE)
    layout(matrix(c(1, 2, 1, 3), 2, 2, byrow = TRUE))


    # Graph: Days by type.
    barplot(
        table(gym_visits$gym_visit_type_description),
        main="Days by Activity",
        ylab = "Frequency"
    )

    # Graph: Visits by day.
    # Ok to exclude weekends, the work gym is closed.
    weekend <- c("Saturday", "Sunday")
    by_day_table <- table(gym_visits_workout$day_of_week_name, exclude = weekend)
    by_day_label <- paste(names(by_day_table), "\n", by_day_table, sep = "")
    pie(
        by_day_table,
        labels = by_day_label,
        main = "Gym Visits by Day of Week",
        col = rainbow(length(by_day_label)),
        clockwise = TRUE
    )

    # Graph: Visits by weeknumber.
    plot(
        table(gym_visits_workout$week_number),
        main = "Gym Visits by Week Number",
        xlab = "Week Number",
        ylab = "Number of Visits",
        xlim = c(0, 28),
        ylim = c(0, 5)
    )


    # Display output.
    par(opar)
