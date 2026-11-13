# Lab 1: FSD, but on Kigali roads

Name: Agbor Fidelis Agbor
GitHub: aagbor-dev

## What this project does
The car drives from ALU Rwanda to the Kigali Convention Centre along a road stored as a Python list. Each item is a 100 m segment: a speed limit, "zebra", "bus" or plain "road". I completed the 10 TODO functions in road_simulation.py. I did not change engine.py, transit_program.py or index.html.

## Functions
- is_valid_sign: accepts only text that is "bus", "zebra" or a number from 20 to 100.
- get_sign_type: returns "bus", "zebra", "speed" or "road".
- get_speed_limit: returns the sign's number for a speed sign, otherwise keeps the current limit.
- get_target_speed: returns 0 while the stop timer is above 0, otherwise the limit.
- adjust_speed: adds 5 when below the target and subtracts 20 when above, never going past the target.
- count_signs: loops over the road and counts speed signs, zebras and buses.
- ask_for_number: keeps asking until the input is a whole number in range, using try/except.
- insert_sign and replace_sign: check the position or index first and return False if it is out of range.
- get_journey_summary: counts every segment that is not "road" and multiplies the segment count by 100 for the length.

## Log analyser
analyze_log.sh reads transit_session.log (or the file given as the first argument). It prints the number of sessions, zebra stops and lane changes, plus the latest driver and their top speed. If the file does not exist it prints an error and exits with code 1.

## How to run
1. Open a terminal in the lab1_aagbor-dev folder.
2. Run `python road_simulation.py`.
3. Enter a driver name and use the road editor menu.
4. Choose 5 to start driving, open the link, then press Enter in the terminal.
5. When the trip ends, run `bash analyze_log.sh`.

## Problems I ran into
When I first tried to run the program, I typed python3 road_simulation.py in the VS Code terminal and got "Python was not found". I found out that on Windows, python3 can just be a Microsoft Store shortcut. I fixed it by using python road_simulation.py instead.

When I pushed my work to GitHub, I got "Repository not found". I had set up the remote but never created the repo on GitHub. I made an empty repo called lab1_aagbor-dev, ran git push again, and it worked.
