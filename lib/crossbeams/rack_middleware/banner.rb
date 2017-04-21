module Crossbeams
  module RackMiddleware
    class Banner
      def initialize(app, options = {})
        @app      = app
        @appname  = options[:appname] || 'the app'
        @template = ERB.new(File.read(File.expand_path(options[:template]))).result if options[:template] && File.exist?(File.expand_path(options[:template]))
      end

      def call(env)
        env['crossbeams.appname'] = @appname
        env['crossbeams.banner'] = @template if @template
        @app.call(env)
      end
    end
  end
end
