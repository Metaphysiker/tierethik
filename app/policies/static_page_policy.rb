class StaticPagePolicy < Struct.new(:user, :dashboard)
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def dashboard?
    user.admin?
  end
end
