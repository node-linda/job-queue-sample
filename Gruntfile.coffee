'use strict'

module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-notify'

  grunt.registerTask 'build', [ 'coffeelint', 'coffee' ]
  grunt.registerTask 'default', [ 'build', 'watch' ]

  grunt.initConfig

    coffeelint:
      options:
        max_line_length:
          value: 79
        indentation:
          value: 2
        newlines_after_classes:
          level: 'error'
        no_empty_param_list:
          level: 'error'
        no_unnecessary_fat_arrows:
          level: 'ignore'
      dist:
        files: [
          { expand: yes, cwd: 'coffee/', src: [ '**/*.coffee' ] }
        ]

    coffee:
      dist:
        files: [{
          expand: yes
          cwd: 'coffee/'
          src: [ '**/*.coffee' ]
          dest: 'js/'
          ext: '.js'
        }]

    watch:
      options:
        interrupt: yes
      dist:
        files: [ 'coffee/**/*.coffee' ]
        tasks: [ 'build' ]
