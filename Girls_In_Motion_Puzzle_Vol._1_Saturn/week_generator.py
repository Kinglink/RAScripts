import json

# Initialize an empty list to store the weeks
weeks = []

# Define the number of days in a leap year
total_days = 366

# Initialize a counter for the day of the year
day_of_year = 1

# Iterate through the days and generate data
while day_of_year <= total_days:
    week_data = {
        "week": len(weeks) + 1,
        "name": f"Week {len(weeks) + 1}",
        "arrayOfDates": []
    }
    
    # Generate the dates for the week (up to 7 days)
    for _ in range(7):
        if day_of_year > total_days:
            break

        # Determine the month and day
        if day_of_year <= 31:
            month = 1
            day = day_of_year
        elif day_of_year <= 60:
            month = 2
            day = day_of_year - 31
        # Adjust for leap years
        elif day_of_year <= 91:
            month = 3
            day = day_of_year - 60
        elif day_of_year <= 121:
            month = 4
            day = day_of_year - 91
        elif day_of_year <= 152:
            month = 5
            day = day_of_year - 121
        elif day_of_year <= 182:
            month = 6
            day = day_of_year - 152
        elif day_of_year <= 213:
            month = 7
            day = day_of_year - 182
        elif day_of_year <= 244:
            month = 8
            day = day_of_year - 213
        elif day_of_year <= 274:
            month = 9
            day = day_of_year - 244
        elif day_of_year <= 305:
            month = 10
            day = day_of_year - 274
        elif day_of_year <= 335:
            month = 11
            day = day_of_year - 305
        else:
            month = 12
            day = day_of_year - 335

        # Add the date to the week's data
        week_data["arrayOfDates"].append({"month": month, "day": day})
        day_of_year += 1
    
    # Add the week data to the list
    weeks.append(week_data)

# Convert the list of weeks to JSON
json_data = json.dumps(weeks, indent=4)

# Write the JSON data to a file
with open("weeks_data.json", "w") as json_file:
    json_file.write(json_data)

print("Data has been generated and saved to 'weeks_data.json'")
