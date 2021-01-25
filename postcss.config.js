//release: bin/rails db:migrate 
web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV 

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
