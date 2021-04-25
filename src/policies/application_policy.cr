abstract class ApplicationPolicy(T)
  getter user
  getter record

  # Swap out `User` for your user class, if needed!
  def initialize(@user : User, @record = nil)
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def delete?
    false
  end
end
