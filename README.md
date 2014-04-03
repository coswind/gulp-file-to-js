gulp-file-to-js
===============

Gulp plugin to covert a file into a JavaScript representation.

```
gulp = require 'gulp'
fileToJs = require 'gulp-file-to-js'

gulp.task 'build', ->
  gulp.src('template/**')
    .pipe(fileToJs())
    .pipe(gulp.dest('dist/template'))
```
