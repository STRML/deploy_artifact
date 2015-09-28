class Chef
  class Resource
    # Chef Resource class for cloudfiles_deploy
    class DeployArtifact < Chef::Resource
      def initialize(name, run_context = nil)
        super
        @resource_name = :deploy_artifact
        @provider = Chef::Provider::DeployArtifact
        @action = :deploy
        @allowed_actions = [:deploy]

        @file = name
        @path = '/opt'
        @owner = 'root'
        @group = 'root'
      end

      def file(arg = nil)
        set_or_return(:file, arg, :kind_of => [String]) # rubocop:disable HashSyntax
      end

      def path(arg = nil)
        set_or_return(:path, arg, :kind_of => [String]) # rubocop:disable HashSyntax
      end

      def owner(arg = nil)
        set_or_return(:owner, arg, :kind_of => [String]) # rubocop:disable HashSyntax
      end

      def group(arg = nil)
        set_or_return(:group, arg, :kind_of => [String]) # rubocop:disable HashSyntax
      end

      def before_symlink(arg = nil, &block)
        arg ||= block
        set_or_return(:before_symlink, arg, :kind_of => [Proc, String]) # rubocop:disable HashSyntax
      end

      def restart_command(arg = nil, &block)
        arg ||= block
        set_or_return(:restart_command, arg, :kind_of => [Proc, String]) # rubocop:disable HashSyntax
      end
    end
  end
end
