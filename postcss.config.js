//release: bin/rails db:migrate 
web: bundle exec bin/rails server -p $PORT -e $RAILS_ENV
console: bundle exec bin/rails console

module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}
