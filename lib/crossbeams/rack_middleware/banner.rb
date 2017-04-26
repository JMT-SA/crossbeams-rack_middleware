module Crossbeams
  module RackMiddleware
    # A banner can be defined using markup in the host Rack app
    # and consumed in a mounted Rack app.
    #
    # The template option should contain the banner HTML which
    # is passed through Erubis.
    #
    # Example:
    #    use Crossbeams::RackMiddleware::Banner, template: 'views/_page_banner.erb'
    #
    class Banner
      # @param app [RackApp] the rack app.
      # @param options [Hash] options for the banner.
      def initialize(app, options = {})
        @app      = app
        @appname  = options[:appname] || 'the app'
        @template = Erubis::Eruby.new(File.read(File.expand_path(options[:template]))).result if options[:template] && File.exist?(File.expand_path(options[:template]))
      end

      # Sets the environment variables for +crossbeams.appname+
      # and +crossbeams.banner+ using the options passed to the constructor.
      # @param env [Hash] the Rack environment variables.
      def call(env)
        env['crossbeams.appname'] = @appname
        env['crossbeams.banner']  = @template if @template
        @app.call(env)
      end
    end
  end
end
