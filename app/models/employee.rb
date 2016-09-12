class Employee < User

  before_create :set_role
  default_scope { joins(:role).where(" roles.name = 'employee' ") }

  protected

  def set_role
    self.role  ||= Role.find_by_name 'employee'
  end
end
