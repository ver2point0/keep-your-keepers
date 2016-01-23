class KeeperPolicy < ApplicationPolicy
  
  def show?
      user.present? && (record.keep.user == user)
  end
  
  def update?
    show?
  end
  
  def destroy?
    show?
  end
  
end