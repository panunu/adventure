class @Memory

  bag: [
    'init': true
  ]

  set: (key, value) -> @bag[key] = value

  add: (key, value) ->
    @bag[key] = [] if not @has(key)
    @bag[key].push(value)

  get: (key) -> @bag[key]

  has: (key) -> if @bag[key] then true else false
