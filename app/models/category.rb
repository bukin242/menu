class Category < ActiveRecord::Base
  acts_as_nested_set

  state_machine :state, initial: :new do
    state :new, :active, :locked

    event(:new)    { transition locked: :new }
    event(:active) { transition new: :active }
    event(:locked) { transition [:new, :active] => :locked }
  end
end
