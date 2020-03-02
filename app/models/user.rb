class User < ApplicationRecord
  second_level_cache
  enum role: {superadmin: 100, admin: 50, user: 0}

  # 显示名称
  def display_name
    name || username
  end

  def manager?
    superadmin? || admin?
  end


  def visible_users
    User.where('role <= ?', User.roles[role])
  end

   def visible_role_names
     User.roles.select{|_, val| val <= User.roles[self.role]}
   end

  def role_name
    if superadmin?
      '超级管理员'
    elsif admin?
      '系统管理员'
    else
      '普通用户'
    end
  end

end
