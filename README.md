## Requirements

Ruby 3.0.0 installed on your machine
Bundler gem installed (gem install bundler)
A code editor of your choice (e.g. Visual Studio Code, Sublime Text, Atom)

## Setup

1. Go to the official Ruby download page at https://www.ruby-lang.org/en/downloads/.
2. Scroll down to the "Ruby 3.0.0" section and click the download link for your operating system (e.g. "Ruby 3.0.0 for Windows").
3. Follow the instructions for your operating system to download the Ruby installer.
4. Run the Ruby installer and follow the prompts to install Ruby 3.0.
5. Once the installation is complete, open a new terminal window and type ruby -v to verify that Ruby 3.0 is installed and working properly.
6. In your terminal, navigate to the root directory of your project.
7. Run `gem install bundle` in your terminal to install the gem.
8. Run `bundle install` in your terminal to install the required gems.
9. Check your Chrome browser version by clicking on the three dots on the top right corner of your browser, selecting "Help", and then "About Google Chrome". Take note of the version number.
10. Visit the ChromeDriver downloads page at https://sites.google.com/a/chromium.org/chromedriver/downloads.
11. Extract the downloaded file to a usr/local/bin on your computer.
12. Add the path to the ChromeDriver executable file to your system's PATH environment variable. On Windows, you can do this by editing the "Path" variable in the System Properties window. On Mac, you can do this by editing the `/etc/paths` file.
13. Verify that ChromeDriver is installed by running `chromedriver --version` in your terminal.

## Running Tests

1. In your terminal, navigate to the root directory of your project.
2. To run a specific feature file, run cucumber features/login.feature or features/InvoiceDetails.feature.
3. To run a specific tag, run cucumber -t @login or cucumber -t @information.
4. To run all feature files in the features directory, run `cucumber`.