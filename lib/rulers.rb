# frozen_string_literal: true

require 'rulers/version'
require 'rulers/array'

module Rulers
  class Application
    def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      [200, { 'Content-Type' => 'text/html' },
       [text]]
    end

    def get_controller_and_action(env)
      _, cont, action, after =
        env['PATH_INFO'].split('/', 4)
      cont = cont.capitalize # "People"
      cont += 'Controller' # "PeopleController"
      [Object.const_get(cont), action]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    attr_reader :env
  end
end
