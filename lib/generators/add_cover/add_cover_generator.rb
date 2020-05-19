class AddCoverGenerator < Rails::Generators::NamedBase
  #source_root File.expand_path('templates', __dir__)
  def add_cover_to_model
    inject_into_file "#{singular_table_name}.rb", after: "class #{singular_table_name.capitalize} < ApplicationRecord\n" do <<-'RUBY'
      puts "Hello World"
    RUBY
    end
  end
end
