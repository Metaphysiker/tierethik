class PostSearch
  def initialize(search_inputs)
    @search_term = search_inputs[:search_term] || nil
  end

  def search
    query = Post.all

    unless @search_term.nil? || @search_term.blank?
      query = query.posts_ilike("%#{@search_term}%")
    end

    query.distinct
  end
end
