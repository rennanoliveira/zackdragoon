class ExpCalculator

  BONUS_PERCENT = {
      '1' => 1,
      '2' => 1.1,
      '3' => 1.4,
      '4' => 1.8
  }

  def initialize(base_exp, diff_vocations, party_size)
    @base_exp = base_exp
    @diff_vocations = diff_vocations
    @party_size = party_size
  end

  def party_exp
    @party_exp ||= (base_exp * shared_bonus)/party_size
  end

  def full_stamina_exp
    party_exp * 1.5
  end

  def empty_stamina_exp
    party_exp * 0.5
  end

  private

  attr_reader :base_exp, :diff_vocations, :party_size

  def shared_bonus
    BONUS_PERCENT[party_size.to_s]
  end

end