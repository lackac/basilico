# Basilico

Basilico is an event handling framework for the Mac OS X Pomodoro application. You can hook it into the application using the Script section of Pomodoro Preferences. More on this below. While being a framework for events, it also provides useful events out of the box.

## Requirements

Basilico runs on MacRuby. Actually the framework itself should run on any Ruby implementation (tests coming soon), but most of the built-in handlers use the `Basilico::AppHelpers` module which depends on some OS X frameworks.

## Built-in handlers

### Adium, iChat and Skype status and status message

These handlers update your status and status message when starting or ending a pomodoro. Your status will be set to "Do not disturb" or "Away" when starting a pomodoro with "in a Pomodoro" as the status message. Upon ending or resetting the pomodoro your status will be set back to "Online" or "Available" and your status message will be cleared.

### Pomodoro logger

The logger event handler logs every event with the current time and all the arguments into the file `~/pomodoro.log`.

## Setting up Basilico

You should have MacRuby installed. Then install the basilico gem:

    $ gem install basilico

The only thing left is setting up the Pomodoro app to send events to Basilico. You will find example scripts in the `scripts` directory of the repository. Open the preferences window of Pomodoro and setup the scripts in the Scripts tab.

The example scripts use rvm. You can simplify them if you have MacRuby installed some other way.

## License

(The MIT License)

Copyright (c) 2010 László Bácsi

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
