
loader = require "webpack-loader"
coffeelint = require("coffeelint").lint

defaults =
  config: ".coffeelintrc"
  reporter: ( results ) ->
    for r in results
      console.log """\n#{r.level}@#{r.line} - #{r.rule}
      #{r.message}\n#{r.context}"""

module.exports = loader "coffeelint", defaults, ( input, options ) ->

  # get lint erros
  data = coffeelint(input, options.override)
  # normalize
  for item in data
    item.line = item.lineNumber
    delete item.lineNumber
  # pass to reporter
  options.reporter.call this, data

