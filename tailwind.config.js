module.exports = {
  theme: {
    extend: {
      backgroundImage: {
        'leaf': "url('/assets/leaf.svg')"
      }
    }
  },
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
}
