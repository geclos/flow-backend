module Core
  class Engine < ::Rails::Engine
    isolate_namespace Core

    initializer :set_factory_path, after: 'factory_girl.set_factory_paths' do
      if defined? FactoryBot
        FactoryBot.definition_file_paths << File.expand_path('../../../spec/factories', __FILE__)
      end
    end
  end
end
