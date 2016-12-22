module Crossbeams
  module RackMiddleware
    class Banner
      def initialize(app, options = {})
        @app      = app
        @appname  = options[:appname] || 'the app'
        if options[:template] && File.exists?(File.expand_path(options[:template]))
          @template = ERB.new(File.read(File.expand_path(options[:template]))).result
        end
      end

      def call(env)
        env['crossbeams.appname'] = @appname
        env['crossbeams.banner'] = @template if @template
        @app.call(env)
      end
    end
  end
end

