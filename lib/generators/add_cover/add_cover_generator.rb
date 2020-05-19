class AddCoverGenerator < Rails::Generators::NamedBase
  #source_root File.expand_path('templates', __dir__)
  def add_cover_to_model
    inject_into_file "app/models/#{singular_table_name}.rb", after: "class #{singular_table_name.capitalize} < ApplicationRecord\n" do <<-'RUBY'
      has_one_attached :cover
    RUBY
    end

    inject_into_file "app/views/#{plural_table_name}/_form.html.erb", after: "<div class=\"form-inputs\">\n" do <<-'RUBY'
    <%= f.file_field :cover %>
    RUBY
    end

    inject_into_file "app/controllers/#{plural_table_name}_controller.rb", after: "params.require(:#{singular_table_name}).permit(" do <<-'RUBY'
:cover,
RUBY
    end

    gem "mini_magick"
    gem "font-awesome-rails"
    run "bundle install"
  end
end
