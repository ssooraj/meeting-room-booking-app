class Admin < User
  before_save :set_role
  default_scope { joins(:role).where(" roles.name = 'admin' ") }



  protected

  def set_role
    self.role  ||= Role.find_by_name 'admin'
  end
end
