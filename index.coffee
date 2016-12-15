
loader = require "webpack-loader"
coffeelint = require("coffeelint").lint

defaults =
  config: ".coffeelintrc"
  reporter: ( results ) ->
    w = ""; e = ""
    for r in results
      m = "\n  :#{r.line} [#{r.rule}]
          \n  #{r.message}
          \n  #{r.context or ""}
          "
      switch r.level
        when "warn" then w += m
        when "error" then e += m

    if w then @emitWarning w
    if e then @emitError e

module.exports = loader "coffeelint", defaults, ( input, options ) ->

  # get lint errors
  data = coffeelint input, options.override or { }
  # normalize
  for item in data
    item.line = item.lineNumber
    delete item.lineNumber
  # pass to reporter
  options.reporter.call this, data

  return input

