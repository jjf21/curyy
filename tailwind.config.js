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
          light: '#8139df',
          DEFAULT: '#3e0075'
        },
        'secondary':'#8139df',
        'accent':'#ffe040',
      }
    },
  },
}
