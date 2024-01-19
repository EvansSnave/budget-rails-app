// @ts-check
const { defineConfig, devices } = require('@playwright/test');

/**
 * Read environment variables from file.
 * https://github.com/motdotla/dotenv
 */
// require('dotenv').config();

/**
 * @see https://playwright.dev/docs/test-configuration
 */
module.exports = defineConfig({
  // ... other configurations ...
  use: {
    // Update this line with your app's hosted URL
    baseURL: 'https://railsbudgetapp-3bf39d51a2ed.herokuapp.com/', // Your app's hosted URL
    headless: true, // Run tests in headless mode
    // ... other settings
  },

  projects: [
    {
      name: 'chromium',
      use: {
        ...devices['Desktop Chrome'],
        headless: true, // Add this line to run in headful mode
      },
    },
    {
      name: 'firefox',
      use: {
        ...devices['Desktop Firefox'],
        headless: true, // Add this line to run in headful mode
      },
    },
    {
      name: 'webkit',
      use: {
        ...devices['Desktop Safari'],
        headless: true, // Add this line to run in headful mode
      },
    },
    // ... other projects ...
  ],

  // ... other configurations ...

  // webServer: {
  //   command: 'bundle exec rails s',
  //   url: 'http://127.0.0.1:3000',
  //   reuseExistingServer: !process.env.CI,
  // },
});
