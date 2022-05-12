# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    user_record?
  end

  def create?
    user_record?
  end

  def new?
    true
  end

  def update?
    user_record?
  end

  def edit?
    update?
  end

  def destroy?
    user_record?
  end

  def user_record?
    @record&.user_id ? @record.user_id == @user.id : false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(user_id: @user.id)
    end

    private

    attr_reader :user, :scope
  end
end
