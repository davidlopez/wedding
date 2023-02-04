module.exports = {
  theme: {
    extend: {
      backgroundImage: {
        'leaf': "url('/assets/leaf.svg')",
        'holdhands': "url('hold_hands_ring.jpg')",
        'm-leg': "url('m-leg.jpg')"
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
