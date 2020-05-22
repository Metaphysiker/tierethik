class AddSearchFieldGenerator < Rails::Generators::NamedBase
  #source_root File.expand_path('templates', __dir__)
  def add_search_field_to_model
    run "rails g migration AddSearchFieldTo#{plural_table_name.capitalize} search_field:text"
    run "rails db:migrate"
  end

  def  add_update_search_field
    inject_into_file "app/models/#{singular_table_name}.rb", after: "class #{singular_table_name.capitalize} < ApplicationRecord" do <<-'RUBY'
before_save :update_search_field
scope :#{plural_table_name}_ilike, ->(search_term) { where("search_field ILIKE ?", search_term) }

def update_search_field
  self.search_field =
[
 ""
].compact.join(' ')
end
RUBY
    end
  end

  def add_search_class
    create_file "app/models/#{singular_table_name}_search.rb" do <<-'RUBY'
class #{singular_table_name.capitalize}Search
  def initialize(search_inputs)
    @search_term = search_inputs[:search_term] || nil
  end

  def search
    query = #{singular_table_name.capitalize}.all

    unless @search_term.nil? || @search_term.blank?
      query = query.#{plural_table_name}_ilike("%\#{@search_term}%")
    end

    query.distinct
  end
end
      RUBY
    end
  end

  def add_search_controller
    create_file "app/controllers/#{singular_table_name}_search_controller.rb" do <<-'RUBY'
class #{singular_table_name.capitalize}SearchController < ApplicationController
  def search_#{plural_table_name}
    if params[:search_inputs].present?
      @search_inputs = OpenStruct.new(params[:search_inputs])
    else
      @search_inputs = OpenStruct.new()
    end
  @#{plural_table_name} = #{singular_table_name}Search.new(@search_inputs).search
  #@animals = @animals.page(params[:page])

    respond_to do |format|
      format.js
    end
  end
end
      RUBY
    end
  end

  def add_route
    route "get '/#{plural_table_name}/search_#{plural_table_name}', to: '#{plural_table_name}#search_animals', as: '#{plural_table_name}_animals'"
  end

end
