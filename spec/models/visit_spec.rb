require 'rails_helper'

RSpec.describe Visit, type: :model do

  it { is_expected.to belong_to :journey }

end

