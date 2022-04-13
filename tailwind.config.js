module.exports = {
  content: [
    './app/views/**/*.html.{slim, erb}',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/inputs/*.rb'
  ],
  theme: {
    extend: {
      colors: {
        'primary': {
          lighter: '#f8edf4',
          light: '#8139df',
          DEFAULT: '#3e0075'
        },
        'pink': {
          DEFAULT: '#ed0a71'
        },
        'yellow': {
          DEFAULT: '#ffe040'
        },
        'green': {
          DEFAULT: '#45bfa7'
        }
      }
    },
  },
}
