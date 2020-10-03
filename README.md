# Bookit

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/bookit`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bookit'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install bookit

## Usage

TODO: Write usage instructions here


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CesDelPino/bookit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/bookit/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


### Purpose and Scope
#### Description
The restaurant booking app will allow a restaurant staff member ("the user") that is handling bookings a reliable way to Make, Modify, and delete restaurant bookings for clients. They will also be able to display a summary of the whole days activities for any restaurant staff member.

Although developed to satisfy the requirements of the Coder Academy Terminal App assignmnet. The app was designed to eliminate pen and paper from the users workflow yet also provide a reliable method to keep track of incoming booking requests, guaranteeing there is no double bookings. It also allows for the storing of basic data for every booking including Names, Contact Details, and special requests.

The user will load the app, on their computer when a client calls to check for table availability. They will be offered options and prompts that facilitate data gathering. The bookings are stored in permanent memory via a JSON file, and transfered to working memory until the app is closed, where all changes will be written to the same file.

##### Scope and restriciton
Version 1 of the app will only cater for 1 hour reservations for the table on ONE day. The first reservation is at 12:00 and the last at 21:00. 

### List of features

1. Display all bookings. This feature will print out a table containing all of the bookings currently contained in working memory. To work it uses a bookings variable that is instantiated at the run faze by parsing through the DATABASE json document. Whn the display_all function is called from the options menu it uses the bookings variable, to creates an array of arrays that is used to generate the required format for display by the Terminal Table GEM.
2. Make a booking. This function will allow the user to select the time they wish to book. It is called from the options menu. It then iterates through the "open_slots" to make sure the booking is free, if its notavailable it will print an error to screen "That time is not available", and loop back to the opening options. If the time slot is open for bookings then it will call a function to get clinet data to populate the booking request. It will then store the data into working memory.
3. Modify a booking - This function overwrites ANY bookings. It request user input for the data then pushes the data into the bookings array thus saving it into working memory.
4. Delete a booking -  This function allows the user to overwrite the data of ANY booking and replce it with the standard value assignment used for open bookings. 
5. View open slots only - This feature iterates through all bookings, and returns an array of empty slots. It will then print to screen ONLY the availability for the day.


# TKAE NOTE ************************
### User Interaction

User interaction is taken care of by the, optoions menu loop. It loops continuously until the user exits the app. It allows the user to select the feature of the app.

1. To display all of the bookings, the user selects the first option in the menu. The app will show a table of all the bookings.

2. To make a booking the user selects the "make a booking" option. This brings up another menu of times representing the hour to book, 12, for 1200 13, for 1300 etc. The user is then prompted to enter the data as requested by the app. Name, Contact Phone, and any other notes. After user input, there is a conformation message displyed, and the user is taken back to the options menu.

3. To modify a booking, the user selects the "modify booking" option in the options loop. They are then presented with a list of times representing the desired timeslot to change. The user selects the timeslot and is prompted to enter information.

4. To delete a booking, the user selects the "delete booking" option from the initail options menu. They are then offered a list of times to change. One the user selects the time, a confirmation message is displayed.

5. To view open slots, the user selects this option from the options loop. They are then shown a list of available times for bookings, and are sent back to the options loop.

The user interface is driven by the TTY prompt GEM. Wherever possible, menus populate with options that will take care of errors apearing from the gets command. Instrucctions on how to selct options is in the form of a prompt to move cursor keys. The prompt disappears after the first movement. This sort of handling is ubiquotus as should not need further instruction. When the user is asked for data input. It is also done with TTY prompt.

### Implementation 

is taken care of by using a trello board. Yuo can see the boeard here
www.trello.com