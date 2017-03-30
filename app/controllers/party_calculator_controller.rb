class PartyCalculatorController < ApplicationController

  def index
    if params[:creature_id]
      @creature = Creature.find_by(id: params[:creature_id])
      load_calculator if @creature && valid_calculator_params?
    end
  end

  private

  def load_calculator
    @calculator = ExpCalculator.new(
        @creature.exp,
        params[:diff_vocations].to_i,
        params[:party_size].to_i
    )
  end

  def valid_calculator_params?
    params[:diff_vocations].present? &&
        params[:party_size].present? &&
        params[:diff_vocations].to_i > 0 &&
        params[:party_size].to_i > 0 &&
        (params[:party_size] >= params[:diff_vocations])
  end

end