class AddManyToManyRelationshipGenerator < Rails::Generators::NamedBase
  class_option :model, type: :string, default: ""

  def add_relationship
    @first_model = singular_table_name.capitalize
    @second_model = options['model'].capitalize
    @timestamp = Time.now.strftime("%Y%m%d%H%M%S")

    migration_template "migration.rb", "db/migrate/#{@timestamp}_create_many_to_many_relationship_between_#{@first_model}_and_#{@second_model}.rb"

    #generate "scaffold", "#{singular_table_name.capitalize} title:string"
    #run "rails g migration AddSearchFieldTo#{plural_table_name.capitalize} search_field:text"
    run "rails db:migrate"



    inject_into_file "app/models/#{singular_table_name}.rb", after: "class #{singular_table_name.capitalize} < ApplicationRecord\n" do <<-FILE
before_save :update_search_field
scope :#{plural_table_name}_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

def update_search_field
  self.search_field =
[
 ""
].compact.join(' ')
end
FILE
    end

  end
end
