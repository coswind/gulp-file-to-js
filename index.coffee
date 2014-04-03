gutil = require 'gulp-util'
es = require 'event-stream'
stringToJs = require 'string-to-js'

module.exports = ->
    es.through (file)->
        if file.isNull()
            this.emit 'data', file
            return
        if file.isStream()
            this.emit 'error', new Error 'gulp-file-to-js: Streaming not supported'
            return
        data = stringToJs file.contents.toString('utf8')
        dest = gutil.replaceExtension file.path, '.js'

        file.contents = new Buffer(data)
        file.path = dest
        this.emit 'data', file
