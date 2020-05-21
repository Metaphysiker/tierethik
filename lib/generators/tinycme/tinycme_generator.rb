class TinycmeGenerator < Rails::Generators::NamedBase

  class_option :name_of_attribute, type: :string, default: 'content'

  @name_of_attribute = options['name_of_attribute']

  gem "tinymce-rails"
  run "bundle install"

  def create_config_file
    create_file "config/tinymce.yml", <<-FILE
  menubar: false
  toolbar:
    - styleselect | bold italic | undo redo | link | table | code | alignleft | aligncenter | alignjustify
  plugins:
    - link
    - table
    - code
      FILE
    end

    def change_form_file

      gsub_file "app/views/#{plural_table_name}/_form.html.erb", "<%= f.input :#{@name_of_attribute} %>", "<%= f.text_area :#{@name_of_attribute}, :class => "tinymce", :rows => 40, :cols => 120 %>"


      append_to_file "app/views/#{plural_table_name}/_form.html.erb" do
        "<%= tinymce_assets %> \n <%= tinymce %>"
      end
    end

  end
