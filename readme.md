
coffeelint-loader
===

About
---

Loader for coffeelint

### Works best as a preloader

```coffee
module:
  preLoaders: [
    test: /\.coffee$/
    exclude: /node_modules/
    loader: "coffeelint-loader"
  ]
```

### Accepts coffeelint options in override

```coffee
coffeelint:
  config: "path/to/config"
  reporter: ( results ) ->
    { rule, level, lineNumber, message, context } = results
    # print error here
  override:
    camel_case_classes: level: "error"
```

