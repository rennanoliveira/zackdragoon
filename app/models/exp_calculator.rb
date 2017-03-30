class ExpCalculator

  BONUS_PERCENT = {
      '1' => 1.2,
      '2' => 1.3,
      '3' => 1.6,
      '4' => 2.0
  }

  FULL_STAMINA = 1.5
  EMPTY_STAMINA = 0.5

  def initialize(base_exp, diff_vocations, party_size)
    @base_exp = base_exp
    @diff_vocations = diff_vocations
    @party_size = party_size
  end

  def party_exp
    @party_exp ||= calculate_exp
  end

  def full_stamina_exp
    party_exp * FULL_STAMINA
  end

  def empty_stamina_exp
    party_exp * EMPTY_STAMINA
  end

  def party_bonus
    return 1 if party_size == 1
    BONUS_PERCENT[diff_vocations.to_s]
  end

  def exp_with_bonus
    base_exp * party_bonus
  end

  private

  attr_reader :base_exp, :diff_vocations, :party_size

  def calculate_exp
    return 0 if diff_vocations > party_size
    (exp_with_bonus/party_size).floor.to_i
  end

end