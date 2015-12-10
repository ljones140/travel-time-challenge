require 'rails_helper'

RSpec.describe Journey, type: :model do

  it { is_expected.to have_many :visits }

end
