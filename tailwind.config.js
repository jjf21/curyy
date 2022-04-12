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
        'primary':'#8139df',
        'secondary':'#3e0075',
        'accent':'#ffe040',
      }
    },
  },
}
