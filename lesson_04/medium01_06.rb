class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer2
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# these are functionally eqivalent, however self is not really
# required in the Computer2 class.  Ruby style guides says
# to avoid self when not required.
