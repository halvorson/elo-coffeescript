{spawn} = require 'child_process'

createExecCallback = (command, options) -> (callback) -> spawn(command, options, stdio: 'inherit').on 'exit', (code) -> if code == 0 then callback?() else process.exit code

build = createExecCallback 'coffee', ['-o', 'lib', '-c', 'src/']
clean = createExecCallback 'rm', ['-rf', 'lib']
publish = createExecCallback 'npm', ['publish', '--force']
test = createExecCallback 'mocha', ['-r', 'should', '--compilers', 'coffee:coffee-script', '-R', 'list', '--colors']

# tasks
task 'build', 'transpile src/*.coffee to lib/*.js', (options) -> clean -> build()
task 'clean', 'delete everything in lib/', (options) -> clean()
task 'publish', 'clean, build & publish', (options) -> clean -> build -> publish()
task 'test', 'run tests with mocha', (options) -> clean -> build -> test()