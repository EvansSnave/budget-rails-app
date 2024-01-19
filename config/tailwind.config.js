const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors: {
        customBlue: '#3778c2',
      },
      fontFamily: {
        sans: ['"Proxima Nova"', 'sans-serif'], // Default stack
        'proxima-nova': ['"Proxima Nova"', 'sans-serif'], // Specific class for Proxima Nova if you want to keep it separate
      },
      fontWeight: {
        'light': 300, // Assuming 300 is the light weight for Proxima Nova
        'bold': 700, // Assuming 700 is the bold weight for Proxima Nova
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
